import 'package:abdu_moe_hackathon/models/question.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  List<Question> questions = [
    const Question(
        question: 'How complex is your product?',
        description:
            "For example, if you only display some data, it is simple. If you have some logic, it has medium complexity. If you need charts or complex data it has high complexity",
        firstAnswer: "Very simple",
        secondAnswer: 'Meduim complexity',
        thirdAnswer: 'High complexity',
        selectedAnswer: 0)
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('MVP CALCULATOR'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questions[0].question,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                questions[0].description,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    questions[0].firstAnswer,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    questions[0].secondAnswer,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    questions[0].thirdAnswer,
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
