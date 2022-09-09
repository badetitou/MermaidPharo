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
