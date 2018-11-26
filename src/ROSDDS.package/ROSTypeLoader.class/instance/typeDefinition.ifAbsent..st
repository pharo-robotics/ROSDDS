abstract
typeDefinition: aTypeId ifAbsent: aBlock
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