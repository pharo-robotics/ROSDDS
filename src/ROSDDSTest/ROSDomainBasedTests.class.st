Class {
	#name : #ROSDomainBasedTests,
	#superclass : #ROSBasedTests,
	#instVars : [
		'domain'
	],
	#category : 'ROSDDSTest-Core'
}

{ #category : #running }
ROSDomainBasedTests >> adhoc [
| type |
	type := (MDDSTypeDescriptor domain: domain   name: 'std_msgs/Int16') createType.
	^ domain createTopicNamed: '/adhoc'  type: type 
]

{ #category : #util }
ROSDomainBasedTests >> participant [
	^ DDSDomainParticipant domain: domain name: 'adhoc-participant' ip: '127.0.0.1'
]

{ #category : #util }
ROSDomainBasedTests >> rosout [
	^ domain findTopicByName: '/rosout'.
]

{ #category : #running }
ROSDomainBasedTests >> setUp [
	domain := self createRosDomain.
]

{ #category : #running }
ROSDomainBasedTests >> tearDown [
	domain destroy.
	super tearDown
]
