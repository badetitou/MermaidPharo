Class {
	#name : #MeFCShapeRoundEdges,
	#superclass : #MeFCShape,
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #initialization }
MeFCShapeRoundEdges >> initialize [
	self leftIdentifier: '('.
	self rightIdentifier: ')'
]
