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
