private
packageOf: aParticipantPID 
	^ (self executableOf: aParticipantPID) asFileReference parent basename 