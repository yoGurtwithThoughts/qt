import 'package:flutter/material.dart';
import 'package:qt/pages/pupil/login_page.dart';
import 'package:qt/pages/teacher/choose_teacher_page.dart';
import 'package:qt/pages/teacher/description_teacher_page.dart';
import 'package:qt/widgets/main_button.dart';

class ProfileTeacherPage extends StatefulWidget {
  static const routeName = '/profileteacher-page';
  const ProfileTeacherPage({super.key});

  @override
  State<ProfileTeacherPage> createState() => _ProfileTeacherPageState();
}

class _ProfileTeacherPageState extends State<ProfileTeacherPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, DescriptionTeacherPage.routeName);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, ChooseTeacherPage.routeName);
        break;
    }
  }

  void _showInvitationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final width = MediaQuery.of(context).size.width;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(
            width: width * 0.8,
            height: 100,
            child: const Center(
              child: Text(
                'Разработано Косякиным Д.',
                style: TextStyle(
                  color: Color.fromRGBO(53, 73, 142, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: width * 0.15),
          child: Center(
            child: Image.asset('assets/logo.png', height: height * 0.05),
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/bellIcon.png', width: width * 0.06, height: width * 0.06),
            onPressed: _showInvitationDialog,
          ),
        ],
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromRGBO(235, 241, 255, 1),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: height * 0.12),
            Center(
              child: Image.asset('assets/teacher.png', width: width * 0.4),
            ),
            SizedBox(height: height * 0.02),
            SizedBox(
              width: width * 0.7,
              child: const Text(
                'Фролов Николай Иванович',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(53, 73, 142, 1),
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Телефон:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(53, 73, 142, 1),
                          fontSize: width * 0.05,
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Text(
                        '8(919)919-91-99',
                        style: TextStyle(
                          color: const Color.fromRGBO(69, 86, 186, 1),
                          fontSize: width * 0.05,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    children: [
                      Text(
                        'Стаж работы:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(53, 73, 142, 1),
                          fontSize: width * 0.05,
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Text(
                        '12 лет',
                        style: TextStyle(
                          color: const Color.fromRGBO(69, 86, 186, 1),
                          fontSize: width * 0.05,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    children: [
                      Text(
                        'E-mail:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(53, 73, 142, 1),
                          fontSize: width * 0.05,
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Text(
                        'nikolay@gmail.com',
                        style: TextStyle(
                          color: const Color.fromRGBO(69, 86, 186, 1),
                          fontSize: width * 0.05,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.05),
            MainButtonWidget(
              buttonName: 'Выйти из аккаунта',
              onTap: () {
                Navigator.of(context).pushNamed(LoginPage.routeName);
              },
            ),
          ],
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
          for (int i = 0; i < 3; i++)
            Positioned(
              bottom: height * 0.018,
              left: width / 3 * i + width * 0.06,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 0),
                width: width * 0.21,
                height: height * 0.09,
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
                        width: width * 0.07,
                        height: width * 0.07,
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

  BottomNavigationBarItem _buildBottomNavigationBarItem(int index, String defaultIcon, String selectedIcon) {
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
