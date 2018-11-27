types
rosSrv: aCommand with: aTypeId
	^ self
		resolveTask: [ :spec | 
			spec
				command: 'rossrv';
				arguments:
					{aCommand asString.
					aTypeId asString} ]