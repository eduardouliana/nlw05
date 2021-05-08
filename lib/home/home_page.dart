import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/home/home_controller.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state != HomeState.success) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DevQuiz",
      home: Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: "Fácil",
                  ),
                  LevelButtonWidget(
                    label: "Médio",
                  ),
                  LevelButtonWidget(
                    label: "Difícil",
                  ),
                  LevelButtonWidget(
                    label: "Perito",
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.count(
                  // Itens por linha
                  crossAxisCount: 2,
                  // Espacamento entre itens na linha
                  crossAxisSpacing: 16,
                  // // Espacamento entre itens na coluna
                  mainAxisSpacing: 16,
                  children: controller.quizzes!
                      .map((e) => QuizCardWidget(
                            title: e.title,
                            percent: (e.questionAnswered / e.questions.length),
                            completed:
                                "${e.questionAnswered}/${e.questions.length}",
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    /*return Scaffold(
      appBar: AppBarWidget(),
      body: LevelButtonWidget(
        label: "Fácil",
      ),
    );*/
  }
}
//57 min
//https://nextlevelweek.com/episodios/flutter/1/edicao/5
