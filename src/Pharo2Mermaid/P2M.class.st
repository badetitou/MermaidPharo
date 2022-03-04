"
I generate a mermaid class diagram from a set of pharo classes
"
Class {
	#name : #P2M,
	#superclass : #Object,
	#instVars : [
		'pharoClasses',
		'classDiagram'
	],
	#category : #Pharo2Mermaid
}

{ #category : #adding }
P2M >> addClassToDiagram: aPharoClass [

	| meClass |
	meClass := MeClass new.
	classDiagram addClass: meClass.
	meClass name: aPharoClass name.
	aPharoClass methods do: [ :method | 
		meClass addMethod: (self createMeClassMethod: method) ].
	aPharoClass slots do: [ :attribute | 
		meClass addAttribute: (self createMeClassAttribute: attribute) ].
	^ meClass
]

{ #category : #accessing }
P2M >> classDiagram [

	^ classDiagram
]

{ #category : #accessing }
P2M >> classDiagram: anObject [

	classDiagram := anObject
]

{ #category : #'as yet unclassified' }
P2M >> createHierarchyFor: class [

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

{ #category : #adding }
P2M >> createMeClassAttribute: attribute [

	^ MeClassAttribute new
		  name: attribute name;
		  yourself
]

{ #category : #adding }
P2M >> createMeClassMethod: method [

	^ MeClassMethod new
		  name: method selector;
		  yourself
]

{ #category : #'as yet unclassified' }
P2M >> generateClassDiagram [
	classDiagram := MeClassDiagram new.
	pharoClasses do: [ :class | self addClassToDiagram: class ].
	pharoClasses do: [ :class | self createHierarchyFor: class ].
	^ classDiagram
]

{ #category : #accessing }
P2M >> pharoClasses [

	^ pharoClasses
]

{ #category : #accessing }
P2M >> pharoClasses: anObject [

	pharoClasses := anObject
]
