Class {
	#name : #ROSDomainMirrorBasedTests,
	#superclass : #ROSBasedTests,
	#instVars : [
		'domainMirror',
		'domain'
	],
	#category : 'ROSDDSTest-Core'
}

{ #category : #'as yet unclassified' }
ROSDomainMirrorBasedTests >> setUp [
	super setUp.
	domain := self createRosDomain.
	domainMirror := domain mirror
]

{ #category : #'as yet unclassified' }
ROSDomainMirrorBasedTests >> tearDown [
	domain destroy.
	super tearDown
]
