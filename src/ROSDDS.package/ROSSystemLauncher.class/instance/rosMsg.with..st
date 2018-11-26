types
rosMsg: aCommand with: aTypeId
	| future |
	future := [ :spec | 
	spec
		command: 'rosmsg';
		arguments:
			{aCommand asString.
			aTypeId asString} ] asOSTask future.
	^ future synchronizeTimeout: 5 seconds