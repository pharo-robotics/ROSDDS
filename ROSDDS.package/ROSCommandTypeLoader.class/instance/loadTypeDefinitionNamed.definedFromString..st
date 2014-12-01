loading
loadTypeDefinitionNamed: aName definedFromString: aStringDefinition
	| firstLevel type |
	firstLevel := (Character lf split: aStringDefinition) select: [ :str | (str beginsWith: ' ') not & (str size > 3) ].
	type := self typeNamed: aName for: firstLevel.
	^ type