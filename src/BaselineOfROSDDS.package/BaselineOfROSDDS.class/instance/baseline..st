baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec baseline: 'TaskItShell' with: [ spec repository: 'github://sbragagnolo/taskit' ].
			spec baseline: 'SimpleDDS' with: [ spec repository: 'github://sbragagnolo/SimpleDDS/src' ].
			spec baseline: 'SimpleDDSServer' with: [ spec repository: 'github://sbragagnolo/SimpleDDS/src' ].
			spec
				package: #ROSDDS with: [ spec requires: #('SimpleDDS' 'SimpleDDSServer' 'TaskItShell') ];
				package: #ROSDDSTest with: [ spec requires: #(#ROSDDS) ].
			spec
				group: 'default' with: #(#ROSDDS #ROSDDSTest);
				group: 'core' with: #(#ROSDDS) ]