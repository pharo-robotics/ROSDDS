Class {
	#name : #ROSTopicMirrorTests,
	#superclass : #ROSDomainMirrorBasedTests,
	#instVars : [
		'topics'
	],
	#category : 'ROSDDSTest-Core'
}

{ #category : #'shape-tests' }
ROSTopicMirrorTests >> setUp [
	super setUp.
	topics := domainMirror topics.
]

{ #category : #'basic-calls-tests' }
ROSTopicMirrorTests >> testCreateTopic [
	self assert: ((topics collect: #createTopic) allSatisfy: [ : t  | 
		t isKindOf: MDDSTopic	
	])
]

{ #category : #'shape-tests' }
ROSTopicMirrorTests >> testTopicDescriptors [
	
	self assert: ( topics allSatisfy: [  : topic | topic isKindOf: MDDSTopicDescriptor ]).
	
	
]

{ #category : #'shape-tests' }
ROSTopicMirrorTests >> testTopicDescriptorsTypesAreTypes [

	self assert: ( topics allSatisfy: [  : topic | topic type isKindOf:  MDDSTypeDescriptor ]).
	
	
]

{ #category : #'basic-calls-tests' }
ROSTopicMirrorTests >> testTopicsCreatedAreAlwaysTheSame [
	| topicDescriptor | 
	
	topicDescriptor := topics anyOne .
	
	self assert: topicDescriptor createTopic = topicDescriptor createTopic.
]

{ #category : #'basic-calls-tests' }
ROSTopicMirrorTests >> testTopicsCreatedAreAlwaysTheSameEvenWithHandCraftedDescriptor [
	| topicDescriptor handCrafted | 
	
	topicDescriptor := topics anyOne.
	handCrafted := MDDSTopicDescriptor domain: domainMirror domain name: topicDescriptor name  type: topicDescriptor type.
	
	self assert: topicDescriptor createTopic = handCrafted createTopic.
]
