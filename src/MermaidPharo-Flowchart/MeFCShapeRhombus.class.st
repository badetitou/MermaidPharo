Class {
	#name : #MeFCShapeRhombus,
	#superclass : #MeFCShape,
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #initialization }
MeFCShapeRhombus >> initialize [

	super initialize.
	self leftIdentifier: '{'.
	self rightIdentifier: '}'
]
