"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestROSDDS,
	#superclass : #PackageManifest,
	#category : 'ROSDDS'
}

{ #category : #'code-critics' }
ManifestROSDDS class >> ruleClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#ROSPlatformDataExtractor)) #'2016-05-31T10:44:01.596343+02:00') )
]
