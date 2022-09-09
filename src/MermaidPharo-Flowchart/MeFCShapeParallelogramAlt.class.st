Class {
	#name : #MeFCShapeParallelogramAlt,
	#superclass : #MeFCShape,
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #initialization }
MeFCShapeParallelogramAlt >> initialize [

	super initialize.
	self leftIdentifier: '[\'.
	self rightIdentifier: '\]'
]
