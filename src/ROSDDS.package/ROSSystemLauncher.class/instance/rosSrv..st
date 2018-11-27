types
rosSrv: aCommand
	^ self
		resolveTask: [ :spec | 
			spec
				command: 'rossrv';
				arguments: {aCommand asString} ]