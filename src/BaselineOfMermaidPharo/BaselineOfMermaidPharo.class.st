Class {
	#name : #BaselineOfMermaidPharo,
	#superclass : #BaselineOf,
	#category : #BaselineOfMermaidPharo
}

{ #category : #baselines }
BaselineOfMermaidPharo >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfMermaidPharo >> defineDependencies: spec [

	spec
		baseline: 'ZLibBinding'
		with: [ spec repository: 'github://badetitou/libs-common:main/src' ]
]

{ #category : #baselines }
BaselineOfMermaidPharo >> defineGroups: spec [
]

{ #category : #baselines }
BaselineOfMermaidPharo >> definePackages: spec [

	spec
		package: 'MermaidPharo';
		package: 'MermaidPharo-Extension' with: [ spec requires: #( 'ZLibBinding' ) ];
		package: 'MermaidPharo-ClassDiagram';
		package: 'MermaidPharo-Writter';
		package: 'MermaidPharo-Writter-Tests'
		with: [ spec requires: #( 'MermaidPharo-Writter' ) ];
		package: 'Pharo2Mermaid';
		package: 'Pharo2Mermaid-Tests'
		with: [ spec requires: #( 'Pharo2Mermaid' ) ]
]
