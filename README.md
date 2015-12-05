# ForceDirectedLayout

## Introduction

Force Directed Layout is a data visualization tool designed to act as a
standalone physics sandbox. Through the use of straightforward interactions between
forces and objects the scene can display vertex-edge relationships loaded from
a .csv file.

## Screenshots

In this gif, the user's mouse cursor rotates the Bounding Box and Atoms connected with
Springs. Gravity has been temporarily disabled and the Coulomb and Hooke forces have
reached a stable configuration.

![alt tag](https://raw.github.com/jakemingolla/ForceDirectedLayout/master/public/release-v1.2.gif)

## Releases

**Current Release** [v1.2](https://github.com/jakemingolla/ForceDirectedLayout/releases/tag/v1.2)

*Release Notes*

* Added parser for reading from .cvs files 
* Added Hooke's Law to each edge to act as a spring with ideal length

**Past Releases** [v1.1](https://github.com/jakemingolla/ForceDirectedLayout/releases/tag/v1.1)

*Release Notes*

* Edge abstract class now meet the Updateable interface
* Minor Gravitational / Coulomb constant tweaks

#### Dependencies

* [OpenGL >3.3](https://www.opengl.org/sdk/docs/man3/)
* [Processing 3.0](https://processing.org/download/?processing)
* A display that can handle 800 x 600 resolution


#### Other Notes

* Due to Processing limitations, all files must be in the same directory. Thus there
can be no file structure for separation of services within the code structure.
* Special thanks to Tufts University professor [Remco Chang](http://www.cs.tufts.edu/~remco/)
without whom this visualization would be impossible.
