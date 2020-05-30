Class {
	#name : #ROSBasedTests,
	#superclass : #TestCase,
	#instVars : [
		'boolean'
	],
	#category : 'ROSDDSTest-Core'
}

{ #category : #setup }
ROSBasedTests >> createRosDomain [
	^ DDSExternallyDefinedDomain onROS: 'http://127.0.0.1:11311/'.
]

{ #category : #setup }
ROSBasedTests >> createRosMirror [
	^ self createRosDomain mirror.
]

{ #category : #setup }
ROSBasedTests >> resetBoolean [
	boolean := false.
]

{ #category : #setup }
ROSBasedTests >> setBoolean [
	boolean := true.
]

{ #category : #setup }
ROSBasedTests >> tearDown [
	super tearDown.
	[ 
	XMLRPCService stopAll.
	TKTRunner allSubInstances do: #cancel.
	MDDSPublication allInstances do: #stopPublishing.
	DDSParticipantProtocolServer allInstances do: #stop.
	MDDSReadingNetworkConnection allInstances do: #destroy.
	Socket allInstances do: #destroy.
	MDDSEntity allSubInstances do: [ :e | e domain: nil ] ]
		on: Error
		do: [  ].
	2 timesRepeat: [ Smalltalk garbageCollect ]
]
