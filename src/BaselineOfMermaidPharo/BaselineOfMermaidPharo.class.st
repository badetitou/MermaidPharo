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
	
]

{ #category : #baselines }
BaselineOfMermaidPharo >> defineGroups: spec [
]

{ #category : #baselines }
BaselineOfMermaidPharo >> definePackages: spec [

	spec
		package: 'MermaidPharo';
		package: 'MermaidPharo-ClassDiagram';
		package: 'MermaidPharo-Writter';
		package: 'MermaidPharo-Writter-Tests'
]
