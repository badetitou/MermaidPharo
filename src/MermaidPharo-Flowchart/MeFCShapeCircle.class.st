Class {
	#name : #MeFCShapeCircle,
	#superclass : #MeFCShape,
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #initialization }
MeFCShapeCircle >> initialize [

	super initialize.
	self leftIdentifier: '(('.
	self rightIdentifier: '))'
]
