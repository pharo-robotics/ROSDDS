Class {
	#name : #ROSDomainMirrorTests,
	#superclass : #ROSDomainMirrorBasedTests,
	#category : 'ROSDDSTest-Core'
}

{ #category : #'basic-calls-tests' }
ROSDomainMirrorTests >> testDefaultTopicsExist [
	| topics |
	
	topics := domainMirror topics.
	self assert: (topics anySatisfy: [ :t | t name =  '/rosout' ] ).
	self assert: (topics anySatisfy: [ :t | t name = '/rosout_agg' ] ).

]

{ #category : #'expected-system' }
ROSDomainMirrorTests >> testFindTopicByName [
	self assert: (domainMirror findTopicByName: '/rosout' ifNone: [ nil ]) isNotNil .
]

{ #category : #'expected-system' }
ROSDomainMirrorTests >> testThereAreTopics [
	| topics |
	
	topics := domainMirror topics.
	self assert: topics isNotEmpty.
	
]

{ #category : #'expected-system' }
ROSDomainMirrorTests >> testUnexistantTopicFindTopicByNameFails [

	self should: [ domainMirror findTopicByName: '/not-existant-topics'  ] raise: MDDSError.
	 
	
]
