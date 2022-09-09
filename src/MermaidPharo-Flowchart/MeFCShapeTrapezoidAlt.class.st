Class {
	#name : #MeFCShapeTrapezoidAlt,
	#superclass : #MeFCShape,
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #initialization }
MeFCShapeTrapezoidAlt >> initialize [

	super initialize.
	self leftIdentifier: '[\'.
	self rightIdentifier: '/]'
]
