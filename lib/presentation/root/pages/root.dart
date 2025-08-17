
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Root Page'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Root Page',
        ),
      ),
    );
  }
}