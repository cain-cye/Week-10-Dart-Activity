# PC16 - Mobile Development with Lab
- Name: Ebuenga, Caryl Yasmin P.
- Year and Section: 3.3 BSIT
- Course: Mobile Development with Lab
## Week 10 Activity: Object-Oriented Programming in Dart (Part 2)

### Overview
This project expands upon the Week 9 Whiteboard class by establishing an entity hierarchy in Dart. It incorporates key Object-Oriented Programming (OOP) concepts, including Inheritance, Polymorphism, Abstract Classes, and Mixins.

---

### Rubric Implementation & Structure

- **Abstract Class / Interface**
  - `Displayable` defines the required `void render()` method contract that child components must fulfill.

- **Base Class**
  - `Whiteboard` implements `Displayable` and holds common properties (`color`, `dimensions`) alongside encapsulated state (`_currentContent`).

- **Derived Classes (Inheritance)**
  - `InteractiveBoard` and `MagneticBoard` inherit from `Whiteboard` using the `extends` keyword.

- **Polymorphism**
  - Both derived classes use `@override` on the `render()` method to display specialized outputs tailored to their specific board type.

- **Mixin**
  - `WiFiConnectable` provides Wi-Fi capability to `InteractiveBoard` using `with` without cluttering the main inheritance chain.

---
### How to Run
1. Paste the code into [DartPad](https://dartpad.dev/) 
