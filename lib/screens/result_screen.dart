import 'package:flutter/material.dart';
import '../models/personality.dart';

class ResultScreen extends StatelessWidget {
  final Personality result;
  final VoidCallback onRestart;

  const ResultScreen({Key? key, required this.result, required this.onRestart})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message = personalityMessages[result] ?? '';

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onRestart,
                child: const Text('Restart Test'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
