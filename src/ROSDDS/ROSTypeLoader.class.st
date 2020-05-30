"
The type loader is an abstract class that defines a basic cache and abstract methods.
It can be subclassed for usign command oriented loading (rosmsg) and  other kind of strategies it is not prepared to be mixed ( since there is una cahce per loader )
"
Class {
	#name : #ROSTypeLoader,
	#superclass : #MDDSTypeLoader,
	#instVars : [
		'builtinTypes',
		'undefinedTypes'
	],
	#category : 'ROSDDS-Typeloader'
}

{ #category : #constructor }
ROSTypeLoader class >> commandBased [
	^ ROSCommandTypeLoader new.
]

{ #category : #initialization }
ROSTypeLoader >> initialize [

	super initialize.
	undefinedTypes := Set new.
	builtinTypes := Dictionary new.
	
	builtinTypes at: 'byte' put: (MDDSBasicTypeDefinition for:  MDDSInt8Type new).
	builtinTypes at: 'char' put: (MDDSBasicTypeDefinition for:  MDDSInt8Type new).
	builtinTypes at: 'bool' put: (MDDSBasicTypeDefinition for:  MDDSBoolType new).
	builtinTypes at: 'float32' put: (MDDSBasicTypeDefinition for:  MDDSFloat32Type new).
	builtinTypes at: 'float64' put: (MDDSBasicTypeDefinition for:  MDDSFloat64Type new).
	
	builtinTypes at: 'int8' put: (MDDSBasicTypeDefinition for:  MDDSInt8Type new).
	builtinTypes at: 'int16' put: (MDDSBasicTypeDefinition for:  MDDSInt16Type new).
	builtinTypes at: 'int32' put: (MDDSBasicTypeDefinition for:  MDDSInt32Type new).
	builtinTypes at: 'int64' put: (MDDSBasicTypeDefinition for:  MDDSInt64Type new).
	
	builtinTypes at: 'uint8' put: (MDDSBasicTypeDefinition for:  MDDSUInt8Type new).
	builtinTypes at: 'uint16' put: (MDDSBasicTypeDefinition for:  MDDSUInt16Type new).
	builtinTypes at: 'uint32' put: (MDDSBasicTypeDefinition for:  MDDSUInt32Type new).
	builtinTypes at: 'uint64' put: (MDDSBasicTypeDefinition for:  MDDSUInt64Type new).
	
	builtinTypes at: 'time' put: (MDDSBasicTypeDefinition for:  MDDSTimeType new).
	builtinTypes at: 'duration' put: (MDDSBasicTypeDefinition for:  MDDSDurationType new).
	builtinTypes at: 'string' put: (MDDSBasicTypeDefinition for:  MDDSStringType new).
]

{ #category : #'as yet unclassified' }
ROSTypeLoader >> loadServiceTypeDefinition: aTypeID ifAbsent: aBlockClosure [ 
	self subclassResponsibility .
]

{ #category : #loading }
ROSTypeLoader >> loadTypeDefinition: aTypeId ifAbsent: aBlock [
	self subclassResponsibility
]

{ #category : #'type management' }
ROSTypeLoader >> registerUndefinedType: aTypeId [
	self halt .
	undefinedTypes add: aTypeId
]

{ #category : #'type management' }
ROSTypeLoader >> serviceTypeDefinition: aTypeId ifAbsent: aBlock [ 
	| type |
	" A type may be: 
	1- built in type 
	"
	builtinTypes at: aTypeId ifPresent: [ :val | ^ val ].
	"
	2- previously loaded type
	"
	registry at: aTypeId ifPresent: [ :val | ^ val ].
	" 
	3- undefined type
	"
	(undefinedTypes includes: aTypeId)
		ifTrue: [ ^ aBlock value ].
	" 
	4- If there is nothing about, we try to load it from the system
	"
	type := self
		loadServiceTypeDefinition: aTypeId
		ifAbsent: [ 
			self registerUndefinedType: aTypeId. 
			^ aBlock value ].
	registry at: aTypeId put: type.
	^ type
]

{ #category : #abstract }
ROSTypeLoader >> typeDefinition: aTypeId ifAbsent: aBlock [
	| type |
	" A type may be: 
	1- built in type 
	"
	builtinTypes at: aTypeId ifPresent: [ :val | ^ val ].
	"
	2- previously loaded type
	"
	registry at: aTypeId ifPresent: [ :val | ^ val ].
	" 
	3- undefined type
	"
	(undefinedTypes includes: aTypeId)
		ifTrue: [ ^ aBlock value ].
	" 
	4- If there is nothing about, we try to load it from the system
	"
	type := self
		loadTypeDefinition: aTypeId
		ifAbsent: [ self registerUndefinedType: aTypeId.
			^ aBlock value ].
	registry at: aTypeId put: type.
	^ type
]
