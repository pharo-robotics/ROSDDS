Class {
	#name : #ROSProtocolLookupTests,
	#superclass : #ROSDomainBasedTests,
	#instVars : [
		'topic',
		'subscriber',
		'subscription',
		'participant'
	],
	#category : 'ROSDDSTest-Core'
}

{ #category : #'as yet unclassified' }
ROSProtocolLookupTests >> setUp [
	super setUp.
	participant := self participant.
	topic := self adhoc.
	subscriber := topic subscriber.
	domain addProtocol: ROSTCPProtocol new. 
	
]

{ #category : #'as yet unclassified' }
ROSProtocolLookupTests >> testProcotolSelectorExists [
	
]
