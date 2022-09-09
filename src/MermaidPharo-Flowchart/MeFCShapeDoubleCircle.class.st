Class {
	#name : #MeFCShapeDoubleCircle,
	#superclass : #MeFCShape,
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #initialization }
MeFCShapeDoubleCircle >> initialize [

	super initialize.
	self leftIdentifier: '((('.
	self rightIdentifier: ')))'
]
