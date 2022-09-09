Class {
	#name : #MeFCRelation,
	#superclass : #MeFCDefinition,
	#instVars : [
		'fromNode',
		'toNode'
	],
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #accessing }
MeFCRelation >> fromNode [

	^ fromNode
]

{ #category : #accessing }
MeFCRelation >> fromNode: anObject [

	fromNode := anObject
]

{ #category : #accessing }
MeFCRelation >> toNode [

	^ toNode
]

{ #category : #accessing }
MeFCRelation >> toNode: anObject [

	toNode := anObject
]
