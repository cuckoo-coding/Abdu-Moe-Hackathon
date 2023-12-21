// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:abdu_moe_hackathon/models/estimation.dart';
import 'package:abdu_moe_hackathon/services/estimation_service.dart';
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

  Future<Estimation?> generatePrompt() async {
    String firstText = '';
    String secondText = '';
    String thirdText = '';
    String fourthText = '';
    String fifthText = '';
    String sixText = '';

    switch (state.questions[0].selectedAnswer) {
      case 0:
        firstText = 'The app is very simple';
        break;
      case 1:
        firstText = 'The app has meduim complexity';
        break;
      case 2:
        firstText = 'The app has complex';
        break;
    }
    secondText =
        state.questions[1].selectedAnswer == 0 ? 'The app has payment' : '';

    switch (state.questions[2].selectedAnswer) {
      case 0:
        thirdText = '';
        break;
      case 1:
        thirdText = 'The app has email authentication';
        break;
      case 2:
        thirdText = 'The app has email & social authentications';
        break;
    }
    fourthText = state.questions[3].selectedAnswer == 0
        ? 'The app has one of these services GPS or QR Scanner or Bluetooth'
        : '';
    fifthText = state.questions[4].selectedAnswer == 0
        ? 'The app uses an external service'
        : '';
    sixText = state.questions[5].selectedAnswer == 0
        ? 'The app has chat functionality'
        : '';

    String prompt =
        'I want to develop a mobile app\n$firstText\n$secondText\n$thirdText\n$fourthText\n$fifthText\n${state.additionalInfos}\n';

    print(prompt);

    final estimation =
        await EstimationService.estimateBasedOnRequirements(prompt);

    return estimation;
  }

  reset() {
    emit(state.update(currentQuestionIndex: 0));
  }
}

class QuestionsState {
  final List<Question> questions;
  final int currentQuestionIndex;
  final String additionalInfos;
  final Estimation? estimation;

  QuestionsState({
    required this.questions,
    required this.currentQuestionIndex,
    required this.additionalInfos,
    this.estimation,
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
            title: 'Does your product have GPS or QR Scanner or Bluetooth?',
            description: '',
            firstAnswer: "Yes",
            secondAnswer: 'No',
            thirdAnswer: "I don't know",
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
          ),
          const Question(
            title: 'Does your product has chat functionality?',
            description: '',
            firstAnswer: "Yes",
            secondAnswer: 'No',
            thirdAnswer: "I don't know",
            selectedAnswer: 0,
          )
        ],
        currentQuestionIndex: 0,
        additionalInfos: '',
      );

  QuestionsState update({
    int? currentQuestionIndex,
    List<Question>? questions,
    String? additionalInfos,
    Estimation? estimation,
  }) =>
      QuestionsState(
        questions: questions ?? this.questions,
        currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
        additionalInfos: additionalInfos ?? this.additionalInfos,
        estimation: estimation ?? this.estimation,
      );
}
