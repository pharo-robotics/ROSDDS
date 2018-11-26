types
rosSrv: aCommand
	| future |
	future := [ :spec | 
	spec
		command: 'rossrv';
		arguments: {aCommand asString} ] asOSTask future.
	^ future synchronizeTimeout: 5 seconds