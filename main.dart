import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Check Network Connectivity',
debugShowCheckedModeBanner: false,
theme: ThemeData(
),
home: MyHomePage(),
);
}
}

class MyHomePage extends StatefulWidget {
@override
_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
String result = '';
var Colorsvalue = Colors.white;

@override
void initState() {
CheckStatus();
super.initState();
}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colorsvalue,
body: Container(
alignment: Alignment.center,
child: Text(
result != null ? result : 'Unknown',
style: TextStyle(
color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25),
),
),
);
}

void CheckStatus() {
Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
if (result == ConnectivityResult.mobile ||
result == ConnectivityResult.wifi) {
ChangeValues("Connected", Colors.purple);
} else {
ChangeValues("No Internet", Colors.red);
}
});
}

void ChangeValues(String resultvalue, Color colorvalue) {
setState(() {
result = resultvalue;
Colorsvalue = colorvalue;
});
}
}