import 'package:flutter/material.dart';

import 'login_screens/navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
          title: const Text(
            'Home',
          ),
          centerTitle: true),
      body: const Align(
        child: Text(
          "Howdy",
          style: TextStyle(fontSize: 32),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
