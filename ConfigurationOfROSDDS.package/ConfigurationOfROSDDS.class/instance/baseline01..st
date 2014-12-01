baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/sbragagnolo/ROSDDS/main/'.
		spec project: 'SimpleDDS' with: [
				spec
					className: #ConfigurationOfSimpleDDS;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/sbragagnolo/SimpleDDS/main/' ].
		spec 
			package: #ROSDDS with: [
				spec requires: #('SimpleDDS' ). ];
			package: #ROSDDSTest with: [
				spec requires: #(#ROSDDS ). ].
		spec 
			group: 'default' with: #(#ROSDDS #ROSDDSTest );
			group: 'core' with: #(#ROSDDS ). ].
