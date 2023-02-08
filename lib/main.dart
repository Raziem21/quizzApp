import 'package:flutter/material.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int totalScore = 0;
  int questionNumber = 0;
  List<Widget> scoreKeeper = [
    const SizedBox(
      height: 24,
    ),
  ];

  Map<int, List> questionsWithAnswers = {
    0: ["Trico è un cane", true],
    1: ["Il pomodoro è una verdura", false],
    2: ["Negli Stati Uniti ci sono 9 armi ogni 10 persone", true]
  };

  // List<String> questions = [
  //   "Trico è un cane",
  //   "Il pomodoro è una verdura",
  //   "Negli Stati Uniti ci sono 9 armi ogni 10 persone",
  //   "Quiz completato!",
  // ];

  // List<bool> correctAnswers = [
  //   true,
  //   false,
  //   true,
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                questionsWithAnswers[questionNumber]![0],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              onPressed: () {
                if (questionsWithAnswers[questionNumber]![1] == true) {
                  totalScore++;
                }

                setState(() {
                  if (scoreKeeper.length == 15) {
                    setState(() {
                      scoreKeeper.removeAt(0);
                    });
                  }
                });

                if (questionsWithAnswers.length - 1 > questionNumber) {
                  setState(() {
                    questionNumber++;
                  });
                }
                if (questionsWithAnswers.length > questionNumber) {
                  setState(() {
                    scoreKeeper.add(
                      const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  });
                }
              },
              child: const Text(
                "Vero",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              onPressed: () {
                if (questionsWithAnswers[questionNumber]![1] == false) {
                  totalScore++;
                }
                setState(() {
                  if (scoreKeeper.length == 15) {
                    setState(() {
                      scoreKeeper.removeAt(0);
                    });
                  }
                });
                if (questionsWithAnswers.length - 1 > questionNumber) {
                  setState(() {
                    questionNumber++;
                  });
                }
                if (questionsWithAnswers.length > questionNumber) {
                  setState(() {
                    scoreKeeper.add(
                      const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  });
                }
                print(totalScore);
              },
              child: const Text(
                "Falso",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: scoreKeeper,
          ),
        )
      ],
    );
  }
}
