"
A PhaROSSystemLauncher is facade for executing ros commands in the host machine
"
Class {
	#name : #ROSSystemLauncher,
	#superclass : #Object,
	#classInstVars : [
		'instance',
		'distro'
	],
	#category : 'ROSDDS-Commandline'
}

{ #category : #'as yet unclassified' }
ROSSystemLauncher class >> distro: aDistroSymbol [
	distro := aDistroSymbol
]

{ #category : #'as yet unclassified' }
ROSSystemLauncher class >> fuerte [
	^'/opt/ros/fuerte/bin/'
]

{ #category : #'as yet unclassified' }
ROSSystemLauncher class >> groovy [
	^'/opt/ros/groovy/bin/'
]

{ #category : #'as yet unclassified' }
ROSSystemLauncher class >> hydro [
	^ '/opt/ros/hydro/bin/'
]

{ #category : #'as yet unclassified' }
ROSSystemLauncher class >> indigo [
	^'/opt/ros/indigo/bin/'
]

{ #category : #'as yet unclassified' }
ROSSystemLauncher class >> initialize [
	super initialize.
	distro := #indigo.
]

{ #category : #'as yet unclassified' }
ROSSystemLauncher class >> instance [
	^ instance ifNil: [
		instance := super new.	
	]
]

{ #category : #'as yet unclassified' }
ROSSystemLauncher class >> new [
	self error: 'This is a singleton object, use instance instead of new'.
]

{ #category : #'as yet unclassified' }
ROSSystemLauncher class >> path: aCommand [
	^ (distro value: self) , '/', aCommand 
]

{ #category : #'as yet unclassified' }
ROSSystemLauncher >> catkinFind: anArray [
	^ self
		resolveTask:
			(#catkin_find command
				arguments: anArray;
				yourself)
]

{ #category : #'as yet unclassified' }
ROSSystemLauncher >> catkinfindNodeDirectories: aPackageName [
	^ self
		catkinFind:
			{'--without-underlays'.
			'--libexec'.
			'--share'.
			aPackageName asString}
]

{ #category : #types }
ROSSystemLauncher >> resolveTask: aCommand [
	| future |
	aCommand redirectStdoutAsResult.
	future := aCommand future: self runner.
	^ future synchronizeTimeout: 5 seconds
]

{ #category : #types }
ROSSystemLauncher >> rosMsg: aCommand [
	^ self
		resolveTask:
			(#rosmsg command
				argument: aCommand;
				yourself)
]

{ #category : #types }
ROSSystemLauncher >> rosMsg: aCommand with: aTypeId [
	^ self
		resolveTask:
			(#rosmsg command
				arguments:
					{aCommand asString.
					aTypeId asString};
				yourself)
]

{ #category : #types }
ROSSystemLauncher >> rosMsgMd5: aTypeId [
	^ (self rosMsg: 'md5' with: aTypeId) copyReplaceAll: String lf with: ''
]

{ #category : #types }
ROSSystemLauncher >> rosMsgShow: aTypeId [
	^ self rosMsg: 'show' with: aTypeId
]

{ #category : #'as yet unclassified' }
ROSSystemLauncher >> rosPackage: aCommand [
	^ self
		resolveTask:
			(#rospack command
				arguments: {aCommand asString};
				yourself)
]

{ #category : #types }
ROSSystemLauncher >> rosSrv: aCommand [
	^ self
		resolveTask:
			(#rossrv command
				arguments: {aCommand asString};
				yourself)
]

{ #category : #types }
ROSSystemLauncher >> rosSrv: aCommand with: aTypeId [
	^ self
		resolveTask:
			(#rossrv command
				arguments:
					{aCommand asString.
					aTypeId asString};
				yourself)
]

{ #category : #types }
ROSSystemLauncher >> rosSrvMd5: aTypeId [
	^ self rosSrv: 'md5' with: aTypeId
]

{ #category : #types }
ROSSystemLauncher >> rosSrvShow: aTypeId [
	^ self rosSrv: 'show' with: aTypeId
]

{ #category : #launching }
ROSSystemLauncher >> roslaunch: aConfigurationFile [
	^ self
		resolveTask:
			(#roslaunch command
				arguments: {aConfigurationFile asString};
				yourself)
]

{ #category : #launching }
ROSSystemLauncher >> roslaunchForTests: aContent [
	| file |
	file := '/tmp/content-empty-test.launch' asFileReference writeStream.
	file nextPutAll: aContent.
	file flush.
	file close.
	^ self roslaunch: '/tmp/content-empty-test.launch'
]

{ #category : #launching }
ROSSystemLauncher >> rosrun: anArrayOfArguments [
	^ self
		resolveTask:
			(#rosrun command
				arguments: anArrayOfArguments;
				yourself)
]

{ #category : #launching }
ROSSystemLauncher >> rosservice: anArrayOfArguments [
	^ self
		resolveTask:
			(#rosservice command
				arguments: anArrayOfArguments;
				yourself)
]

{ #category : #launching }
ROSSystemLauncher >> rosserviceCall: anArrayOfArguments [
	^ self rosservice: {'call'} , anArrayOfArguments
]

{ #category : #types }
ROSSystemLauncher >> runner [
	^ TKTNewProcessTaskRunner new
]
