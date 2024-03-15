import 'package:myapp/topics/topics.dart';
import 'package:myapp/profile/profile.dart';
import 'package:myapp/login/login.dart';
import 'package:myapp/home/home.dart';
import 'package:myapp/about/about.dart';

var appRoutes = {
  '/': (context) => const Home(),
  '/login': (context) => const Login(),
  '/topics': (context) => const Topics(),
  '/profile': (context) => const Profile(),
  '/about': (context) => const About(),
};
