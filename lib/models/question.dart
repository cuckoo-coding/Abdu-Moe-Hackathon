// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Question {
  final String title;
  final String description;
  final String firstAnswer;
  final String secondAnswer;
  final String thirdAnswer;
  final int selectedAnswer;

  const Question({
    required this.title,
    required this.description,
    required this.firstAnswer,
    required this.secondAnswer,
    required this.thirdAnswer,
    required this.selectedAnswer,
  });

  Question copyWith({
    String? title,
    String? description,
    String? firstAnswer,
    String? secondAnswer,
    String? thirdAnswer,
    int? selectedAnswer,
  }) {
    return Question(
      title: title ?? this.title,
      description: description ?? this.description,
      firstAnswer: firstAnswer ?? this.firstAnswer,
      secondAnswer: secondAnswer ?? this.secondAnswer,
      thirdAnswer: thirdAnswer ?? this.thirdAnswer,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'firstAnswer': firstAnswer,
      'secondAnswer': secondAnswer,
      'thirdAnswer': thirdAnswer,
      'selectedAnswer': selectedAnswer,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      title: map['title'] as String,
      description: map['description'] as String,
      firstAnswer: map['firstAnswer'] as String,
      secondAnswer: map['secondAnswer'] as String,
      thirdAnswer: map['thirdAnswer'] as String,
      selectedAnswer: map['selectedAnswer'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Question(title: $title, description: $description, firstAnswer: $firstAnswer, secondAnswer: $secondAnswer, thirdAnswer: $thirdAnswer, selectedAnswer: $selectedAnswer)';
  }

  @override
  bool operator ==(covariant Question other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.firstAnswer == firstAnswer &&
        other.secondAnswer == secondAnswer &&
        other.thirdAnswer == thirdAnswer &&
        other.selectedAnswer == selectedAnswer;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        firstAnswer.hashCode ^
        secondAnswer.hashCode ^
        thirdAnswer.hashCode ^
        selectedAnswer.hashCode;
  }
}
