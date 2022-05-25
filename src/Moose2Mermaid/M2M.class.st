Class {
	#name : #M2M,
	#superclass : #Object,
	#instVars : [
		'metamodel',
		'classDiagram',
		'pharoClasses'
	],
	#category : #Moose2Mermaid
}

{ #category : #accessing }
M2M >> addClassToDiagram: aFM3Class [
		| meClass |
	meClass := MeClass new.
	classDiagram addClass: meClass.
	meClass name: aFM3Class name.
	aFM3Class allComplexProperties do: [ :method | 
		meClass addMethod: (self createMeClassMethod: method) ].
	aFM3Class allPrimitiveProperties do: [ :attribute | 
		meClass addAttribute: (self createMeClassAttribute: attribute) ].
	^ meClass
]

{ #category : #accessing }
M2M >> classDiagram [

	^ classDiagram
]

{ #category : #accessing }
M2M >> classDiagram: anObject [

	classDiagram := anObject
]

{ #category : #accessing }
M2M >> createHierarchyFor: aFM3Class [

	| source target |
	aFM3Class superclass ifNotNil: [ 
		source := self classDiagram classes detect: [ :meClass | 
			          meClass name = aFM3Class name ].
		target := self classDiagram classes
			          detect: [ :meClass | 
			          meClass name = aFM3Class superclass name ]
			          ifNone: [ self addClassToDiagram: aFM3Class superclass ].
		self classDiagram addRelation:
			(MeCDRelation inheritFrom: target to: source) ]
]

{ #category : #accessing }
M2M >> createMeClassAttribute: aFMSimpleProperty [

	^ MeClassAttribute new
		  name: aFMSimpleProperty name;
		  yourself
]

{ #category : #accessing }
M2M >> createMeClassMethod: aFM3Relation [
	^ MeClassMethod new
		  name: aFM3Relation name;
		  yourself
]

{ #category : #accessing }
M2M >> createRelationsFor: aFM3Class [

	| source |
	source := self classDiagram classes detect: [ :meClass | 
			          meClass name = aFM3Class name ].
	aFM3Class complexProperties do: [ :complexProperty | 
		| oppositeClass |
		complexProperty opposite
			ifNotNil: [ 
				oppositeClass := complexProperty opposite mmClass.
				complexProperty isDerived ifFalse: [ 
					self classDiagram classes
						detect: [ :meClass | meClass name = oppositeClass name ]
						ifFound: [ 
							| relation |
							relation := MeCDRelation from: oppositeClass to: source.
							complexProperty isContainer ifTrue: [ 
								relation fromRelationType: MeCDCompositionRelationType new ].
							relation fromRelationType ifNil: [ 
								relation fromRelationType: MeCDAssociationRelationType new ].
							self classDiagram addRelation: relation ]
						ifNone: [ 
						source addMethod: (self createMeClassMethod: complexProperty) ] ] ]
			ifNil: [ 
			source addMethod: (self createMeClassMethod: complexProperty) ] ]
]

{ #category : #accessing }
M2M >> generateClassDiagram [
	classDiagram := MeClassDiagram new.
	metamodel classes do: [ :class | self addClassToDiagram: class ].
	metamodel classes do: [ :class | self createHierarchyFor: class ].
	metamodel classes do: [ :class | self createRelationsFor: class ].
	^ classDiagram
]

{ #category : #accessing }
M2M >> metamodel1 [

	^ metamodel
]

{ #category : #accessing }
M2M >> metamodel: anObject [

	metamodel := anObject
]
