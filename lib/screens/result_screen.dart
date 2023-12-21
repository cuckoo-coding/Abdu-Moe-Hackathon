import 'package:abdu_moe_hackathon/models/estimation.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  final Estimation estimation;
  const ResultsScreen({super.key, required this.estimation});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('RESULT'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nice! Based on your requirements:",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.estimation.description,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Here's your estimation!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Duration: ${widget.estimation.weeks} weeks, Budget: ${widget.estimation.price} Euros",
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text('Go to Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
