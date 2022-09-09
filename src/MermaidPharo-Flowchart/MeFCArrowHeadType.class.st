Class {
	#name : #MeFCArrowHeadType,
	#superclass : #MeFCArrowType,
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #initialization }
MeFCArrowHeadType >> initialize [

	super initialize.
	leftIdentifier := '<'.
	rightIdentifier := '>'
]
