as yet unclassified
catkinfindNodeDirectories: aPackageName
	^ self
		catkinFind:
			{'--without-underlays'.
			'--libexec'.
			'--share'.
			aPackageName asString}