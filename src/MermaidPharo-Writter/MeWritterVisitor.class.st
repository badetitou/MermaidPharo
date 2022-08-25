"
I visit a MeDiagram or MeEntity and print it in a stream
"
Class {
	#name : #MeWritterVisitor,
	#superclass : #Object,
	#instVars : [
		'outputStream',
		'indentNumber',
		'indentSize',
		'shouldExportAttribute',
		'shouldExportMethod',
		'endOfLine'
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
	outputStream << self endOfLine
]

{ #category : #configuration }
MeWritterVisitor >> doExportClassAttribute [
	shouldExportAttribute := true
]

{ #category : #configuration }
MeWritterVisitor >> doExportClassMethod [
	shouldExportMethod := true
]

{ #category : #configuration }
MeWritterVisitor >> doNotExportClassAttribute [
	shouldExportAttribute := false
]

{ #category : #configuration }
MeWritterVisitor >> doNotExportClassMethod [
	shouldExportMethod := false
]

{ #category : #accessing }
MeWritterVisitor >> endOfLine [

	^ endOfLine
]

{ #category : #accessing }
MeWritterVisitor >> endOfLine: anObject [

	endOfLine := anObject
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
	indentSize := 4.
	shouldExportAttribute := true.
	shouldExportMethod := true.
	endOfLine := String cr
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
		<<< aMeClass name.
	(aMeClass attributes isNotEmpty or: [ aMeClass methods isNotEmpty ]) 
		ifTrue: [ 
			self
				<<< ' {';
				cr.
			self inIndent: [ 
				shouldExportAttribute ifTrue: [ 
					aMeClass attributes ifNotEmpty: [ :attributes | 
						attributes do: [ :attribute | 
							attribute accept: self.
							self cr ] ] ].
				shouldExportMethod ifTrue: [ 
					aMeClass methods ifNotEmpty: [ :methods | 
						methods do: [ :method | 
							method accept: self.
							self cr ] ] ] ].
			self << '}' ]
]

{ #category : #visiting }
MeWritterVisitor >> visitClassAttribute: aClassAttribute [
	shouldExportAttribute ifFalse: [ ^ nil ].
	self indent.
	(aClassAttribute type isNotNil and: [ 
		 aClassAttribute type isNotEmpty ]) ifTrue: [ 
		self
			<<< aClassAttribute type;
			<<< ' ' ].
	self <<< aClassAttribute name
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
MeWritterVisitor >> visitClassMethod: aClassMethod [
	shouldExportMethod ifFalse: [ ^ nil ].
	self indent.
	self
		<<< aClassMethod name;
		<<< '()'.
	(aClassMethod returnType isNotNil and: [ 
		 aClassMethod returnType isNotEmpty ]) ifTrue: [ 
		self
			<<< ' ';
			<<< aClassMethod returnType ]
]

{ #category : #visiting }
MeWritterVisitor >> visitDiagram: aDiagram [

]

{ #category : #visiting }
MeWritterVisitor >> visitRelation: aRelation [

	self
		<< aRelation fromClass name;
		<<< ' ';
		<<< aRelation fromRelationType leftIdentifier.
	self
		<<< (aRelation isDashed
				 ifTrue: [ '..' ]
				 ifFalse: [ '--' ]);
		<<< aRelation toRelationType rightIdentifier;
		<<< ' ';
		<<< aRelation toClass name.
	(aRelation label isNotNil and: [ aRelation label isNotEmpty ]) 
		ifTrue: [ 
			self
				<<< ' : ';
				<<< aRelation label ]
]
