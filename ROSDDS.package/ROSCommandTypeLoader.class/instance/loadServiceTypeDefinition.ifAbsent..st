as yet unclassified
loadServiceTypeDefinition: aTypeId ifAbsent: aBlockClosure
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