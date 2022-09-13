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
MeWritterVisitorFlowchartTest >> testWriteArrowRelationBetweenTwoNodes [

	| result a b link |
	a := (MeFCNode named: 'A').
	b := (MeFCNode named: 'B').
	link := MeFCLink newFromNode: a toNode: b.
	link toArrowType: MeFCArrowHeadType new.
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          link accept: writter ].
	self assert: result equals: 'A --> B'
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
MeWritterVisitorFlowchartTest >> testWriteDiagramWithTwoNodes [

	| flowchartDiagram result |
	flowchartDiagram := MeFlowchartDiagram new.
	flowchartDiagram direction: MeFCDirection TB.
	flowchartDiagram addDefinition: (MeFCNode named: 'B'); addDefinition: (MeFCNode named: 'A') .
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          flowchartDiagram accept: writter ].
	self assert: result equals: 'flowchart TB
    B
    A'
]

{ #category : #initialization }
MeWritterVisitorFlowchartTest >> testWriteDiagramWithTwoNodesAndOneLink [

	| flowchartDiagram result nodeA nodeB linkAB|
	nodeB := (MeFCNode named: 'B').
	nodeA := (MeFCNode named: 'A').
	
	linkAB := MeFCLink newFromNode: nodeA toNode: nodeB.
   linkAB toArrowType: MeFCArrowHeadType new.
	
	flowchartDiagram := MeFlowchartDiagram new.
	flowchartDiagram direction: MeFCDirection TB.
	flowchartDiagram addDefinition: nodeB; addDefinition: nodeA .
	flowchartDiagram addDefinition: linkAB.

	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          flowchartDiagram accept: writter ].
	self assert: result equals: 'flowchart TB
    B
    A
    A --> B'
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

{ #category : #initialization }
MeWritterVisitorFlowchartTest >> testWriteRelationBetweenTwoNodes [

	| result a b link |
	a := (MeFCNode named: 'A').
	b := (MeFCNode named: 'B').
	link := MeFCLink newFromNode: a toNode: b.
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          link accept: writter ].
	self assert: result equals: 'A --- B'
]

{ #category : #initialization }
MeWritterVisitorFlowchartTest >> testWriteTwoArrowRelationBetweenTwoNodes [

	| result a b link |
	a := MeFCNode named: 'A'.
	b := MeFCNode named: 'B'.
	link := MeFCLink newFromNode: a toNode: b.
	link toArrowType: MeFCArrowHeadType new.
	link fromArrowType: MeFCArrowHeadType new.
	result := String streamContents: [ :stream | 
		          writter outputStream: stream.
		          link accept: writter ].
	self assert: result equals: 'A <-> B'
]
