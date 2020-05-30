Extension { #name : #DDSRemoteDomainMirror }

{ #category : #'*ROSDDS' }
DDSRemoteDomainMirror classSide >> onROS: anURL [
	^ self  on: (ROSDomainProxy on: anURL )
]
