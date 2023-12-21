import 'package:abdu_moe_hackathon/models/question.dart';
import 'package:abdu_moe_hackathon/services/open_ai_service.dart';

class EstimationService {
  static estimateBasedOnRequirements(List<Question> questions) async {
    OpenAIService.sendMessage('''
Based on these data:
1- Complexity
Simple = 50 hours, Medium = 150 hours , Complex = 300 hours
2- Additional features
Payment = 50 hours
Email Authentication = 30 hours
Social Authentication = 30 hours
Multiple types of users = 30 hours
GPS = 30 hours
Bluetooth = 50 hours
external Services = 100 hours
UI/UX design = 80 hours.

I want to develop a mobile app
it has Medium complexity, it has a payment on it, It has email and social authentication, i want UI/UX design
Estimate the time of this app and give me a cost? (1 hour = 50 euros)
''');
  }
}
