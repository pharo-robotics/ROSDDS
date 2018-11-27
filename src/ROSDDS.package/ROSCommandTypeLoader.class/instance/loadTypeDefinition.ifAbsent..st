loading
loadTypeDefinition: aTypeId ifAbsent: aBlock
	| firstLevel type val isAbsent |
	[ [ val := ROSSystemLauncher instance rosMsgShow: aTypeId.
	isAbsent := false ] ]
		on: Error
		do: [ isAbsent := true ].
	^ isAbsent
		ifTrue: aBlock
		ifFalse: [ firstLevel := (Character lf split: val) select: [ :str | (str beginsWith: ' ') not & (str size > 3) ].
			type := self typeNamed: aTypeId for: firstLevel.
			type md5sum: (ROSSystemLauncher instance rosMsgMd5: aTypeId).
			type ]