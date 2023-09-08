"
I am a [Mermaid Class Diagram](https://mermaid-js.github.io/mermaid/#/classDiagram)
"
Class {
	#name : #MeClassDiagram,
	#superclass : #MeDiagram,
	#instVars : [
		'classes',
		'relations'
	],
	#category : #'MermaidPharo-ClassDiagram'
}

{ #category : #visiting }
MeClassDiagram >> accept: mermaidWritter [
	^ mermaidWritter visitClassDiagram: self 
]

{ #category : #accessing }
MeClassDiagram >> addClass: aMeClass [

	^ classes add: aMeClass
]

{ #category : #accessing }
MeClassDiagram >> addRelation: aMeRelation [

	^ relations add: aMeRelation
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
	classes := OrderedCollection new.
	relations := OrderedCollection new
]

{ #category : #visiting }
MeClassDiagram >> meInspectMeRoassalDiagramString: aBuilder [

	<inspectorPresentationOrder: 10 title: 'Roassal Diagram'>
	| presenter exporter |
	presenter := SpRoassalPresenter new.
	exporter := MeRSClassDiagramExporter new.

	presenter canvas: (self accept: exporter).
	^ presenter
]

{ #category : #accessing }
MeClassDiagram >> relations [

	^ relations
]

{ #category : #accessing }
MeClassDiagram >> relations: anObject [

	relations := anObject
]
