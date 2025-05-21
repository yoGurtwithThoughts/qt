import 'package:flutter/material.dart';

class InvitationDialog extends StatelessWidget {
  const InvitationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

   return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: const SizedBox(
            width: 400,
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Разрабочик - ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(53, 73, 142, 1),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Косякин Д. А.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(53, 73, 142, 1),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Бета версия приложения - ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(53, 73, 142, 1),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '0.14.15',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(53, 73, 142, 1),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Телеграм - ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(53, 73, 142, 1),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '@kosaykin123',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(53, 73, 142, 1),
                        fontSize: 16,
                      ),
                    ),
                    
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Email - ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(53, 73, 142, 1),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'kosaykin123@gmail.com',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(53, 73, 142, 1),
                        fontSize: 16,
                      ),
                    ),
                    
                  ],
                )
              ],
            ),
          ),
    );
  }}

class TestMessage extends StatelessWidget {
  const TestMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 450,
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    '\tЧтобы начать тестирование,\n необходимо пройти полный курс\t',
                    textAlign: TextAlign.center, // Выравнивание текста по центру
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(53, 73, 142, 1),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
