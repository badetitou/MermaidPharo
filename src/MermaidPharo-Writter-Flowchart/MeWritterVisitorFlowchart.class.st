Class {
	#name : #MeWritterVisitorFlowchart,
	#superclass : #MeWritterVisitor,
	#category : #'MermaidPharo-Writter-Flowchart'
}

{ #category : #visiting }
MeWritterVisitorFlowchart >> visitFlowchartDiagram: aFlowchartDiagram [

	self <<< 'flowchart'.
	aFlowchartDiagram direction ifNotNil: [ :direction | 
		self
			<<< ' ';
			<<< direction directionIdentifier ]
]
