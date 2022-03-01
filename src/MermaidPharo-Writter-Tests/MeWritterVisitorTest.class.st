"
A MeWritterVisitorTest is a test class for testing the behavior of MeWritterVisitor
"
Class {
	#name : #MeWritterVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'writter'
	],
	#category : #'MermaidPharo-Writter-Tests'
}

{ #category : #running }
MeWritterVisitorTest >> setUp [
	super setUp.
	writter := MeWritterVisitor new
]

{ #category : #running }
MeWritterVisitorTest >> testWriteClass [

	| result |
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          (MeClass new name: 'Duck'; yourself) accept: writter ].
	self assert: result equals: 'class Duck'
]

{ #category : #running }
MeWritterVisitorTest >> testWriteClassDiagram [

	| result |
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          MeClassDiagram new accept: writter ].
	self assert: result equals: 'classDiagram'
]

{ #category : #running }
MeWritterVisitorTest >> testWriteDashedRelation [

	| result classA classB relation |
	classA := MeClass new name: 'ClassA'; yourself.
	classB := MeClass new name: 'ClassB'; yourself.
	relation := MeCDRelation new.
	relation fromClass: classA.
	relation toClass: classB.
	relation beDashed.
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          relation accept: writter ].
	self assert: result equals: 'ClassA .. ClassB'
]

{ #category : #running }
MeWritterVisitorTest >> testWriteRelation [

	| result classA classB relation |
	classA := MeClass new name: 'ClassA'; yourself.
	classB := MeClass new name: 'ClassB'; yourself.
	relation := MeCDRelation new.
	relation fromClass: classA.
	relation toClass: classB.
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          relation accept: writter ].
	self assert: result equals: 'ClassA -- ClassB'
]

{ #category : #running }
MeWritterVisitorTest >> testWriteRelationLabel [

	| result classA classB relation |
	classA := MeClass new name: 'ClassA'; yourself.
	classB := MeClass new name: 'ClassB'; yourself.
	relation := MeCDRelation new.
	relation fromClass: classA.
	relation toClass: classB.
	relation label: 'A Label'.
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          relation accept: writter ].
	self assert: result equals: 'ClassA -- ClassB : A Label'
]

{ #category : #running }
MeWritterVisitorTest >> testWriteSolidRelation [

	| result classA classB relation |
	classA := MeClass new
		          name: 'ClassA';
		          yourself.
	classB := MeClass new
		          name: 'ClassB';
		          yourself.
	relation := MeCDRelation new.
	relation fromClass: classA.
	relation toClass: classB.
	relation
		beDashed;
		beSolid.
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          relation accept: writter ].
	self assert: result equals: 'ClassA -- ClassB'
]
