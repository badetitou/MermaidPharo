"
I am a [Mermaid Class Diagram](https://mermaid-js.github.io/mermaid/#/classDiagram)
"
Class {
	#name : #MeClassDiagram,
	#superclass : #MeDiagram,
	#instVars : [
		'classes'
	],
	#category : #'MermaidPharo-ClassDiagram'
}

{ #category : #visiting }
MeClassDiagram >> accept: mermaidWritter [
	mermaidWritter visitClassDiagram: self 
]

{ #category : #accessing }
MeClassDiagram >> addClass: aMeClass [

	^ classes add: aMeClass
]

{ #category : #accessing }
MeClassDiagram >> classes [

	^ classes
]

{ #category : #accessing }
MeClassDiagram >> classes: anObject [

	classes := anObject
]

{ #category : #visiting }
MeClassDiagram >> initialize [
	super initialize.
	classes := OrderedCollection new
]
