"
This Loader parses the text file related with the definition the type obtained from the rosmsg command. To be useful it requires to be installed in a ros suited linux (platform dependant) and sourced in the environment used to load the image.
It has several restrictions, but is good enough for prototyping 
"
Class {
	#name : #ROSCommandTypeLoader,
	#superclass : #ROSTypeLoader,
	#category : 'ROSDDS-Typeloader'
}

{ #category : #all }
ROSCommandTypeLoader >> browseAll [
	^ (Character lf split: (ROSSystemLauncher instance rosMsg: 'list'))
		inject: Dictionary new
		into: [ :acc :typeId | acc at: typeId put: (self typeDefinition: typeId). acc ].
]

{ #category : #'as yet unclassified' }
ROSCommandTypeLoader >> loadServiceTypeDefinition: aTypeId ifAbsent: aBlockClosure [
	| auxFirstLevel requestDefinition responseDefinition val isAbsent |
	[ 
	val := ROSSystemLauncher instance rosSrvShow: aTypeId.
	isAbsent := false ]
		on: Error
		do: [ isAbsent := true ].
	^ isAbsent
		ifTrue: aBlockClosure
		ifFalse:
			[ 
			val := '---' , String lf split: val.
			auxFirstLevel := (Character lf split: (val at: 1)) select: [ :str | (str beginsWith: ' ') not & (str size > 3) ].
			requestDefinition := self typeDefinitionForText: auxFirstLevel.
			auxFirstLevel := (Character lf split: (val at: 2)) select: [ :str | (str beginsWith: ' ') not & (str size > 3) ].
			responseDefinition := self typeDefinitionForText: auxFirstLevel.
			(DDSServiceTypeDefinition named: aTypeId request: requestDefinition response: responseDefinition)
				md5sum: (ROSSystemLauncher instance rosSrvMd5: aTypeId) withoutTrailingNewlines;
				yourself ]
]

{ #category : #loading }
ROSCommandTypeLoader >> loadTypeDefinition: aTypeId ifAbsent: aBlock [
	| firstLevel type val isAbsent |
	[  val := ROSSystemLauncher instance rosMsgShow: aTypeId.
	isAbsent := false ] 
		on: Error
		do: [ isAbsent := true ].
	^ isAbsent
		ifTrue: aBlock
		ifFalse: [ firstLevel := (Character lf split: val) select: [ :str | (str beginsWith: ' ') not & (str size > 3) ].
			type := self typeNamed: aTypeId for: firstLevel.
			type md5sum: (ROSSystemLauncher instance rosMsgMd5: aTypeId).
			type ]
]

{ #category : #abstract }
ROSCommandTypeLoader >> loadTypeDefinitionNamed: aName definedFromString: aStringDefinition [
	| firstLevel type |
	firstLevel := (Character lf split: aStringDefinition) select: [ :str | (str beginsWith: ' ') not & (str size > 3) ].
	type := self typeNamed: aName for: firstLevel.
	^ type
]

{ #category : #parsing }
ROSCommandTypeLoader >> parseConstantRosLine: aLine [
	| typeLine |
	typeLine := $= split: aLine.
	^ (self parseItemRosLine: (typeLine at: 1) into: MDDSConstantDefinition)
		value: (typeLine at: 2);
		yourself
]

{ #category : #parsing }
ROSCommandTypeLoader >> parseFieldRosLine: aLine [
	^ self parseItemRosLine: aLine into: MDDSFieldDefinition
]

{ #category : #parsing }
ROSCommandTypeLoader >> parseItemRosLine: aLine into: aClass [
	| fieldType fieldName |
	fieldType := self parseType: (($  split: aLine) at: 1).
	fieldName := ($  split: aLine) at: 2.
	^ aClass name: fieldName type: fieldType
]

{ #category : #parsing }
ROSCommandTypeLoader >> parseRosLine: aLine [
	^ (aLine indexOf: $=) = 0
		ifTrue: [ self parseFieldRosLine: aLine ]
		ifFalse: [ self parseConstantRosLine: aLine ]
]

{ #category : #parsing }
ROSCommandTypeLoader >> parseType: aTypeToken [
	| openBraket closeBraket innerType |
	"
		Possible types
		Type
		Type[]
		Type[N]
	"
	openBraket := aTypeToken indexOf: $[.
	openBraket = 0
		ifTrue: [ 
			" Is a common type "
			^ self typeDefinition: aTypeToken ].
	closeBraket := aTypeToken indexOf: $].
	innerType := self typeDefinition: (aTypeToken copyFrom: 1 to: openBraket - 1).
	^ MDDSCollectionTypeDefinition
		for:
			(openBraket + 1 = closeBraket
				ifTrue: [ 
					" Is a typed array  "
					MDDSArrayType new ]
				ifFalse: [ 
					" Is a typed array with fixed size "
					MDDSArrayFixedLenghtType sized: (aTypeToken copyFrom: openBraket + 1 to: closeBraket - 1) ])
		storing: innerType
]

{ #category : #abstract }
ROSCommandTypeLoader >> plainTypeDefinitionFor: aType [
	^ ROSSystemLauncher instance rosMsgShow: aType name
]

{ #category : #loading }
ROSCommandTypeLoader >> typeDefinitionForText: firstLevel [
	^ firstLevel collect: [ :f | self parseRosLine: f ]
]

{ #category : #loading }
ROSCommandTypeLoader >> typeNamed: aTypeId for: firstLevel [
	^ MDDSTypeDefinition message named: aTypeId defined: (self typeDefinitionForText: firstLevel)
]
