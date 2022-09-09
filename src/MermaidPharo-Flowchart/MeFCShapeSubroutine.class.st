Class {
	#name : #MeFCShapeSubroutine,
	#superclass : #MeFCShape,
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #initialization }
MeFCShapeSubroutine >> initialize [

	super initialize.
	self leftIdentifier: '[['.
	self rightIdentifier: ']]'
]
