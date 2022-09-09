"
A MeWritterVisitorFlowchartTest is a test class for testing the behavior of MeWritterVisitorFlowchart
"
Class {
	#name : #MeWritterVisitorFlowchartTest,
	#superclass : #TestCase,
	#instVars : [
		'writter',
		'result'
	],
	#category : #'MermaidPharo-Writter-Flowchart-Tests'
}

{ #category : #initialization }
MeWritterVisitorFlowchartTest >> setUp [
	super setUp.
	writter := MeWritterVisitorFlowchart new
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

	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          (MeFCNode named: 'B') accept: writter ].
	self assert: result equals: 'B'
]

{ #category : #initialization }
MeWritterVisitorFlowchartTest >> testWriteNodeWithTitleAndStadiumShape [

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

	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          ((MeFCNode named: 'B')
			           text: 'I am B';
			           yourself) accept: writter ].
	self assert: result equals: 'B[I am B]'
]

{ #category : #initialization }
MeWritterVisitorFlowchartTest >> testWriteNodeWithoutAndStadiumShape [

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
		assertBlock: [ MeFCNode new accept: writter ]
		raises: MeFCNodeNoNameError
]
