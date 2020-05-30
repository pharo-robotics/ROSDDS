Class {
	#name : #ROSTypeDescriptionTests,
	#superclass : #ROSDomainBasedTests,
	#instVars : [
		'typeDescription'
	],
	#category : 'ROSDDSTest-Core'
}

{ #category : #'as yet unclassified' }
ROSTypeDescriptionTests >> rosoutDescriptor [
	^ domain mirror findTopicByName: '/rosout'.
]

{ #category : #'as yet unclassified' }
ROSTypeDescriptionTests >> setUp [	
	super setUp.
	typeDescription := self rosoutDescriptor type.
]

{ #category : #'as yet unclassified' }
ROSTypeDescriptionTests >> testRosoutTypeContainsHeader [
	self assert:  (typeDescription definition field: 'header' ) isNotNil.
]

{ #category : #'as yet unclassified' }
ROSTypeDescriptionTests >> testRosoutTypeUnknownFieldAccessFail [

	self should: [ 
		(typeDescription definition field: 'unknown' ) isNotNil.
	 ] raise: MDDSError.


]

{ #category : #'as yet unclassified' }
ROSTypeDescriptionTests >> testTypeIsDefined [
	self assert:  (typeDescription definition isKindOf: MDDSTypeDefinition).
]
