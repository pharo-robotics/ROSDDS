as yet unclassified
catkinFind: anArray
	^ self
		resolveTask: [ :spec | 
			spec
				command: 'catkin_find';
				arguments: anArray ]