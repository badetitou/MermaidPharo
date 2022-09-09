Class {
	#name : #MeFCShapeParallelogram,
	#superclass : #MeFCShape,
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #initialization }
MeFCShapeParallelogram >> initialize [

	super initialize.
	self leftIdentifier: '[/'.
	self rightIdentifier: '/]'
]
