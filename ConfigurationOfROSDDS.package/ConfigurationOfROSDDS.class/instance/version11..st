versions
version11: spec
	<version: '1.1' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.1'.
		spec author: 'SantiagoBragagnolo'.
		spec timestamp: '4/30/2015 16:31'.
		spec project: 'SimpleDDS' with: '1.3'.
		spec 
			package: #ROSDDS with: 'ROSDDS-SantiagoBragagnolo.15';
			package: #ROSDDSTest with: 'ROSDDSTest-SantiagoBragagnolo.5'. ].
