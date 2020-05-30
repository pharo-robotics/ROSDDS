"
Since the Simple DDS implementation is based on the ROS implementation, but without the structural installation, the type loader is completely different. And that is the main difference.
"
Class {
	#name : #ROSDomainProxy,
	#superclass : #DDSDomainProxy,
	#category : 'ROSDDS-Proxy'
}

{ #category : #delegate }
ROSDomainProxy >> findParticipantByName: aName [
| uri |
	uri := proxy lookupNode: aName with: '/NotAnActualID'.
	^ DDSParticipantDescriptor domain: nil name: aName uri: uri. 
]

{ #category : #abstract }
ROSDomainProxy >> registerTypeDefinition: aTypeDefinition [
	^ self error: 'ROS bridge does not support type deploying'
]

{ #category : #accessing }
ROSDomainProxy >> typeLoader [
	^ typeLoader ifNil: [ typeLoader := ROSTypeLoader commandBased ]
]
