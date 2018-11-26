launching
roslaunch: aConfigurationFile
	| future |
	future := [ :spec | 
	spec
		command: 'roslaunch';
		arguments: {aConfigurationFile} ] asOSTask future.
	^ future