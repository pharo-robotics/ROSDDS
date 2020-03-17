types
rosMsg: aCommand with: aTypeId
	^ self
		resolveTask:
			(#rosmsg command
				arguments:
					{aCommand asString.
					aTypeId asString};
				yourself)