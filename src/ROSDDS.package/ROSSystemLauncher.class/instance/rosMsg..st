types
rosMsg: aCommand
	^ self
		resolveTask:
			(#rosmsg command
				argument: aCommand;
				yourself)