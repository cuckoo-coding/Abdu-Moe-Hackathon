import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class OpenAIService {
  static Future<String?> sendMessage(String content) async {
    final openAI = OpenAI.instance.build(
        token: const String.fromEnvironment('open_ai_token'),
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
        enableLog: true);

    final request = ChatCompleteText(messages: [
      Messages(role: Role.user, content: content),
    ], maxToken: 200, model: GptTurbo0301ChatModel());

    final response = await openAI.onChatCompletion(request: request);

    String? messageContent;

    if (response?.choices.isNotEmpty ?? false) {
      messageContent = response?.choices.first.message?.content;
    }
    return messageContent;
  }
}
