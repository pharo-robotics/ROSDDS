as yet unclassified
rosPackage: aCommand
	^ self
		resolveTask:
			(#rospack command
				arguments: {aCommand asString};
				yourself)