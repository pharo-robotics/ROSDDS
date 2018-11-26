types
rosSrv: aCommand
	| future |
	future := [ :spec | 
	spec
		command: 'rossrv';
		arguments: {aCommand} ] asOSTask future.
	^ future synchronizeTimeout: 5 seconds