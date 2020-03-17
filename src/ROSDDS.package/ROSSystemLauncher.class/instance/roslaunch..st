launching
roslaunch: aConfigurationFile
	^ self
		resolveTask:
			(#roslaunch command
				arguments: {aConfigurationFile asString};
				yourself)