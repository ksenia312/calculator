## Simple calculator on Flutter

The main feature of the project is the **absence of dependencies**. Everything is created
manually, from styles to calculation logic.

`InheritedWidget` is used to control the state of the calculator.

Buttons are processed through callbacks passed to `InheritedWidget`, as well as through strategies
for handling incoming characters. There are 4 separate strategies for processing **point**,
**operators**, **digits** and **percent**.

## Demo

### Android

![android](https://github.com/user-attachments/assets/b583b4f7-6fe3-4698-bb01-a8709122f0e9)

### IOS

![ios](.github/ios.gif)


### Web

![web](.github/web.gif)



