types
resolveTask: aCommand
	| future |
	aCommand redirectStdoutAsResult.
	future := aCommand future: self runner.
	^ future synchronizeTimeout: 5 seconds