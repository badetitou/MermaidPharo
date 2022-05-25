# MermaidPharo

[![CI](https://github.com/badetitou/MermaidPharo/actions/workflows/CI.yml/badge.svg)](https://github.com/badetitou/MermaidPharo/actions/workflows/CI.yml)
[![Coverage Status](https://coveralls.io/repos/github/badetitou/MermaidPharo/badge.svg?branch=main)](https://coveralls.io/github/badetitou/MermaidPharo?branch=main)

You can use mle to generate [MermaidJS](https://mermaid-js.github.io) diagram from Pharo.

## Example

```st
P2M new
 pharoClasses: MeEntity allSubclasses;
 generateClassDiagram
```

## Moose Example

After loading the `moose` group, a common usage is:

```st
diagram := M2M new
	metamodel: GLHModel resetMetamodel;
	withoutBlock: [ :class | (class name endsWith: #Model) 
		or: [ class package name ~= GLHModel class package name
			or: [ (class name endsWith: #Entity) ] ]];
	generateClassDiagram.
```

> The without block enable to only select the interesting entities of the metamodel
