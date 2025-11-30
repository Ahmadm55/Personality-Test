import 'package:flutter/material.dart';
import 'models/personality.dart';
import 'models/question.dart';
import 'models/answer.dart';
import 'data/questions.dart';
import 'screens/start_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(const PersonalityTestApp());
}

class PersonalityTestApp extends StatefulWidget {
  const PersonalityTestApp({Key? key}) : super(key: key);

  @override
  State<PersonalityTestApp> createState() => _PersonalityTestAppState();
}

class _PersonalityTestAppState extends State<PersonalityTestApp> {
  int _index = -1; // -1 = start screen
  late Map<Personality, int> _scores;

  @override
  void initState() {
    super.initState();
    _resetScores();
  }

  void _resetScores() {
    _scores = {
      Personality.Thinker: 0,
      Personality.Feeler: 0,
      Personality.Planner: 0,
      Personality.Adventurer: 0,
    };
    _index = -1;
  }

  void _startTest() {
    setState(() {
      _index = 0;
    });
  }

  void _onAnswerSelected(Answer answer) {
    setState(() {
      _scores[answer.personality] = (_scores[answer.personality] ?? 0) + 1;
      _index++;
    });
  }

  Personality _calculateResult() {
    // get personality with highest score; tie-breaker: first encountered
    Personality best = Personality.Thinker;
    int bestScore = -1;
    _scores.forEach((p, s) {
      if (s > bestScore) {
        best = p;
        bestScore = s;
      }
    });
    return best;
  }

  void _restart() {
    setState(() {
      _resetScores();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget home;
    if (_index == -1) {
      home = StartScreen(onStart: _startTest);
    } else if (_index < questions.length) {
      home = QuestionScreen(
        question: questions[_index],
        onAnswerSelected: _onAnswerSelected,
        questionIndex: _index,
        total: questions.length,
      );
    } else {
      final result = _calculateResult();
      home = ResultScreen(result: result, onRestart: _restart);
    }

    return MaterialApp(
      title: 'Personality Test',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: home,
    );
  }
}
