"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMermaidPharoFlowchart,
	#superclass : #PackageManifest,
	#category : #'MermaidPharo-Flowchart-Manifest'
}

{ #category : #'code-critics' }
ManifestMermaidPharoFlowchart class >> ruleUsesAddRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MeFlowchartDiagram #addDefinition: #false)) #'2022-09-09T13:31:54.44+02:00') )
]
