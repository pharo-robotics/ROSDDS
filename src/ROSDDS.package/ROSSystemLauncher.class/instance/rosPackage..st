as yet unclassified
rosPackage: aCommand
	^ self
		resolveTask: [ :spec | 
			spec
				command: 'rospack';
				arguments: {aCommand asString} ]