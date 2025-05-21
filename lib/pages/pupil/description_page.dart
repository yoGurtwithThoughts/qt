import 'package:flutter/material.dart';
import 'package:qt/pages/pupil/choose_page.dart';
import 'package:qt/pages/pupil/testpage.dart';
import 'package:qt/widgets/bell_button_teacher.dart';
import 'package:qt/widgets/small_main_button_widget.dart';
import 'profile_page.dart';

class DescriptionPage extends StatefulWidget {
  static const routeName = '/description-page';
  const DescriptionPage({super.key});

  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, DescriptionPage.routeName);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, ChoosePage.routeName);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, ProfilePage.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Получаем размеры экрана
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Функция для вычисления размера по ширине в %
    double wp(double percent) => screenWidth * percent / 100;
    // Функция для вычисления размера по высоте в %
    double hp(double percent) => screenHeight * percent / 100;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: wp(15)), // было 60px, примерно 15% ширины экрана
          child: Center(
            child: Image.asset('assets/logo.png', height: hp(5)), // примерно 5% высоты
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: BellButtonTeacherWidget(),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(235, 241, 255, 1),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: wp(5), vertical: hp(2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Курс "Программирование с помощью фреймворка Qt"',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(53, 73, 142, 1),
                      fontSize: wp(6), // примерно 6% ширины
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: hp(2)),
                Text(
                  'Qt - кроссплатформенный фреймворк для создания графических приложений для десктопа, мобильных и встроенных устройств.',
                  style: TextStyle(
                    color: const Color.fromRGBO(69, 86, 186, 1),
                    fontSize: wp(4),
                  ),
                ),
                SizedBox(height: hp(3)),
                Text(
                  'Цель курса',
                  style: TextStyle(
                    color: const Color.fromRGBO(53, 73, 142, 1),
                    fontSize: wp(5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: hp(1)),
                Text(
                  'Наша цель - научить вам пользоваться данным фреймворком. За время прохождения курса вы познаете все его тонкости и сделаете свои первые работы для портфолио!',
                  style: TextStyle(
                    color: const Color.fromRGBO(69, 86, 186, 1),
                    fontSize: wp(3.5),
                  ),
                ),
                SizedBox(height: hp(3)),
                Text(
                  'Как начать?',
                  style: TextStyle(
                    color: const Color.fromRGBO(53, 73, 142, 1),
                    fontSize: wp(5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: hp(1)),
                Text(
                  'Чтобы начать прохождение данного курса, вам нужно перейти на вкладку курса, выбрать наставника и в скором времени вам позвонит наставник, чтобы договориться о дате и времени занятия. Ученик и преподаватель самостоятельно договариваются о том, как будут проходить уроки.',
                  style: TextStyle(
                    color: const Color.fromRGBO(69, 86, 186, 1),
                    fontSize: wp(3.5),
                  ),
                ),
                SizedBox(height: hp(2)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: Row(
                      children: [
                        SmallMainButtonWidget(
                          buttonName: 'Перейти к курсу',
                          onTap: () {
                            Navigator.of(context).pushNamed(ChoosePage.routeName);
                          },
                        ),
                        SizedBox(width: 10),
                        SmallMainButtonWidget(
                          buttonName: 'Начать тестирование',
                          onTap: () {
                            Navigator.of(context).pushNamed(QtEntranceTest.routeName);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: hp(10)),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            items: [
              _buildBottomNavigationBarItem(0, 'assets/home.png', 'assets/home_selected.png'),
              _buildBottomNavigationBarItem(1, 'assets/course.png', 'assets/course_selected.png'),
              _buildBottomNavigationBarItem(2, 'assets/profile.png', 'assets/profile_selected.png'),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
          // Квадраты под иконками
          for (int i = 0; i < 3; i++)
            Positioned(
              bottom: hp(2), // 2% высоты от низа
              left: screenWidth / 3 * i + wp(6), // отступ слева в процентах
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 0),
                width: wp(20),
                height: hp(8),
                decoration: BoxDecoration(
                  color: _selectedIndex == i ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () => _onItemTapped(i),
                    child: AnimatedScale(
                      scale: _selectedIndex == i ? 1.3 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: Image.asset(
                        _selectedIndex == i
                            ? (i == 0
                                ? 'assets/home_selected.png'
                                : i == 1
                                    ? 'assets/course_selected.png'
                                    : 'assets/profile_selected.png')
                            : (i == 0
                                ? 'assets/home.png'
                                : i == 1
                                    ? 'assets/course.png'
                                    : 'assets/profile.png'),
                        width: wp(7),
                        height: hp(4),
                        color: _selectedIndex == i ? null : Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      int index, String defaultIcon, String selectedIcon) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        _selectedIndex == index ? selectedIcon : defaultIcon,
        width: 24,
        height: 24,
      ),
      label: '',
    );
  }
}
