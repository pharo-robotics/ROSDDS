loading
loadTypeDefinition: aTypeId ifAbsent: aBlock
	| firstLevel type val |
	[ val := ROSSystemLauncher instance rosMsgShow: aTypeId ]
		on: Error
		do: [ ^ aBlock value ].
	firstLevel := (Character lf split: val) select: [ :str | (str beginsWith: ' ') not & (str size > 3) ].
	type := self typeNamed: aTypeId for: firstLevel.
	type md5sum: (ROSSystemLauncher instance rosMsgMd5: aTypeId).
	^ type