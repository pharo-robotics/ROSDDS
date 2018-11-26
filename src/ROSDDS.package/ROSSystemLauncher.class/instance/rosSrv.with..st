types
rosSrv: aCommand with: aTypeId
	| future |
	future := [ :spec | 
	spec
		command: 'rossrv';
		arguments:
			{aCommand asString.
			aTypeId asString} ] asOSTask future.
	^ future synchronizeTimeout: 5 seconds