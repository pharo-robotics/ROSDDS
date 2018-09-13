*ROSDDS
onROS: anUrl
	^ (self on: (DDSRemoteDomainMirror onROS: anUrl))
		addProtocol: (ROSTCPProtocol encoding: MDDSEncoder decoding: MDDSDecoder);
		yourself