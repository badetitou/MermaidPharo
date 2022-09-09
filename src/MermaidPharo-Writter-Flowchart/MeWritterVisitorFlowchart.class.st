Class {
	#name : #MeWritterVisitorFlowchart,
	#superclass : #MeWritterVisitor,
	#category : #'MermaidPharo-Writter-Flowchart'
}

{ #category : #visiting }
MeWritterVisitorFlowchart >> visitFCNode: aMeFCNode [

	aMeFCNode name ifNil: [ MeFCNodeNoNameError signal ].
	self <<< aMeFCNode name.

	aMeFCNode text
		ifNotNil: [ :text | 
			aMeFCNode shape
				ifNotNil: [ :shape | self <<< shape leftIdentifier ]
				ifNil: [ self <<< '[' ].
			self <<< text.
			aMeFCNode shape
				ifNotNil: [ :shape | self <<< shape rightIdentifier ]
				ifNil: [ self <<< ']' ] ]
		ifNil: [ "No text but might have a shape"
			aMeFCNode shape ifNotNil: [ :shape | 
				self
					<<< shape leftIdentifier;
					<<< aMeFCNode name;
					<<< shape rightIdentifier ] ]
]

{ #category : #visiting }
MeWritterVisitorFlowchart >> visitFlowchartDiagram: aFlowchartDiagram [

	self <<< 'flowchart'.
	aFlowchartDiagram direction ifNotNil: [ :direction | 
		self
			<<< ' ';
			<<< direction directionIdentifier ]
]
