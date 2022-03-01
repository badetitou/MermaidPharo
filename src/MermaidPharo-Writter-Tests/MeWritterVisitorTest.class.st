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
MeWritterVisitorTest >> testWriteClassAttribute [

	| result |
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          (MeClassAttribute new
			           name: 'aAttribute';
			           yourself) accept: writter ].
	self assert: result equals: 'aAttribute'
]

{ #category : #running }
MeWritterVisitorTest >> testWriteClassAttributeWithType [

	| result |
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          (MeClassAttribute new
			           name: 'aAttribute';
			           type: 'int';
			           yourself) accept: writter ].
	self assert: result equals: 'int aAttribute'
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
MeWritterVisitorTest >> testWriteClassMethod [

	| result |
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          (MeClassMethod new
			           name: 'aMethod';
			           yourself) accept: writter ].
	self assert: result equals: 'aMethod()'
]

{ #category : #running }
MeWritterVisitorTest >> testWriteClassMethodWithReturnType [

	| result |
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          (MeClassMethod new
			           name: 'aMethod';
			returnType: 'int';
			           yourself) accept: writter ].
	self assert: result equals: 'aMethod() int'
]

{ #category : #running }
MeWritterVisitorTest >> testWriteClassWithAttribute [

	| result classA attributeA |
	classA := MeClass new
		          name: 'ClassA';
		          yourself.
	attributeA := MeClassAttribute new
		              name: 'myAttribute';
		              type: 'int';
		              yourself.
	classA addAttribute: attributeA.
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          classA accept: writter ].
	self assert: result equals: 'class ClassA {
    int myAttribute
}'
]

{ #category : #running }
MeWritterVisitorTest >> testWriteClassWithMethod [

	| result classA methodA |
	classA := MeClass new
		          name: 'ClassA';
		          yourself.
	methodA := MeClassMethod new
		           name: 'myMethod';
		           returnType: 'int';
		           yourself.
	classA addMethod: methodA.
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          classA accept: writter ].
	self assert: result equals: 'class ClassA {
    myMethod() int
}'
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
