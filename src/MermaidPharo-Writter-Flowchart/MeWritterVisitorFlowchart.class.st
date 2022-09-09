Class {
	#name : #MeWritterVisitorFlowchart,
	#superclass : #MeWritterVisitor,
	#category : #'MermaidPharo-Writter-Flowchart'
}

{ #category : #visiting }
MeWritterVisitorFlowchart >> visitFlowchartDiagram: aFlowchartDiagram [
	self <<< 'flowchart'
]
