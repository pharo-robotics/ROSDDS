launching
roslaunch: aConfigurationFile
	| future |
	future := [ :spec | 
	spec
		command: 'roslaunch';
		arguments: {aConfigurationFile asString} ] asOSTask future.
	^ future