loading
parseType: aTypeToken
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