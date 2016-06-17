baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec baseline: 'SimpleDDS' with: [ spec repository: 'github://sbragagnolo/SimpleDDS' ].
			spec baseline: 'SimpleDDSServer' with: [ spec repository: 'github://sbragagnolo/SimpleDDS' ].
			spec
				package: #ROSDDS with: [ spec requires: #('SimpleDDS' 'SimpleDDSServer') ];
				package: #ROSDDSTest with: [ spec requires: #(#ROSDDS) ].
			spec
				group: 'default' with: #(#ROSDDS #ROSDDSTest);
				group: 'core' with: #(#ROSDDS) ]