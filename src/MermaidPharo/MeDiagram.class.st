"
I represent a Mermaid Diagram
"
Class {
	#name : #MeDiagram,
	#superclass : #Object,
	#category : #MermaidPharo
}

{ #category : #'as yet unclassified' }
MeDiagram >> accept: aMermaidVisitor [
	aMermaidVisitor visitDiagram: self
]

{ #category : #'as yet unclassified' }
MeDiagram >> exportWith: aMermaidWritter [

	^ String streamContents: [ :stream | 
		  self exportWith: aMermaidWritter to: stream ]
]

{ #category : #'as yet unclassified' }
MeDiagram >> exportWith: aMermaidWritter to: stream [

	aMermaidWritter outputStream: stream.
	self accept: aMermaidWritter
]
