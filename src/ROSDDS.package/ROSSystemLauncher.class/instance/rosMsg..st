types
rosMsg: aCommand
	| future |
	future := [ :spec | 
	spec
		command: 'rosmsg';
		arguments: {aCommand asString} ] asOSTask future.
	^ future synchronizeTimeout: 5 seconds