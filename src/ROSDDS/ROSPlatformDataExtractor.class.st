"
Platform reification. Needed for grabbing some information from the operative system. The default implementation is for UBUNTU.
"
Class {
	#name : #ROSPlatformDataExtractor,
	#superclass : #Object,
	#category : 'ROSDDS-Commandline'
}

{ #category : #'as yet unclassified' }
ROSPlatformDataExtractor >> executableOf: aParticipantPID [
	^ self executableOf: aParticipantPID tmpFile: aParticipantPID hash asString
]

{ #category : #'as yet unclassified' }
ROSPlatformDataExtractor >> executableOf: aParticipantPID tmpFile: aTempFileName [
	| future |
	future := [ :spec | 
	spec
		command: '/bin/readlink';
		arguments: {('/proc/{1}/exe' format: {aParticipantPID})} ] asOSTask future.
	^ future synchronizeTimeout: 1 minute
]

{ #category : #'as yet unclassified' }
ROSPlatformDataExtractor >> kill: aPid [
	| future |
	future := [ :spec | 
	spec
		command: 'kill';
		arguments:
			{'-9'.
			aPid asString} ] asOSTask future.
	^ future synchronizeTimeout: 1 minute
]

{ #category : #private }
ROSPlatformDataExtractor >> packageOf: aParticipantPID [ 
	^ (self executableOf: aParticipantPID) asFileReference parent basename 
]
