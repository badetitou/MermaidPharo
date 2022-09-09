Class {
	#name : #MeFCSubgraph,
	#superclass : #MeFCDefinition,
	#instVars : [
		'definitions',
		'title'
	],
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #accessing }
MeFCSubgraph >> definitions [

	^ definitions
]

{ #category : #accessing }
MeFCSubgraph >> definitions: anObject [

	definitions := anObject
]

{ #category : #accessing }
MeFCSubgraph >> title [

	^ title
]

{ #category : #accessing }
MeFCSubgraph >> title: anObject [

	title := anObject
]
