Class {
	#name : #MeFCShape,
	#superclass : #MeEntity,
	#instVars : [
		'leftIdentifier',
		'rightIdentifier'
	],
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #accessing }
MeFCShape >> leftIdentifier [

	^ leftIdentifier
]

{ #category : #accessing }
MeFCShape >> leftIdentifier: anObject [

	leftIdentifier := anObject
]

{ #category : #accessing }
MeFCShape >> rightIdentifier [

	^ rightIdentifier
]

{ #category : #accessing }
MeFCShape >> rightIdentifier: anObject [

	rightIdentifier := anObject
]
