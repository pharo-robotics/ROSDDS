types
rosSrv: aCommand with: aTypeId
	^ self
		resolveTask:
			(#rossrv command
				arguments:
					{aCommand asString.
					aTypeId asString};
				yourself)