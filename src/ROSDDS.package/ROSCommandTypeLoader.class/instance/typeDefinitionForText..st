loading
typeDefinitionForText: firstLevel
	^ firstLevel collect: [ :f | self parseRosLine: f ]