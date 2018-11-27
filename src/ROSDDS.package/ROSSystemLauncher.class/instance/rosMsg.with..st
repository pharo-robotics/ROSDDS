types
rosMsg: aCommand with: aTypeId
	^ self
		resolveTask: [ :spec | 
			spec
				command: 'rosmsg';
				arguments:
					{aCommand asString.
					aTypeId asString} ]