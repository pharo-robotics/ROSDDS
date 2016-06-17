accessing
typeLoader
	^ typeLoader ifNil: [ typeLoader := ROSTypeLoder commandBased ]