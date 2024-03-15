import 'package:flutter/material.dart';
import 'package:myapp/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            Flexible(
              child: LoginButton(
                color: Colors.deepPurple,
                text: 'Continue as guest',
                icon: FontAwesomeIcons.userNinja,
                loginMethod: AuthService().anonymousLogin,
              ),
            ),
            LoginButton(
              color: Colors.black,
              text: 'Login with Google',
              icon: FontAwesomeIcons.google,
              loginMethod: AuthService().googleLogin,
            )
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton(
      {super.key,
      required this.color,
      required this.text,
      required this.icon,
      required this.loginMethod});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        onPressed: () => loginMethod(),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(24),
          backgroundColor: color,
        ),
        label: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
