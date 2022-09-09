Class {
	#name : #MeFCShapeTrapezoid,
	#superclass : #MeFCShape,
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #initialization }
MeFCShapeTrapezoid >> initialize [

	super initialize.
	self leftIdentifier: '[/'.
	self rightIdentifier: '\]'
]
