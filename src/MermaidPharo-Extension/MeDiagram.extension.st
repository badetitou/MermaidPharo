Extension { #name : #MeDiagram }

{ #category : #'*MermaidPharo-Extension' }
MeDiagram >> meInspectMermaidDiagram: aBuilder [

	"protocol: #'as yet unclassified'"

	<inspectorPresentationOrder: -2 title: 'Mermaid Diagram'>
	| encodedDiagram |
	encodedDiagram := MermaidInkEncoder new encodeDiagram: self.
	^ SpPresenter new
		  layout: (aBuilder newBoxLayoutTopToBottom
				   add: (aBuilder newButton
						    label: 'Open SVG on web';
						    action: [ 
							    WebBrowser openOn:
									    'https://mermaid.ink/svg/pako:' , encodedDiagram ];
						    yourself)
				   height: UITheme current buttonMinHeight * 1.5;
				   add: (aBuilder newImage
						    image: (ZnEasy
								     getImageOfType: ZnMimeType imageJpeg
								     fromUrl: 'https://mermaid.ink/img/pako:' , encodedDiagram);
						    yourself);
				   yourself);
		  yourself
]
