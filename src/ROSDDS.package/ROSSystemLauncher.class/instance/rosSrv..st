types
rosSrv: aCommand
	^ self
		resolveTask:
			(#rossrv command
				arguments: {aCommand asString};
				yourself)