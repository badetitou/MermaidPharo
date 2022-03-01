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
	self assert: result equals: 'Duck'
]

{ #category : #running }
MeWritterVisitorTest >> testWriteClassDiagram [

	| result |
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          MeClassDiagram new accept: writter ].
	self assert: result equals: 'classDiagram'
]
