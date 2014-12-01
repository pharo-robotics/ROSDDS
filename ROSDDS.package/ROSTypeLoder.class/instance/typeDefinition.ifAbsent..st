initialization
typeDefinition: aTypeId ifAbsent: aBlock
	^ builtinTypes
		at: aTypeId
		ifAbsent: [ 
			| type |
			type := super typeDefinition: aTypeId ifAbsent:[ self registerTypeDefinition: #loading ].
			type == #loading
				ifTrue: [ registry at: aTypeId put: (self loadTypeDefinition: aTypeId ifAbsent: aBlock) ]
				ifFalse: [ type ] ]