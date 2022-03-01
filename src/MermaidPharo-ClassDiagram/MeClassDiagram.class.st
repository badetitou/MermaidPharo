"
I am a [Mermaid Class Diagram](https://mermaid-js.github.io/mermaid/#/classDiagram)
"
Class {
	#name : #MeClassDiagram,
	#superclass : #MeDiagram,
	#category : #'MermaidPharo-ClassDiagram'
}

{ #category : #visiting }
MeClassDiagram >> accept: mermaidWritter [
	mermaidWritter visitClassDiagram: self 
]
