"
A MeWritterVisitorFlowchartTest is a test class for testing the behavior of MeWritterVisitorFlowchart
"
Class {
	#name : #MeWritterVisitorFlowchartTest,
	#superclass : #TestCase,
	#instVars : [
		'writter'
	],
	#category : #'MermaidPharo-Writter-Flowchart-Tests'
}

{ #category : #initialization }
MeWritterVisitorFlowchartTest >> setUp [
	super setUp.
	writter := MeWritterVisitorFlowchart new
]

{ #category : #initialization }
MeWritterVisitorFlowchartTest >> testWriteDiagramWithOneNode [

	| flowchartDiagram result |
	flowchartDiagram := MeFlowchartDiagram new.
	flowchartDiagram direction: MeFCDirection TB.
	flowchartDiagram addDefinition: (MeFCNode named: 'B') .
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          flowchartDiagram accept: writter ].
	self assert: result equals: 'flowchart TB
    B'
]

{ #category : #initialization }
MeWritterVisitorFlowchartTest >> testWriteFlowchartDiagram [

	| flowchartDiagram result |
	flowchartDiagram := MeFlowchartDiagram new.
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          flowchartDiagram accept: writter ].
	self assert: result equals: 'flowchart'
]

{ #category : #initialization }
MeWritterVisitorFlowchartTest >> testWriteFlowchartDiagramWithDirection [

	| flowchartDiagram result |
	flowchartDiagram := MeFlowchartDiagram new.
	flowchartDiagram direction: MeFCDirection TB.
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          flowchartDiagram accept: writter ].
	self assert: result equals: 'flowchart TB'
]

{ #category : #initialization }
MeWritterVisitorFlowchartTest >> testWriteNodeWithName [

	| result |
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          (MeFCNode named: 'B') accept: writter ].
	self assert: result equals: 'B'
]

{ #category : #initialization }
MeWritterVisitorFlowchartTest >> testWriteNodeWithTitleAndStadiumShape [

	| result |
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          ((MeFCNode named: 'B')
			           text: 'I am B';
			           shape: MeFCShapeStadium new;
			           yourself) accept: writter ].
	self assert: result equals: 'B([I am B])'
]

{ #category : #initialization }
MeWritterVisitorFlowchartTest >> testWriteNodeWithTitleButNoShape [

	| result |
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          ((MeFCNode named: 'B')
			           text: 'I am B';
			           yourself) accept: writter ].
	self assert: result equals: 'B[I am B]'
]

{ #category : #initialization }
MeWritterVisitorFlowchartTest >> testWriteNodeWithoutAndStadiumShape [

	| result |
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          ((MeFCNode named: 'B')
			           shape: MeFCShapeStadium new;
			           yourself) accept: writter ].
	self assert: result equals: 'B([B])'
]

{ #category : #initialization }
MeWritterVisitorFlowchartTest >> testWriteNodeWithoutName [

	self
		should: [ MeFCNode new accept: writter ]
		raise: MeFCNodeNoNameError
]
