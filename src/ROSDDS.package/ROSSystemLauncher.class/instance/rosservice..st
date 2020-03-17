launching
rosservice: anArrayOfArguments
	^ self
		resolveTask:
			(#rosservice command
				arguments: anArrayOfArguments;
				yourself)