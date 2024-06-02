import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/news");
            },
            child: Text(
              "News",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(Size(100, 100)),
                backgroundColor: WidgetStateProperty.all(Colors.black)),
          ),
        ));
  }
}
