"
## Example

```st
diagram := M2M new
	metamodel: GLHModel resetMetamodel;
	withoutBlock: [ :class | (class name endsWith: #Model) 
		or: [ class package name ~= GLHModel class package name
			or: [ (class name endsWith: #Entity) ] ]];
	generateClassDiagram.
```
"
Class {
	#name : #M2M,
	#superclass : #Object,
	#instVars : [
		'metamodel',
		'classDiagram',
		'pharoClasses',
		'withoutBlock'
	],
	#category : #Moose2Mermaid
}

{ #category : #accessing }
M2M >> addClassToDiagram: aFM3Class [

	| meClass |
	meClass := MeClass new.
	classDiagram addClass: meClass.
	meClass name: aFM3Class name.
	aFM3Class allPrimitiveProperties do: [ :attribute | 
		(self withoutBlock value: attribute mmClass) ifFalse: [ 
			meClass addAttribute: (self createMeClassAttribute: attribute) ] ].
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
			          ifNone: [ ^ nil ].
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
M2M >> createRelationFrom: source forProperty: complexProperty [

	| oppositeClass |
	^ complexProperty opposite ifNotNil: [ 
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
					  relation label: complexProperty name.
					  self classDiagram addRelation: relation ] ] ]
]

{ #category : #accessing }
M2M >> createRelationsFor: aFM3Class [

	| source |
	source := self classDiagram classes detect: [ :meClass | 
		          meClass name = aFM3Class name ].
	aFM3Class complexProperties do: [ :complexProperty | 
		(self withoutBlock value: complexProperty mmClass) ifFalse: [ 
			self createRelationFrom: source forProperty: complexProperty ] ifTrue: [ self h ] ]
]

{ #category : #accessing }
M2M >> generateClassDiagram [

	| consideredClasses |
	classDiagram := MeClassDiagram new.
	consideredClasses := metamodel classes reject: self withoutBlock.
	consideredClasses do: [ :class | self addClassToDiagram: class ].
	consideredClasses do: [ :class | self createHierarchyFor: class ].
	consideredClasses do: [ :class | self createRelationsFor: class ].
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

{ #category : #accessing }
M2M >> withoutBlock [

	^ withoutBlock
]

{ #category : #accessing }
M2M >> withoutBlock: anObject [

	withoutBlock := anObject
]
