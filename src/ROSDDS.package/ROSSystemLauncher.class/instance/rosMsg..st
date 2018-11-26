types
rosMsg: aCommand
	| future |
	future := [ :spec | 
	spec
		command: 'rosmsg';
		arguments: {aCommand} ] asOSTask future.
	^ future synchronizeTimeout: 5 seconds