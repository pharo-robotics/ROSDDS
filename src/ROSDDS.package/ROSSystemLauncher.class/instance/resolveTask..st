types
resolveTask: aBlock
	| future |
	future := aBlock asOSTask future: self runner.
	^ future synchronizeTimeout: 5 seconds 