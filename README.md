## Simple calculator on Flutter

The main feature of the project is the **absence of dependencies**. Everything is created
manually, from styles to calculation logic.

`InheritedWidget` is used to control the state of the calculator.

Buttons are processed through callbacks passed to `InheritedWidget`, as well as through strategies
for handling incoming characters. There are 4 separate strategies for processing **point**,
**operators**, **digits** and **percent**.

## Demo

<section style="display: inline-block">
<b>Android</b> <br/>

<img src=".github/android.gif" width="300">
</section>

<section style="display: inline-block">
<b>IOS</b> <br/>
<img src=".github/ios.gif" width="300">
</section>

<br/>

<b>Web</b><br/>
<img src=".github/web.gif" width="500">
