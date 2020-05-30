Class {
	#name : #ROSPublisherTests,
	#superclass : #ROSDomainBasedTests,
	#instVars : [
		'publisher',
		'topic',
		'participant'
	],
	#category : 'ROSDDSTest-Core'
}

{ #category : #'as yet unclassified' }
ROSPublisherTests >> setUp [
	super setUp.
	participant := self participant.
	topic := self rosout.
	publisher := topic publisher.
	domain addProtocol: DDSTCPProtocol new. 
]

{ #category : #'as yet unclassified' }
ROSPublisherTests >> testJustOneInstance [
	self assert: (publisher = topic publisher).
]

{ #category : #'as yet unclassified' }
ROSPublisherTests >> testPublishingCreated [
	self assert: ((publisher publishing: participant) isKindOf: MDDSPublication)
]

{ #category : #'as yet unclassified' }
ROSPublisherTests >> testPublishingCreatedIsAlwaysTheSame [
	| publicationA publicationB |
	
	publicationA := publisher publishing: participant.
	publicationB := publisher publishing: participant.
	
	self assert: publicationA == publicationB
]

{ #category : #'as yet unclassified' }
ROSPublisherTests >> testPublishingCreationHasEffect [
	
	publisher publishing: participant.
	self assert: (publisher publications size = 1).
	
	
]

{ #category : #'as yet unclassified' }
ROSPublisherTests >> testPublishingLaunchesEvent [

	domain when: MDDSIsPublishingAnnouncement send:#setBoolean to: self.
	self resetBoolean.
	self deny: boolean.
	publisher publishing: participant.
	self assert: boolean.
	
]

{ #category : #'as yet unclassified' }
ROSPublisherTests >> testStopPublishing [

	publisher publishing: participant.
	self assert: (publisher publications size = 1).
	publisher stopPublishingParticipant: participant.		
	self assert: (publisher publications size = 0).
]

{ #category : #'as yet unclassified' }
ROSPublisherTests >> testStopPublishingFailsIfIsNotPublishing [
	self should: [ publisher stopPublishingParticipant: participant ] raise: Error
]

{ #category : #'as yet unclassified' }
ROSPublisherTests >> testStopPublishingLaunchesEvent [

	domain when: MDDSIsNotPublishingAnnouncement send: #setBoolean to: self.
	
	self resetBoolean.
	self deny: boolean.
	publisher publishing: participant.
	publisher stopPublishingParticipant: participant.		

	self assert: boolean.
]
