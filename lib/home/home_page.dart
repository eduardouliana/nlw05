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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DevQuiz",
      home: Scaffold(
        appBar: AppBarWidget(),
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
                  children: [
                    QuizCardWidget(),
                    QuizCardWidget(),
                    QuizCardWidget(),
                    QuizCardWidget(),
                  ],
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
