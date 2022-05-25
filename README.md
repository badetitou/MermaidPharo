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
