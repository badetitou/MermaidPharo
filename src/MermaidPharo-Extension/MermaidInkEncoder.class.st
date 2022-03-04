"
I am an encoder for mermaid.ink

```st
""encode""
data :=  ('{""code"":""classDiagram<1s>    class A <1s>    class B"",""mermaid"":""{<1s>  \""theme\"": \""dark\""<1s>}"",""updateEditor"":false,""autoSync"":true,""updateDiagram"":false}' expandMacrosWith: '\n')  asByteArray.
""compress""
ws := ByteArray streamContents: [:stream |
Zlib new
	compress: data
	firstIndex: 1
	byteLength: data size
	level: 9
	on: stream.
]. 
""base64 encode in URL safe""
((((ws copyFrom: 2 to: ws size) base64Encoded) copyReplaceAll: '/' with: '%2F') copyReplaceAll: '+' with: '%2B') copyReplaceAll: '=' with: '%3D'. 
```
"
Class {
	#name : #MermaidInkEncoder,
	#superclass : #Object,
	#category : #'MermaidPharo-Extension'
}
