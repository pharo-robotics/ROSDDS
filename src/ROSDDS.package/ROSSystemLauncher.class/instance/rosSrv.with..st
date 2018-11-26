types
rosSrv: aCommand with: aTypeId
	| future |
	future := [ :spec | 
	spec
		command: 'rossrv';
		arguments:
			{aCommand.
			aTypeId} ] asOSTask future.
	^ future synchronizeTimeout: 5 seconds