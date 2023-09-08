"
My entrypoint is `visitClassDiagram: aClassDiagram`.
I provide a canvas with the rossal class diagram
"
Class {
	#name : #MeRSClassDiagramExporter,
	#superclass : #MeWritterVisitor,
	#instVars : [
		'canvas',
		'builder',
		'diagram'
	],
	#category : #'MermaidPharo-Roassal-ClassDiagram-Manifest'
}

{ #category : #visiting }
MeRSClassDiagramExporter >> rsClassDescriptor [

	^ RSUMLClassDescriptor new
		  classname: #name;
		  instVars: [ :cls | cls attributes collect: #name ];
		  methods: [ :meClass | meClass methods ];
		  isAbstract: false;
		  superclass: [ :meClass |
			  (diagram relations select: [ :rel |
					   rel toClass = meClass and: [
							   rel fromRelationType isKindOf: MeCDInheritanceRelationType ] ])
				  ifNotEmpty: [ :inheritanceRelations |
					  inheritanceRelations anyOne fromClass ]
				  ifEmpty: [ nil ] ];
		methodSelector: [ :method | method name ];
		  methodsLimit: SmallInteger maxVal
]

{ #category : #visiting }
MeRSClassDiagramExporter >> visitClass: aMeClass [
	builder classes add: aMeClass
	
]

{ #category : #visiting }
MeRSClassDiagramExporter >> visitClassDiagram: aClassDiagram [

	diagram := aClassDiagram.
	canvas := RSCanvas new.
	builder := RSUMLClassBuilder new.
	builder modelDescriptor: self rsClassDescriptor.
	aClassDiagram classes ifNotEmpty: [ :classes |.
		builder classes: OrderedCollection new.
		classes do: [ :class | class accept: self ] ].
	builder build.
	builder renderIn: canvas.
	canvas zoomToFit.
	canvas @ RSCanvasController.
	^ canvas
]
