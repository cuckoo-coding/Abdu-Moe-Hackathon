import 'package:abdu_moe_hackathon/models/estimation.dart';
import 'package:abdu_moe_hackathon/services/open_ai_service.dart';
import 'package:flutter/foundation.dart';

class EstimationService {
  static Future<Estimation?> estimateBasedOnRequirements(String prompt) async {
    final response = await OpenAIService.sendMessage('''
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
UI/UX design = 80 hours
Chat functionality = 80 hours
Animations = 60 hours
if there are more features estimate them based on my calculations and maximum is 100 hours/feature


1 hour costs 50 euros

$prompt

Use the provided data above to estimate the time of this app and give me a cost? (1 hour = 50 euros)

Please return only the total hours in json format
''');

    Estimation? estimation;
    if (response != null) {
      try {
        final totalHours = double.tryParse(response
            .split('}')
            .first
            .split(':')
            .last
            .trim()) ??
            340;
        estimation = Estimation(
            weeks: (totalHours / 40).ceil(),
            price: (totalHours * 40).ceil(),
            description: prompt);
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    return estimation;
  }
}
