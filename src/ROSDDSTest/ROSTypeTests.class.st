Class {
	#name : #ROSTypeTests,
	#superclass : #ROSDomainBasedTests,
	#instVars : [
		'type'
	],
	#category : 'ROSDDSTest-Core'
}

{ #category : #'as yet unclassified' }
ROSTypeTests >> setUp [	
	super setUp.
	type := self rosout type.
]

{ #category : #'as yet unclassified' }
ROSTypeTests >> testRosoutDTOClassesGenerated [
	self assert: (Smalltalk at: #Std_msgs_Header) isNotNil.
	self assert: (Smalltalk at: #Rosgraph_msgs_Log) isNotNil.
]

{ #category : #'as yet unclassified' }
ROSTypeTests >> testRosoutTypeSerializer [
	self assert: (type marshaller isKindOf: MDDSBaseTypeMarshaller ) .
	


]

{ #category : #'as yet unclassified' }
ROSTypeTests >> testRosoutTypeSerializerIsAlwaysTheSame [
	| a  b |
	
	 a := type marshaller.
	 b := type marshaller.
	
	self assert: a == b.
	
	

]
