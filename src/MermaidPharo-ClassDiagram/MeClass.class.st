Class {
	#name : #MeClass,
	#superclass : #MeEntity,
	#instVars : [
		'name'
	],
	#category : #'MermaidPharo-ClassDiagram'
}

{ #category : #accessing }
MeClass >> accept: mermaidWritter [
	mermaidWritter visitClass: self 
]

{ #category : #accessing }
MeClass >> name [

	^ name
]

{ #category : #accessing }
MeClass >> name: anObject [

	name := anObject
]
