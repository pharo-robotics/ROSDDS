as yet unclassified
catkinFind: anArray
	^ self
		resolveTask:
			(#catkin_find command
				arguments: anArray;
				yourself)