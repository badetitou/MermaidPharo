"
I visit a MeDiagram or MeEntity and print it in a stream
"
Class {
	#name : #MeWritterVisitor,
	#superclass : #Object,
	#instVars : [
		'outputStream',
		'indentNumber',
		'indentSize'
	],
	#category : #'MermaidPharo-Writter'
}

{ #category : #visiting }
MeWritterVisitor >> << aString [
	self indent.
	self <<< aString
]

{ #category : #visiting }
MeWritterVisitor >> <<< aString [
	outputStream << aString
]

{ #category : #visiting }
MeWritterVisitor >> cr [
	outputStream << String cr
]

{ #category : #visiting }
MeWritterVisitor >> inIndent: aBlock [
	self indentPlus.
	aBlock value.
	self indentMinus
]

{ #category : #visiting }
MeWritterVisitor >> indent [

	1 to: indentNumber do: [ :i | 
	1 to: indentSize do: [ :j | self <<< String space ] ]
]

{ #category : #visiting }
MeWritterVisitor >> indentMinus [
	indentNumber := indentNumber - 1
]

{ #category : #visiting }
MeWritterVisitor >> indentPlus [
	indentNumber := indentNumber + 1
]

{ #category : #visiting }
MeWritterVisitor >> initialize [
	super initialize.
	indentNumber := 0.
	indentSize := 4
]

{ #category : #accessing }
MeWritterVisitor >> outputStream [

	^ outputStream
]

{ #category : #accessing }
MeWritterVisitor >> outputStream: anObject [

	outputStream := anObject
]

{ #category : #visiting }
MeWritterVisitor >> visit: meEntity [
	meEntity accept: self
]

{ #category : #visiting }
MeWritterVisitor >> visitClass: aMeClass [

	self
		<< 'class ';
		<<< aMeClass name
]

{ #category : #visiting }
MeWritterVisitor >> visitClassDiagram: aClassDiagram [

	self << 'classDiagram'.
	aClassDiagram classes ifNotEmpty: [ :classes | 
		self cr.
		self inIndent: [ 
			classes
				do: [ :class | class accept: self ]
				separatedBy: [ self cr ] ] ].
	aClassDiagram relations ifNotEmpty: [ :relations | 
		self cr.
		self inIndent: [ 
			relations
				do: [ :relation | relation accept: self ]
				separatedBy: [ self cr ] ] ]
]

{ #category : #visiting }
MeWritterVisitor >> visitRelation: aRelation [

	self
		<< aRelation fromClass name;
		<<< ' ';
		<<< aRelation fromRelationType leftIdentifier;
		<<< '--';
		<<< aRelation toRelationType rightIdentifier;
		<<< ' ';
		<<< aRelation toClass name
]
