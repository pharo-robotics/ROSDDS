as yet unclassified
executableOf: aParticipantPID tmpFile: aTempFileName
	| future |
	future := [ :spec | 
	spec
		command: '/bin/readlink';
		arguments: {('/proc/{1}/exe' format: {aParticipantPID})} ] asOSTask future.
	^ future synchronizeTimeout: 1 minute