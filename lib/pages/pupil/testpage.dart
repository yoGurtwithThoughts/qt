import 'package:flutter/material.dart';
import 'package:qt/widgets/small_main_button_widget.dart';
import 'package:qt/widgets/text_field.dart'; 

class QtEntranceTest extends StatefulWidget {
  static const routeName = '/test-page';
  const QtEntranceTest({super.key});

  @override
  State<QtEntranceTest> createState() => _QtEntranceTestState();
}

class _QtEntranceTestState extends State<QtEntranceTest> {
  // Переменные для хранения выбранных ответов
  String? _answer1;
  String? _answer2;
  String? _answer3;
  String? _answer4;
  String? _answer5;

  // Результат теста
  int _score = 0;

  // Проверка ответов
  void _checkAnswers() {
    setState(() {
      _score = 0;
      if (_answer1 == "кроссплатформенный") _score++;
      if (_answer2 == "Qt Creator") _score++;
      if (_answer3 == "qmake") _score++;
      if (_answer4 == "C++") _score++;
      if (_answer5 == "GUI") _score++;
    });

    // Показать результат через диалоговое окно
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Результат"),
        content: Text("Вы правильно ответили на $_score из 5 вопросов.",
         style: TextStyle(
                    color: Color.fromRGBO(69, 86, 186, 1),
                    fontSize: 16,
                  ),),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Входной тест по Qt"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Вопрос 1
            const Text("1. Какой фреймворк Qt?",
             style: TextStyle(
                    color: Color.fromRGBO(69, 86, 186, 1),
                    fontSize: 16,
                  ),),
            RadioListTile<String>(
              title: const Text("Кроссплатформенный"),
              value: "кроссплатформенный",
              groupValue: _answer1,
              onChanged: (value) {
                setState(() {
                  _answer1 = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Одноплатформенный"),
              value: "одноплатформенный",
              groupValue: _answer1,
              onChanged: (value) {
                setState(() {
                  _answer1 = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Вопрос 2
            const Text("2. Как называется среда разработки для Qt?",
             style: TextStyle(
                    color: Color.fromRGBO(69, 86, 186, 1),
                    fontSize: 16,
                  ),),
            RadioListTile<String>(
              title: const Text("Qt Creator"),
              value: "Qt Creator",
              groupValue: _answer2,
              onChanged: (value) {
                setState(() {
                  _answer2 = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Visual Studio"),
              value: "Visual Studio",
              groupValue: _answer2,
              onChanged: (value) {
                setState(() {
                  _answer2 = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Вопрос 3
            const Text("3. Какой инструмент используется для сборки проектов в Qt?",
             style: TextStyle(
                    color: Color.fromRGBO(69, 86, 186, 1),
                    fontSize: 16,
                  ),),
            RadioListTile<String>(
              title: const Text("qmake"),
              value: "qmake",
              groupValue: _answer3,
              onChanged: (value) {
                setState(() {
                  _answer3 = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("CMake"),
              value: "CMake",
              groupValue: _answer3,
              onChanged: (value) {
                setState(() {
                  _answer3 = value;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text("4. На каком языке программирования основан Qt?",
             style: TextStyle(
                    color: Color.fromRGBO(69, 86, 186, 1),
                    fontSize: 16,
                  ),),
            RadioListTile<String>(
              title: const Text("C++"),
              value: "C++",
              groupValue: _answer4,
              onChanged: (value) {
                setState(() {
                  _answer4 = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Python"),
              value: "Python",
              groupValue: _answer4,
              onChanged: (value) {
                setState(() {
                  _answer4 = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Вопрос 5
            const Text("5. Какой интерфейс предоставляет Qt?",
             style: TextStyle(
                    color: Color.fromRGBO(69, 86, 186, 1),
                    fontSize: 16,
                  ),),
            RadioListTile<String>(
              title: const Text("GUI"),
              value: "GUI",
              groupValue: _answer5,
              onChanged: (value) {
                setState(() {
                  _answer5 = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("CLI"),
              value: "CLI",
              groupValue: _answer5,
              onChanged: (value) {
                setState(() {
                  _answer5 = value;
                });
              },
            ),
            const SizedBox(height: 32),
            Center(
              child: SmallMainButtonWidget(
                buttonName: "Проверить",
                onTap: _checkAnswers,
              ),
            ),
          ],
        ),
      ),
    );
  }
}