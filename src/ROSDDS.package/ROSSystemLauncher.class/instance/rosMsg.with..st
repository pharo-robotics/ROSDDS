types
rosMsg: aCommand with: aTypeId
	| future |
	future := [ :spec | 
	spec
		command: 'rosmsg';
		arguments:
			{aCommand.
			aTypeId} ] asOSTask future.
	^ future synchronizeTimeout: 5 seconds