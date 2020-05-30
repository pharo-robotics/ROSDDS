Class {
	#name : #ROSTopicTests,
	#superclass : #ROSDomainBasedTests,
	#instVars : [
		'rosout'
	],
	#category : 'ROSDDSTest-Core'
}

{ #category : #tests }
ROSTopicTests >> setUp [
	super setUp.
	rosout := self rosout.
]

{ #category : #tests }
ROSTopicTests >> testCreatePublisher [
	
	self assert: (rosout publisher isKindOf: MDDSPublisher).
	
]

{ #category : #tests }
ROSTopicTests >> testCreateSubscriber [
	
	self assert: (rosout subscriber isKindOf: MDDSSubscriber).
	
]

{ #category : #tests }
ROSTopicTests >> testIsNotRegistered [
	
	self deny: (rosout isRegistered).
	
]

{ #category : #tests }
ROSTopicTests >> testTypeIsAType [
	self assert: (self adhoc type isKindOf: MDDSType ).
	self assert: (self rosout type isKindOf: MDDSType )
]
