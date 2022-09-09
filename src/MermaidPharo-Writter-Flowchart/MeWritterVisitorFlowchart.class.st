Class {
	#name : #MeWritterVisitorFlowchart,
	#superclass : #MeWritterVisitor,
	#category : #'MermaidPharo-Writter-Flowchart'
}

{ #category : #visiting }
MeWritterVisitorFlowchart >> visitFCLink: aMeFCLink [

	self << aMeFCLink fromNode name.
	self <<< ' '.
	aMeFCLink fromArrowType
		ifNotNil: [ :fromArrowType | self <<< fromArrowType leftIdentifier ]
		ifNil: [ self <<< aMeFCLink defaultArrowType new leftIdentifier ].
	self <<< '-'.
	aMeFCLink toArrowType
		ifNotNil: [ :toArrowType | self <<< toArrowType rightIdentifier ]
		ifNil: [ self <<< aMeFCLink defaultArrowType new rightIdentifier ].
	self <<< ' '.
	self << aMeFCLink toNode name
]

{ #category : #visiting }
MeWritterVisitorFlowchart >> visitFCNode: aMeFCNode [

	aMeFCNode name ifNil: [ MeFCNodeNoNameError signal ].
	self << aMeFCNode name.

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
			<<< direction directionIdentifier ].
	aFlowchartDiagram definitions ifNotEmpty: [ :definitions | 
		self cr.
		self inIndent: [ 
			definitions do: [ :definition | definition accept: self ] ] ]
]
