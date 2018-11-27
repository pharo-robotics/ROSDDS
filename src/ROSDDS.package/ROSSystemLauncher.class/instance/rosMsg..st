types
rosMsg: aCommand
	^ self
		resolveTask: [ :spec | 
			spec
				command: 'rosmsg';
				arguments: {aCommand asString} ]