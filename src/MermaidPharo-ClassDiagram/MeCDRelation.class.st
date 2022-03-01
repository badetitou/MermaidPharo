Class {
	#name : #MeCDRelation,
	#superclass : #MeEntity,
	#instVars : [
		'label',
		'isDashed',
		'fromClass',
		'toClass'
	],
	#category : #'MermaidPharo-ClassDiagram'
}

{ #category : #'instance creation' }
MeCDRelation class >> from: fromClass to: toClass [

	^ self new
		  fromClass: fromClass;
		  toClass: toClass;
		  yourself
]

{ #category : #accessing }
MeCDRelation >> accept: mermaidWritter [
	mermaidWritter visitRelation: self 
]

{ #category : #accessing }
MeCDRelation >> fromClass [

	^ fromClass
]

{ #category : #accessing }
MeCDRelation >> fromClass: anObject [

	fromClass := anObject
]

{ #category : #accessing }
MeCDRelation >> initialize [

	super initialize.
	isDashed := false
]

{ #category : #accessing }
MeCDRelation >> label [

	^ label
]

{ #category : #accessing }
MeCDRelation >> label: anObject [

	label := anObject
]

{ #category : #accessing }
MeCDRelation >> toClass [

	^ toClass
]

{ #category : #accessing }
MeCDRelation >> toClass: anObject [

	toClass := anObject
]
