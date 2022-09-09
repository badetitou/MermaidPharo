Class {
	#name : #MeFCNode,
	#superclass : #MeFCDefinition,
	#instVars : [
		'text',
		'shape',
		'name'
	],
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #'instance creation' }
MeFCNode class >> named: aName [

	^ self new
		  name: aName;
		  yourself
]

{ #category : #accessing }
MeFCNode >> accept: aMermaidVisitor [
	aMermaidVisitor visitFCNode: self
]

{ #category : #accessing }
MeFCNode >> name [

	^ name
]

{ #category : #accessing }
MeFCNode >> name: anObject [

	name := anObject
]

{ #category : #accessing }
MeFCNode >> shape [

	^ shape
]

{ #category : #accessing }
MeFCNode >> shape: anObject [

	shape := anObject
]

{ #category : #accessing }
MeFCNode >> text [

	^ text
]

{ #category : #accessing }
MeFCNode >> text: anObject [

	text := anObject
]
