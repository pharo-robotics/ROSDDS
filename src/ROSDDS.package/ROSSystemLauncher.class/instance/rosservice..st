launching
rosservice: anArrayOfArguments
	^ self
		resolveTask: [ :spec | 
			spec
				command: 'rosservice';
				arguments: anArrayOfArguments ]