"
I am a [mermaid flowchart diagram](https://mermaid-js.github.io/mermaid/#/flowchart)
"
Class {
	#name : #MeFlowchartDiagram,
	#superclass : #MeDiagram,
	#instVars : [
		'direction',
		'definitions'
	],
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #accessing }
MeFlowchartDiagram >> accept: mermaidWritter [
	mermaidWritter visitFlowchartDiagram: self 
]

{ #category : #accessing }
MeFlowchartDiagram >> definitions [

	^ definitions
]

{ #category : #accessing }
MeFlowchartDiagram >> definitions: anObject [

	definitions := anObject
]

{ #category : #accessing }
MeFlowchartDiagram >> direction [

	^ direction
]

{ #category : #accessing }
MeFlowchartDiagram >> direction: anObject [

	direction := anObject
]
