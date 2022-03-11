Extension { #name : #FileReference }

{ #category : #'*MermaidPharo' }
FileReference >> putBinaryContents: aByteArray [

	| stream |
	self parent ensureCreateDirectory .
	self exists ifFalse: [ self createFile ].
	stream := self binaryWriteStream truncate.
	^ [ stream nextPutAll: aByteArray asByteArray ] ensure: [ 
		  stream close ]
]
