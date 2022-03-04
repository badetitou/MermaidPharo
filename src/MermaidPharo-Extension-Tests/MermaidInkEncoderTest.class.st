"
A MermaidInkEncoderTest is a test class for testing the behavior of MermaidInkEncoder
"
Class {
	#name : #MermaidInkEncoderTest,
	#superclass : #TestCase,
	#category : #'MermaidPharo-Extension-Tests'
}

{ #category : #tests }
MermaidInkEncoderTest >> testEncodeString [

	"encode"

	| data ws expected |
	data := ('{"code":"classDiagram<1s>    class A <1s>    class B","mermaid":"{<1s>  \"theme\": \"dark\"<1s>}","updateEditor":false,"autoSync":true,"updateDiagram":false}' 
		         expandMacrosWith: '\n') asByteArray.
	"compress"
	ws := ByteArray streamContents: [ :stream | 
		      Zlib new
			      compress: data
			      firstIndex: 1
			      byteLength: data size
			      level: 9
			      on: stream ].
	"base64 encode in URL safe"
	expected := (((ws copyFrom: 2 to: ws size) base64Encoded
		              copyReplaceAll: '/'
		              with: '%2F') copyReplaceAll: '+' with: '%2B')
		            copyReplaceAll: '='
		            with: '%3D'.

	self
		assert: (MermaidInkEncoder new encode: 'classDiagram
    class A 
    class B')
		equals: expected
]

{ #category : #test }
MermaidInkEncoderTest >> testFormatClassDiagramString [

	self
		assert:
			(MermaidInkEncoder new formatClassDiagramString: 'classDiagram
    class A 
    class B')
		equals: 'classDiagram<1s>    class A <1s>    class B'
]

{ #category : #test }
MermaidInkEncoderTest >> testInsertInTemplate [

	self
		assert:
			(MermaidInkEncoder new insertInTemplate: 'classDiagram
    class A 
    class B')
		equals: '{"code":"classDiagram\n    class A \n    class B","mermaid":"{\n  \"theme\": \"dark\"\n}","updateEditor":false,"autoSync":true,"updateDiagram":false}'
]
