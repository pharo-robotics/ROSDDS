versions
version10: spec
	<version: '1.0' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.0'.
		spec author: 'SantiagoBragagnolo'.
		spec timestamp: '12/1/2014 17:04'.
		spec project: 'SimpleDDS' with: '1.0'.
		spec 
			package: #ROSDDS with: 'ROSDDS-SantiagoBragagnolo.6';
			package: #ROSDDSTest with: 'ROSDDSTest-SantiagoBragagnolo.1'. ].
