Class {
	#name : #MeFCArrowType,
	#superclass : #MeEntity,
	#instVars : [
		'leftIdentifier',
		'rightIdentifier'
	],
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #accessing }
MeFCArrowType >> leftIdentifier [

	^ leftIdentifier
]

{ #category : #accessing }
MeFCArrowType >> leftIdentifier: anObject [

	leftIdentifier := anObject
]

{ #category : #accessing }
MeFCArrowType >> rightIdentifier [

	^ rightIdentifier
]

{ #category : #accessing }
MeFCArrowType >> rightIdentifier: anObject [

	rightIdentifier := anObject
]
