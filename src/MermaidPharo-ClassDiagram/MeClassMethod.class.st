Class {
	#name : #MeClassMethod,
	#superclass : #MeEntity,
	#instVars : [
		'returnType',
		'name'
	],
	#category : #'MermaidPharo-ClassDiagram'
}

{ #category : #accessing }
MeClassMethod >> accept: mermaidWritter [
	mermaidWritter visitClassMethod: self 
]

{ #category : #accessing }
MeClassMethod >> name [

	^ name
]

{ #category : #accessing }
MeClassMethod >> name: anObject [

	name := anObject
]

{ #category : #accessing }
MeClassMethod >> returnType [

	^ returnType
]

{ #category : #accessing }
MeClassMethod >> returnType: anObject [

	returnType := anObject
]
