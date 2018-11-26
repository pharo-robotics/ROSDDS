as yet unclassified
catkinFind: anArray
	| future |
	future := [ :spec | 
	spec
		command: 'catkin_find';
		arguments: anArray ] asOSTask future.
	^ future synchronizeTimeout: 5 seconds