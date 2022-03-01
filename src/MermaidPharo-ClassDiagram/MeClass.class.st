Class {
	#name : #MeClass,
	#superclass : #MeEntity,
	#instVars : [
		'name',
		'attributes',
		'methods'
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
MeClass >> addMethod: aMeClassMethod [
	methods add: aMeClassMethod
]

{ #category : #accessing }
MeClass >> attributes [

	^ attributes
]

{ #category : #initialization }
MeClass >> initialize [

	super initialize.
	attributes := OrderedCollection new.
	methods := OrderedCollection new
]

{ #category : #accessing }
MeClass >> methods [

	^ methods
]

{ #category : #accessing }
MeClass >> name [

	^ name
]

{ #category : #accessing }
MeClass >> name: anObject [

	name := anObject
]
