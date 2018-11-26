as yet unclassified
rosPackage: aCommand
	| future |
	future := [ :spec | 
	spec
		command: 'rospack';
		arguments: {aCommand} ] asOSTask future.
	^ future synchronizeTimeout: 5 seconds