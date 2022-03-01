Class {
	#name : #MeClass,
	#superclass : #MeEntity,
	#instVars : [
		'name',
		'attributes'
	],
	#category : #'MermaidPharo-ClassDiagram'
}

{ #category : #accessing }
MeClass >> accept: mermaidWritter [
	mermaidWritter visitClass: self 
]

{ #category : #accessing }
MeClass >> addAttribute: aMeClassAttribute [
	attributes add: aMeClassAttribute
]

{ #category : #accessing }
MeClass >> attributes [

	^ attributes
]

{ #category : #accessing }
MeClass >> initialize [
	super initialize.
	attributes := OrderedCollection new
]

{ #category : #accessing }
MeClass >> name [

	^ name
]

{ #category : #accessing }
MeClass >> name: anObject [

	name := anObject
]
