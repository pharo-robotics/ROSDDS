parsing
parseFieldRosLine: aLine
	^ self parseItemRosLine: aLine into: MDDSFieldDefinition