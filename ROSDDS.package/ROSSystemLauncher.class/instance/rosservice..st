launching
rosservice: anArrayOfArguments
	| process |
	process := ExternalUnixOSProcess
		forkAndExec: (ROSSystemLauncher path: 'rosservice')
		arguments: anArrayOfArguments
		environment: nil
		descriptors:
			{(FileStream stdin).
			(FileStream stdout).
			(FileStream stderr)}.
	process spinForRos: 20.
	^ process