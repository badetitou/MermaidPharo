Class {
	#name : #MeFCDirection,
	#superclass : #MeEntity,
	#instVars : [
		'directionIdentifier'
	],
	#category : #'MermaidPharo-Flowchart'
}

{ #category : #'as yet unclassified' }
MeFCDirection class >> BT [

	^ self new
		  directionIdentifier: 'BT';
		  yourself
]

{ #category : #'as yet unclassified' }
MeFCDirection class >> LR [
	^ self new
		  directionIdentifier: 'LR';
		  yourself
]

{ #category : #'as yet unclassified' }
MeFCDirection class >> RL [

	^ self new
		  directionIdentifier: 'RL';
		  yourself
]

{ #category : #'as yet unclassified' }
MeFCDirection class >> TB [

	^ self new
		  directionIdentifier: 'TB';
		  yourself
]

{ #category : #'as yet unclassified' }
MeFCDirection class >> TD [

	^ self new
		  directionIdentifier: 'TD';
		  yourself
]

{ #category : #'as yet unclassified' }
MeFCDirection class >> bottomToTop [
	^ self BT
]

{ #category : #'as yet unclassified' }
MeFCDirection class >> leftToRight [
	^ self LR
]

{ #category : #'as yet unclassified' }
MeFCDirection class >> rightToLeft [
	^ self RL
]

{ #category : #'as yet unclassified' }
MeFCDirection class >> toToBottom [
	^ self TB
]

{ #category : #'as yet unclassified' }
MeFCDirection class >> topDown [
	^ self TD
]

{ #category : #accessing }
MeFCDirection >> directionIdentifier [

	^ directionIdentifier
]

{ #category : #accessing }
MeFCDirection >> directionIdentifier: anObject [

	directionIdentifier := anObject
]
