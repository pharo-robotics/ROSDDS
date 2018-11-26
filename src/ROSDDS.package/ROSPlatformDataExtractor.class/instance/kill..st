as yet unclassified
kill: aPid
	| future |
	future := [ :spec | 
	spec
		command: 'kill';
		arguments:
			{'-9'.
			aPid asString} ] asOSTask future.
	^ future synchronizeTimeout: 1 minute