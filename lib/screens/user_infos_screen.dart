import 'package:abdu_moe_hackathon/blocs/questions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfosScreen extends StatefulWidget {
  const UserInfosScreen({super.key});

  @override
  State<UserInfosScreen> createState() => _UserInfosScreenState();
}

class _UserInfosScreenState extends State<UserInfosScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final questionsCubit = context.read<QuestionsCubit>();
    TextEditingController controller = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('MVP CALCULATOR'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Do you have additional details?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller,
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButton(
                onPressed: () {
                  questionsCubit.addAdditionalInfos(controller.text);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text('ESTIMATE'),
                ),
              ),
            ],
          ),
        ));
  }
}
