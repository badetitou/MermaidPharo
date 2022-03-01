"
I visit a MeDiagram or MeEntity and print it in a stream
"
Class {
	#name : #MeWritterVisitor,
	#superclass : #Object,
	#instVars : [
		'outputStream'
	],
	#category : #'MermaidPharo-Writter'
}

{ #category : #visiting }
MeWritterVisitor >> << aString [
	self indent.
	self <<< aString
]

{ #category : #visiting }
MeWritterVisitor >> <<< aString [
	outputStream << aString
]

{ #category : #visiting }
MeWritterVisitor >> indent [
]

{ #category : #accessing }
MeWritterVisitor >> outputStream [

	^ outputStream
]

{ #category : #accessing }
MeWritterVisitor >> outputStream: anObject [

	outputStream := anObject
]

{ #category : #visiting }
MeWritterVisitor >> visit: meEntity [
	meEntity accept: self
]

{ #category : #visiting }
MeWritterVisitor >> visitClassDiagram: aClassDiagram [
	self << 'classDiagram'
]
