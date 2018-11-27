launching
rosrun: anArrayOfArguments
	^ self
		resolveTask: [ :spec | 
			spec
				command: 'rosrun';
				arguments: anArrayOfArguments ]