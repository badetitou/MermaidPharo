Class {
	#name : #MeCDRelation,
	#superclass : #MeEntity,
	#instVars : [
		'label',
		'isDashed',
		'fromClass',
		'toClass',
		'fromRelationType',
		'toRelationType'
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

{ #category : #'instance creation' }
MeCDRelation class >> inheritFrom: fromClass to: toClass [

	^ (self from: fromClass to: toClass)
		  fromRelationType: MeCDInheritanceRelationType new;
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
MeCDRelation >> fromRelationType [

	^ fromRelationType
]

{ #category : #accessing }
MeCDRelation >> fromRelationType: anObject [

	fromRelationType := anObject
]

{ #category : #accessing }
MeCDRelation >> initialize [

	super initialize.
	isDashed := false.
	fromRelationType := MeCDNoRelationType new.
	toRelationType := MeCDNoRelationType new
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

{ #category : #accessing }
MeCDRelation >> toRelationType [

	^ toRelationType
]

{ #category : #accessing }
MeCDRelation >> toRelationType: anObject [

	toRelationType := anObject
]
