Class {
	#name : #MeFCShapeCylindrical,
	#superclass : #MeFCShape,
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #initialization }
MeFCShapeCylindrical >> initialize [

	super initialize.
	self leftIdentifier: '[('.
	self rightIdentifier: ')]'
]
