import 'package:abdu_moe_hackathon/blocs/questions_cubit.dart';
import 'package:abdu_moe_hackathon/models/question.dart';
import 'package:abdu_moe_hackathon/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final questionsCubit = context.read<QuestionsCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('MVP CALCULATOR'),
      ),
      body: BlocConsumer<QuestionsCubit, QuestionsState>(
        listener: (context, state) {
          if (state.currentQuestionIndex >= state.questions.length) {
            questionsCubit.reset();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
            child: Center(
              child: QuestionSection(
                  question: state.questions[state.currentQuestionIndex]),
            ),
          );
        },
      ),
    );
  }
}

class QuestionSection extends StatelessWidget {
  const QuestionSection({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        if (question.description.isNotEmpty) ...[
          const SizedBox(
            height: 20,
          ),
          Text(
            question.description,
            style: const TextStyle(fontSize: 24),
          ),
        ],
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            FilledButton(
              onPressed: () {
                questionsCubit.selectAnswer(0);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  question.firstAnswer,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            FilledButton(
              onPressed: () {
                questionsCubit.selectAnswer(1);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  question.secondAnswer,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            FilledButton(
              onPressed: () {
                questionsCubit.selectAnswer(2);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  question.thirdAnswer,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
