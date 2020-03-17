launching
roslaunchForTests: aContent
	| file |
	file := '/tmp/content-empty-test.launch' asFileReference writeStream.
	file nextPutAll: aContent.
	file flush.
	file close.
	^ self roslaunch: '/tmp/content-empty-test.launch'