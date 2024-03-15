import 'package:flutter/material.dart';
import 'package:myapp/login/login.dart';
import 'package:myapp/services/auth.dart';
import 'package:myapp/topics/topics.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          } else if (snapshot.hasData) {
            return const Topics();
          } else {
            return const Login();
          }
        });
  }
}
