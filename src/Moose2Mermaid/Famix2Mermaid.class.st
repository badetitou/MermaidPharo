Class {
	#name : #Famix2Mermaid,
	#superclass : #Object,
	#instVars : [
		'model',
		'classDiagram'
	],
	#category : #Moose2Mermaid
}

{ #category : #accessing }
Famix2Mermaid >> addClassToDiagram: aPharoClass [

	| meClass |
	meClass := MeClass new.
	classDiagram addClass: meClass.
	meClass name: aPharoClass name.
	aPharoClass methods do: [ :method | 
		meClass addMethod: (self createMeClassMethod: method) ].
	aPharoClass attributes do: [ :attribute | 
		meClass addAttribute: (self createMeClassAttribute: attribute) ].
	^ meClass
]

{ #category : #accessing }
Famix2Mermaid >> classDiagram [

	^ classDiagram
]

{ #category : #accessing }
Famix2Mermaid >> classDiagram: anObject [

	classDiagram := anObject
]

{ #category : #accessing }
Famix2Mermaid >> createHierarchyFor: class [

	| source target |
	class superclass ifNotNil: [ 
		source := self classDiagram classes detect: [ :meClass | 
			          meClass name = class name ].
		target := self classDiagram classes
			          detect: [ :meClass | 
			          meClass name = class superclass name ]
			          ifNone: [ self addClassToDiagram: class superclass ].
		self classDiagram addRelation:
			(MeCDRelation inheritFrom: target to: source) ]
]

{ #category : #accessing }
Famix2Mermaid >> createMeClassAttribute: attribute [

	^ MeClassAttribute new
		  name: attribute name;
		  yourself
]

{ #category : #accessing }
Famix2Mermaid >> createMeClassMethod: method [

	^ MeClassMethod new
		  name: method name;
		  yourself
]

{ #category : #accessing }
Famix2Mermaid >> generateClassDiagram [
	classDiagram := MeClassDiagram new.
	self model allModelClasses do: [ :class | self addClassToDiagram: class ].
	self model allModelClasses do: [ :class | self createHierarchyFor: class ].
	^ classDiagram
]

{ #category : #accessing }
Famix2Mermaid >> model [

	^ model
]

{ #category : #accessing }
Famix2Mermaid >> model: anObject [

	model := anObject
]
