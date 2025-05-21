import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qt/models/db_helper.dart';
import 'package:qt/pages/pupil/description_page.dart';
import 'package:qt/pages/pupil/registration_page.dart';
import 'package:qt/widgets/main_button.dart';
import 'package:qt/widgets/small_button.dart';
import 'package:qt/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login-page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); 
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DbHelper _dbHelper = DbHelper();

  _userLogin() async {
    if (!_formKey.currentState!.validate()) return;

    String password = _passwordController.text;
    String email = _emailController.text;

    bool isAuthenticated = await _dbHelper.isUserAuthenticated(email, password);
    if (isAuthenticated) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed(DescriptionPage.routeName);
    } else {
      if (kDebugMode) {
        print('Login failed');
      }
      // Можно добавить Snackbar или диалог ошибки здесь
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Неверный телефон или пароль')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 241, 255, 1),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: screenHeight * 0.15),
                Center(
                  child: Text(
                    'Вход',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(69, 86, 186, 1),
                      fontSize: screenWidth * 0.09, // адаптивный размер шрифта
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.02),
                  child: Text(
                    'Телефон',
                    style: TextStyle(
                      color: const Color.fromRGBO(69, 86, 186, 1),
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                ),
                TextFieldWidget(
                  inputType: TextInputType.number,
                  controller: _emailController,
                  hintText: '+7(___)___-__-__',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите телефон';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.02),
                  child: Text(
                    'Пароль',
                    style: TextStyle(
                      color: const Color.fromRGBO(69, 86, 186, 1),
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                ),
                TextFieldWidget(
                  isObsText: true,
                  inputType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  hintText: 'Пароль',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите пароль';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.03),
                Center(
                  child: SizedBox(
                    width: screenWidth * 0.7,
                    child: MainButtonWidget(
                      buttonName: 'Войти',
                      onTap: _userLogin,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Center(
                  child: Text(
                    'Ещё нет аккаунта?',
                    style: TextStyle(
                      color: const Color.fromRGBO(69, 86, 186, 1),
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                ),
                Center(
                  child: SmallButtonWidget(
                    buttonName: 'Зарегистрироваться',
                    buttonColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).pushNamed(RegistrationPage.routeName);
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
