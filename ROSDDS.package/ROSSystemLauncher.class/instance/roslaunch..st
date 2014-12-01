launching
roslaunch: aConfigurationFile
	| roslaunch |
	roslaunch := ExternalUnixOSProcess
		forkAndExec: (ROSSystemLauncher path: 'roslaunch')
		arguments: {aConfigurationFile}
		environment: nil
		descriptors:
			{(FileStream stdin).
			(FileStream stdout).
			(FileStream stderr)}.
	roslaunch spinForRos: 50.
	^ roslaunch