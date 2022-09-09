Class {
	#name : #MeFCShapeSquare,
	#superclass : #MeFCShape,
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #initialization }
MeFCShapeSquare >> initialize [

	super initialize.
	self leftIdentifier: '['.
	self rightIdentifier: ']'
]
