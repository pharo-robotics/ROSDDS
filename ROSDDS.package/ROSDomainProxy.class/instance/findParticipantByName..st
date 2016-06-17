delegate
findParticipantByName: aName
| uri |
	uri := proxy lookupNode: aName with: '/NotAnActualID'.
	^ DDSParticipantDescriptor domain: nil name: aName uri: uri. 