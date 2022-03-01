Class {
	#name : #MeCDRelationType,
	#superclass : #MeEntity,
	#category : #'MermaidPharo-ClassDiagram'
}

{ #category : #'as yet unclassified' }
MeCDRelationType >> leftIdentifier [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
MeCDRelationType >> rightIdentifier [
	"the string when print at right position"
	^ self subclassResponsibility
]
