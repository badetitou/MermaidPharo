Class {
	#name : #MeClassAttribute,
	#superclass : #MeEntity,
	#instVars : [
		'type',
		'name'
	],
	#category : #'MermaidPharo-ClassDiagram'
}

{ #category : #visiting }
MeClassAttribute >> accept: mermaidWritter [
	mermaidWritter visitClassAttribute: self 
]

{ #category : #accessing }
MeClassAttribute >> name [

	^ name
]

{ #category : #accessing }
MeClassAttribute >> name: anObject [

	name := anObject
]

{ #category : #accessing }
MeClassAttribute >> type [

	^ type
]

{ #category : #accessing }
MeClassAttribute >> type: anObject [

	type := anObject
]
