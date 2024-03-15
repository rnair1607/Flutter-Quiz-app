import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/services/auth.dart';
import 'package:myapp/services/models.dart';
import 'package:myapp/shared/error.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().currentUser;
    // print(report.total);
    if (user != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(user.displayName ?? 'Guest'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 48, // Image radius
                backgroundImage: NetworkImage(user.photoURL as String),
              ),
              Text(
                user.email as String,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: Center(
                  child: Text(
                    '${report.total}',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await AuthService().signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                },
                child: const Text(
                  'Sign out',
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const ErrorMessage(
        message: 'Something went wrong!',
      );
    }
  }
}
