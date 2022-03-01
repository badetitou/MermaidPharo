Class {
	#name : #MeClassDiagramWritterVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'writter',
		'classDiagram'
	],
	#category : #'MermaidPharo-Writter-Tests'
}

{ #category : #running }
MeClassDiagramWritterVisitorTest >> setUp [
	super setUp.
	writter := MeWritterVisitor new.
	classDiagram := MeClassDiagram new
]

{ #category : #running }
MeClassDiagramWritterVisitorTest >> testWriteClassDiagramWithOnClass [

	| result |
	classDiagram addClass: (MeClass new
			 name: 'Duck';
			 yourself).
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          classDiagram accept: writter ].
	self assert: result equals: 'classDiagram
    class Duck'
]

{ #category : #running }
MeClassDiagramWritterVisitorTest >> testWriteClassDiagramWithTwoClassesAndInheritance [

	| result classA classB relation |
	classA := MeClass new
		          name: 'DuckA';
		          yourself.
	classB := MeClass new
		          name: 'DuckB';
		          yourself.
	relation := MeCDRelation inheritFrom: classA to: classB.
	classDiagram addClass: classA.
	classDiagram addClass: classB.
	classDiagram addRelation: relation.
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          classDiagram accept: writter ].
	self assert: result equals: 'classDiagram
    class DuckA
    class DuckB
    DuckA <|-- DuckB'
]

{ #category : #running }
MeClassDiagramWritterVisitorTest >> testWriteClassDiagramWithTwoClassesAndRelation [

	| result classA classB relation |
	classA := MeClass new
		          name: 'DuckA';
		          yourself.
	classB := MeClass new
		          name: 'DuckB';
		          yourself.
	relation := MeCDRelation from: classA to: classB.
	classDiagram addClass: classA.
	classDiagram addClass: classB.
	classDiagram addRelation: relation.
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          classDiagram accept: writter ].
	self assert: result equals: 'classDiagram
    class DuckA
    class DuckB
    DuckA -- DuckB'
]
