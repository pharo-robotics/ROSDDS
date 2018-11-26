accessing
typeLoader
	^ typeLoader ifNil: [ typeLoader := ROSTypeLoader commandBased ]