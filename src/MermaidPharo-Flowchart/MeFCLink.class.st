Class {
	#name : #MeFCLink,
	#superclass : #MeFCDefinition,
	#instVars : [
		'fromNode',
		'toNode',
		'text',
		'linkType',
		'fromArrowType',
		'toArrowType'
	],
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #'instance creation' }
MeFCLink class >> newFromNode: aFromNode toNode: aToNode [

	^ self new
		  fromNode: aFromNode;
		  toNode: aToNode;
		  yourself
]

{ #category : #accessing }
MeFCLink >> accept: aMermaidVisitor [
	aMermaidVisitor visitFCLink: self
]

{ #category : #accessing }
MeFCLink >> defaultArrowType [
	^ MeFCDashHeadType
]

{ #category : #accessing }
MeFCLink >> fromArrowType [

	^ fromArrowType
]

{ #category : #accessing }
MeFCLink >> fromArrowType: anObject [

	fromArrowType := anObject
]

{ #category : #accessing }
MeFCLink >> fromNode [

	^ fromNode
]

{ #category : #accessing }
MeFCLink >> fromNode: anObject [

	fromNode := anObject
]

{ #category : #accessing }
MeFCLink >> linkType [

	^ linkType
]

{ #category : #accessing }
MeFCLink >> linkType: anObject [

	linkType := anObject
]

{ #category : #accessing }
MeFCLink >> text [

	^ text
]

{ #category : #accessing }
MeFCLink >> text: anObject [

	text := anObject
]

{ #category : #accessing }
MeFCLink >> toArrowType [

	^ toArrowType
]

{ #category : #accessing }
MeFCLink >> toArrowType: anObject [

	toArrowType := anObject
]

{ #category : #accessing }
MeFCLink >> toNode [

	^ toNode
]

{ #category : #accessing }
MeFCLink >> toNode: anObject [

	toNode := anObject
]
