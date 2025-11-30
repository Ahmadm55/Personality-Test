import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onStart;

  const StartScreen({Key? key, required this.onStart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome to Personality Test',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: onStart, child: Text('Start Test')),
          ],
        ),
      ),
    );
  }
}
