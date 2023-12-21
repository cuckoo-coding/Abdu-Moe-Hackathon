import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class OpenAIService {
  static sendMessage(String content) async {
    final openAI = OpenAI.instance.build(
        token: const String.fromEnvironment('open_ai_token'),
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
        enableLog: true);

    final request = ChatCompleteText(
      messages: [Messages(role: Role.user, content: content)],
      model: GptTurbo0301ChatModel(),
    );

    final response = await openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      print("data -> ${element.message?.content}");
    }
  }
}
