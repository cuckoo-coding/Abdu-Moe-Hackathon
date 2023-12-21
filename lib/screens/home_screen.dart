import 'package:abdu_moe_hackathon/screens/questions_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              const Text(
                "How much to build your MVP (minimum viable product)?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Do you have an amazing idea for an app or software but don’t know where to start? Would you like to find out how much it would cost to build a prototype?",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "We have created this handy cost calculator just for you. Find out how much your prototype will cost in just 2 mins.",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const QuestionsScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text('GET STARTED'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
