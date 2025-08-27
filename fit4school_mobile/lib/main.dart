//IMPORTS
import 'package:flutter/material.dart';
import 'screens/fit_mod_mob/pg_dashboard.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/dashboard', // If start at Login, change to '/login'
      routes: {
        '/dashboard': (context) => PgDashboard(), // Dashboard route
      },
    );
  }
}
