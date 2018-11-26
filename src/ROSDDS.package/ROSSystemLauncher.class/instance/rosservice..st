launching
rosservice: anArrayOfArguments
	| future |
	future := [ :spec | 
	spec
		command: 'rosservice';
		arguments: anArrayOfArguments ] asOSTask future.
	^ future