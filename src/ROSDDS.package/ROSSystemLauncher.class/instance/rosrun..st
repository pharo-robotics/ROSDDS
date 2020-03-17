launching
rosrun: anArrayOfArguments
	^ self
		resolveTask:
			(#rosrun command
				arguments: anArrayOfArguments;
				yourself)