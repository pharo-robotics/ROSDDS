as yet unclassified
executableOf: aParticipantPID tmpFile: aTempFileName
	| rosmsg outstream errstream return |
	outstream := StandardFileStream forceNewFileNamed: '/tmp/' , aTempFileName , '.tmp'.
	errstream := StandardFileStream forceNewFileNamed: '/tmp/error_' , aTempFileName , '.tmp'.
	rosmsg := ExternalUnixOSProcess
		forkAndExec: '/bin/readlink'
		arguments: {('/proc/{1}/exe' format: {aParticipantPID})}
		environment: nil
		descriptors:
			{(FileStream stdin).
			outstream.
			errstream}.
	[ rosmsg isComplete not ] whileTrue: [ (Delay forMilliseconds: 100) wait ].
	rosmsg succeeded
		ifTrue: [ 
			return := outstream
				reset;
				upToEnd.
			outstream close.
			errstream close ]
		ifFalse: [ 
			Error
				signal:
					'Error reading process information'
						,
							(errstream
								reset;
								upToEnd).
			outstream close.
			errstream close ].
	^ return