// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:abdu_moe_hackathon/models/question.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsState.initial());

  selectAnswer(int selectedAnswer) {
    List<Question> questions = List.from(state.questions);

    questions[state.currentQuestionIndex] =
        questions[state.currentQuestionIndex]
            .copyWith(selectedAnswer: selectedAnswer);

    emit(
      state.update(
          questions: questions,
          currentQuestionIndex: state.currentQuestionIndex + 1),
    );
  }

  addAdditionalInfos(String additionalInfos) {
    emit(state.update(additionalInfos: additionalInfos));
  }

  reset() {
    emit(state.update(currentQuestionIndex: 0));
  }
}

class QuestionsState {
  final List<Question> questions;
  final int currentQuestionIndex;
  final String additionalInfos;

  QuestionsState({
    required this.questions,
    required this.currentQuestionIndex,
    required this.additionalInfos,
  });

  factory QuestionsState.initial() => QuestionsState(
        questions: [
          const Question(
            title: 'How complex is your product?',
            description:
                "For example, if you only display some data, it is simple. If you have some logic, it has medium complexity. If you need charts or complex data it has high complexity",
            firstAnswer: "Very simple",
            secondAnswer: 'Meduim complexity',
            thirdAnswer: 'High complexity',
            selectedAnswer: 0,
          ),
          const Question(
            title: 'Do customers need to pay to use your product?',
            description: '',
            firstAnswer: "Yes",
            secondAnswer: 'No',
            thirdAnswer: "I don't know",
            selectedAnswer: 0,
          ),
          const Question(
            title: 'Do users need to login to use your product?',
            description: '',
            firstAnswer: "No",
            secondAnswer: 'Email login',
            thirdAnswer: 'Email/Social/Mobile Login',
            selectedAnswer: 0,
          ),
          const Question(
            title: 'Does your product need to use an external service?',
            description:
                'For example, will your application need to connect to a third party service such as Google Maps or Hubspot?',
            firstAnswer: "Yes",
            secondAnswer: 'No',
            thirdAnswer: "I don't know",
            selectedAnswer: 0,
          )
        ],
        currentQuestionIndex: 0,
        additionalInfos: '',
      );

  QuestionsState update(
          {int? currentQuestionIndex,
          List<Question>? questions,
          String? additionalInfos}) =>
      QuestionsState(
        questions: questions ?? this.questions,
        currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
        additionalInfos: additionalInfos ?? this.additionalInfos,
      );
}
