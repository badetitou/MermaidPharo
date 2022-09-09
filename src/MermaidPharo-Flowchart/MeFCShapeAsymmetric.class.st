Class {
	#name : #MeFCShapeAsymmetric,
	#superclass : #MeFCShape,
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #initialization }
MeFCShapeAsymmetric >> initialize [

	super initialize.
	self leftIdentifier: '>'.
	self rightIdentifier: ']'
]
