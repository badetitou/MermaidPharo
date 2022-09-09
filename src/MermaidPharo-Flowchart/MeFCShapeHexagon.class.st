Class {
	#name : #MeFCShapeHexagon,
	#superclass : #MeFCShape,
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #initialization }
MeFCShapeHexagon >> initialize [

	super initialize.
	self leftIdentifier: '{{'.
	self rightIdentifier: '}}'
]
