Class {
	#name : #ROSSubscriberTests,
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
ROSSubscriberTests >> setUp [
	super setUp.
	participant := self participant.
	topic := self adhoc.
	subscriber := topic subscriber.
	domain addProtocol: DDSTCPProtocol new. 
]

{ #category : #'as yet unclassified' }
ROSSubscriberTests >> testJustOneInstance [
	self assert: (subscriber = topic subscriber).
]

{ #category : #'as yet unclassified' }
ROSSubscriberTests >> testProcotolSelectorExists [
	
]

{ #category : #'as yet unclassified' }
ROSSubscriberTests >> testSubscriptionCreated [
	self assert: ( (subscriber subscribe: participant) isKindOf: MDDSSubscription ).
]

{ #category : #'as yet unclassified' }
ROSSubscriberTests >> testSubscriptionCreatedOnReadConstructor [
	| or  |
	
	or := [ : val |  ].

	
	subscription := subscriber forParticipant: participant onRead: or.
	
	self assert: ( subscription isKindOf: MDDSSubscription ).
	self assert: ( subscription onRead = or ).
	
]

{ #category : #'as yet unclassified' }
ROSSubscriberTests >> testSubscriptionCreatedOnReadOnFailureConstructor [
	| or of  |
	
	or := [ : val |  ].
	of := [ :  fail |  ].
	
	subscription := subscriber forParticipant: participant onRead: or onFailure: of.
	
	self assert: ( subscription isKindOf: MDDSSubscription ).
	self assert: ( subscription onRead = or ).
	self assert: ( subscription onFailure = of ).
	
]

{ #category : #'as yet unclassified' }
ROSSubscriberTests >> testSubscriptionCreatedOnReadOnFailureOnStopConstructor [
	| or of os |
	
	or := [ : val |  ].
	of := [ :  fail |  ].
	os := [  " " ].
	
	subscription := subscriber forParticipant: participant onRead: or onFailure: of onStop: os.
	
	self assert: ( subscription isKindOf: MDDSSubscription ).
	self assert: ( subscription onRead = or ).
	self assert: ( subscription onFailure = of ).
	self assert: ( subscription onStop = os ).
]

{ #category : #'as yet unclassified' }
ROSSubscriberTests >> testSubscriptionLaunchesEvent [

	domain when: MDDSIsSubscribedAnnouncement send:#setBoolean to: self.
	
	self resetBoolean.
	self deny: boolean.
	
	subscriber subscribe: participant.
	
	self assert: boolean.
]

{ #category : #'as yet unclassified' }
ROSSubscriberTests >> testSubscriptionSubscribed [
	subscription := subscriber subscribe: participant  .
	self assert: (subscriber subscriptions size = 1)
]

{ #category : #'as yet unclassified' }
ROSSubscriberTests >> testSubscriptionUnSubscribed [
	self testSubscriptionSubscribed.
	subscriber unregister: subscription.
	self assert: subscriber subscriptions size = 0
]

{ #category : #'as yet unclassified' }
ROSSubscriberTests >> testSubscriptionUnSubscribedLaunchesEvent [

	domain when: MDDSIsNotSubscribedAnnouncement send:#setBoolean to: self.
	self resetBoolean.
	self deny: boolean.
	self testSubscriptionSubscribed.

	subscriber unregister: subscription.
	self assert: boolean.
]

{ #category : #'as yet unclassified' }
ROSSubscriberTests >> testTopicIsRegisteredAfterSubscription [
	self deny: topic isRegistered.
	subscription := subscriber subscribe: participant.
	self assert: topic isRegistered.
	subscriber unregister: subscription.
	self deny: topic isRegistered.
]
