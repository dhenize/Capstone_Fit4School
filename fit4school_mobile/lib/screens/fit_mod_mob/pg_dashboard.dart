import 'package:flutter/material.dart';

class PgDashboard extends StatelessWidget {
  const PgDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 140,
        backgroundColor: Color(0xFF0FAFFF),
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.mail), label: 'Inbox'),
          NavigationDestination(icon: Icon(Icons.view_in_ar), label: 'AR Fitting'),
          NavigationDestination(icon: Icon(Icons.receipt_long), label: 'Transaction'),
          NavigationDestination(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }
}
