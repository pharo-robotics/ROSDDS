launching
roslaunch: aConfigurationFile
	^ self
		resolveTask: [ :spec | 
			spec
				command: 'roslaunch';
				arguments: {aConfigurationFile asString} ]