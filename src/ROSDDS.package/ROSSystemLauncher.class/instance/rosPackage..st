as yet unclassified
rosPackage: aCommand
	| future |
	future := [ :spec | 
	spec
		command: 'rospack';
		arguments: {aCommand asString} ] asOSTask future.
	^ future synchronizeTimeout: 5 seconds