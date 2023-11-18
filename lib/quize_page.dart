import 'package:flutter/material.dart';

class QuizePage extends StatefulWidget {
  const QuizePage({super.key});

  @override
  State<QuizePage> createState() => _QuizePageState();
}

class _QuizePageState extends State<QuizePage> {
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.'
  ];
  List<bool> answers = [false, true, true];
  List<Icon> userAnswers = [];
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  counter > questions.length - 1 ? 'end' : questions[counter],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: () => checkAnswer(true),
              child: Container(
                margin: const EdgeInsets.all(15),
                height: size.height * 0.08,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'True',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            InkWell(
              onTap: () => checkAnswer(false),
              child: Container(
                margin: const EdgeInsets.all(15),
                height: size.height * 0.08,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'False',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              children: userAnswers,
            )
          ],
        ),
      ),
    );
  }

  checkAnswer(bool bool) {
    if (counter > questions.length - 1) {
    } else {
      answers[counter] == bool
          ? setState(() {
              counter = counter + 1;
              userAnswers.add(const Icon(
                Icons.check,
                color: Colors.green,
              ));
            })
          : setState(() {
              counter = counter + 1;
              userAnswers.add(const Icon(
                Icons.close,
                color: Colors.red,
              ));
            });
    }
  }
}
