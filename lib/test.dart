import 'package:flutter/material.dart';
import 'package:login_signup_email/login_screens/navigation.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Nutri-tracker'),
      ),
    );
  }
}
