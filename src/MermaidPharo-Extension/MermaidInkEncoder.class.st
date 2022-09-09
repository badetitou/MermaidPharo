"
I am an encoder for [mermaid.ink](https://mermaid.ink)
"
Class {
	#name : #MermaidInkEncoder,
	#superclass : #Object,
	#category : #'MermaidPharo-Extension'
}

{ #category : #converting }
MermaidInkEncoder >> compress: data [

	^ Zlib new
		  compress: data
		  firstIndex: 1
		  byteLength: data size
		  level: 9
		  forGzip: false
]

{ #category : #converting }
MermaidInkEncoder >> convertToBase64URLsafe: compressedData [

	^ ((compressedData base64Encoded copyReplaceAll: '/' with: '%2F')
		   copyReplaceAll: '+'
		   with: '%2B') copyReplaceAll: '=' with: '%3D'
]

{ #category : #converting }
MermaidInkEncoder >> encode: aClassDiagramString [

	| data compressedData |
	data := (self insertInTemplate: aClassDiagramString) asByteArray.
	compressedData := self compress: data.
	^ self convertToBase64URLsafe: compressedData
]

{ #category : #converting }
MermaidInkEncoder >> encodeDiagram: aMeDiagram [

	^ self encode: (aMeDiagram exportWith: aMeDiagram class defaultWritter new)
]

{ #category : #converting }
MermaidInkEncoder >> formatClassDiagramString: aClassDiagramString [

	^ (aClassDiagramString copyReplaceAll: String cr with: '<1s>')
		  copyReplaceAll: String lf
		  with: '<1s>'
]

{ #category : #converting }
MermaidInkEncoder >> insertInTemplate: aClassDiagramString [
	^ ((String streamContents: [ :stream | 
		  stream
			  << '{"code":"';
			  << (self formatClassDiagramString: aClassDiagramString);
			  <<
				  '","mermaid":"{<1s>  \"theme\": \"dark\"<1s>}","updateEditor":false,"autoSync":true,"updateDiagram":false}' ]) 
		 copyReplaceAll: '<1s>' with:  '\n')
]
