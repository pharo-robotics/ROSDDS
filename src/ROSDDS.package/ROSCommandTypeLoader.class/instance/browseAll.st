all
browseAll
	^ (Character lf split: (ROSSystemLauncher instance rosMsg: 'list'))
		inject: Dictionary new
		into: [ :acc :typeId | acc at: typeId put: (self typeDefinition: typeId). acc ].