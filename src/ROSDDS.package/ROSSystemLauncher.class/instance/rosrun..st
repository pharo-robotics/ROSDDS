launching
rosrun: anArrayOfArguments
	| future |
	future := [ :spec | 
	spec
		command: 'rosrun';
		arguments: anArrayOfArguments ] asOSTask future.
	^ future