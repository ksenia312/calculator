## Simple calculator on Flutter

The main feature of the project is the absence of dependencies. Everything is created exclusively manually, from styles to calculation logic.

- `InheritedWidget` was used to control the state of the calculator.
- Buttons are processed through callbacks passed to `InheritedWidget`, as well as through strategies for handling incoming characters. There are 4 separate strategies for processing **point**, **operators**, **digits** and **percent**. 
