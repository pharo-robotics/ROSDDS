versions
version12: spec
	<version: '1.2' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.2'.
		spec author: 'SantiagoBragagnolo'.
		spec timestamp: '8/3/2015 12:22'.
		spec project: 'SimpleDDS' with: '0.3-baseline'.
		spec 
			package: #ROSDDS with: 'ROSDDS-SantiagoBragagnolo.15';
			package: #ROSDDSTest with: 'ROSDDSTest-SantiagoBragagnolo.5'. ].
