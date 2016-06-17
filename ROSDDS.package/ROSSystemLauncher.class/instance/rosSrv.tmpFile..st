types
rosSrv: anArrayOfArguments tmpFile: aTempFileName
	| rosmsg outstream errstream return |
	outstream := StandardFileStream
		forceNewFileNamed: '/tmp/' , aTempFileName , '.tmp'.
	errstream := StandardFileStream
		forceNewFileNamed: '/tmp/error_' , aTempFileName , '.tmp'.
	rosmsg := ExternalUnixOSProcess
		forkAndExec: (self class path: 'rossrv')
		arguments: anArrayOfArguments
		environment: nil
		descriptors:
			{FileStream stdin.
			outstream.
			errstream}.
	[ rosmsg isComplete ]
		whileFalse: [ (Delay forMilliseconds: 100) wait ].
	rosmsg succeeded
		ifTrue: [ return := outstream
				reset;
				upToEnd ]
		ifFalse: [ Error
				signal:
					'Error discovering service type. Is this process running in a ROS environment?'
						,
							(errstream
								reset;
								upToEnd) ].
	outstream close.
	errstream close.
	^ return