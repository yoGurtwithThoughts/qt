import 'package:flutter/material.dart';
import 'package:qt/pages/pupil/choose_page.dart';
import 'package:qt/pages/pupil/description_page.dart';
import 'package:qt/pages/pupil/login_page.dart';
import 'package:qt/widgets/main_button.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile-page';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    if (index == _selectedIndex)
      return; // Не делаем ничего, если нажата текущая иконка

    setState(() {
      _selectedIndex = index;
    });

    // Навигация к соответствующим страницам
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, DescriptionPage.routeName);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, ChoosePage.routeName);
        break;
    }
  }

  void _showInvitationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Center(
            child: Image.asset('assets/logo.png', height: 40),
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/bellIcon.png', width: 24, height: 24),
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
            const SizedBox(height: 170),
            Center(
              child: Image.asset('assets/pupil.png'),
            ),
            const SizedBox(height: 10),
            const Center(
              child: SizedBox(
                width: 300,
                child: Text(
                  'Петрова Ангелина Максимовна',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(53, 73, 142, 1),
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Row(
              children: [
                SizedBox(width: 70),
                Text(
                  'Телефон:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(53, 73, 142, 1),
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '8(923)456-78-91',
                  style: TextStyle(
                    color: Color.fromRGBO(69, 86, 186, 1),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                SizedBox(width: 120),
                Text(
                  'Возраст:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(53, 73, 142, 1),
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '16 лет',
                  style: TextStyle(
                    color: Color.fromRGBO(69, 86, 186, 1),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                SizedBox(width: 60),
                Text(
                  'E-mail:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(53, 73, 142, 1),
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'angelinka@gmail.com',
                  style: TextStyle(
                    color: Color.fromRGBO(69, 86, 186, 1),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
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
              _buildBottomNavigationBarItem(
                  0, 'assets/home.png', 'assets/home_selected.png'),
              _buildBottomNavigationBarItem(
                  1, 'assets/course.png', 'assets/course_selected.png'),
              _buildBottomNavigationBarItem(
                  2, 'assets/profile.png', 'assets/profile_selected.png'),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
          // Квадрат под каждой иконкой
          for (int i = 0; i < 3; i++)
            Positioned(
              bottom: 15,
              left: MediaQuery.of(context).size.width / 3 * i + 24,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 0),
                width: 80,
                height: 70,
                decoration: BoxDecoration(
                  color:
                      _selectedIndex == i ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  height: 100,
                  child: Center(
                    child: GestureDetector(
                      onTap: () => _onItemTapped(i),
                      child: AnimatedScale(
                        scale: _selectedIndex == i ? 1.3 : 1.0,
                        duration: const Duration(milliseconds: 200),
                        child: Image.asset(
                          _selectedIndex == i
                              ? '${i == 0 ? 'assets/home_selected.png' : i == 1 ? 'assets/course_selected.png' : 'assets/profile_selected.png'}'
                              : '${i == 0 ? 'assets/home.png' : i == 1 ? 'assets/course.png' : 'assets/profile.png'}',
                          width: 30,
                          height: 30,
                          color: _selectedIndex == i
                              ? null
                              : Colors
                                  .transparent, // Скрываем неактивные иконки
                        ),
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
      label: '', // Убираем текст
    );
  }
}
