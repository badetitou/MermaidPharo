Class {
	#name : #MeFCShapeStadium,
	#superclass : #MeFCShape,
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #initialization }
MeFCShapeStadium >> initialize [

	super initialize.
	self leftIdentifier: '(['.
	self rightIdentifier: '])'
]
