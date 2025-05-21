import 'package:flutter/material.dart';
import 'package:qt/models/db_helper.dart';
import 'package:qt/models/user_model.dart';
import 'package:qt/pages/teacher/login_teacher_page.dart';
import 'package:qt/pages/pupil/registration_page.dart';
import 'package:qt/widgets/main_button.dart';
import 'package:qt/widgets/registration_button_widget.dart';
import 'package:qt/widgets/small_button.dart';
import 'package:qt/widgets/text_field.dart';

class RegistrationTeacherPage extends StatefulWidget {
  static const routeName = '/registrationteacher-page';
  const RegistrationTeacherPage({super.key});

  @override
  State<RegistrationTeacherPage> createState() => _RegistrationTeacherPageState();
}

class _RegistrationTeacherPageState extends State<RegistrationTeacherPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final DbHelper _dbHelper = DbHelper();
  
  // Добавляем GlobalKey для формы
  final _formKey = GlobalKey<FormState>();

  _singUp() async {
    // Сначала проверяем валидацию формы
    if (!_formKey.currentState!.validate()) {
      print('Validation failed');
      return;
    }

    String nick = _nicknameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String phone = _phoneController.text;
    String age = _ageController.text;

    UserModel user = UserModel(phone: phone, password: password);
    await _dbHelper.insertUser(user);
    
    Navigator.of(context).pushNamedAndRemoveUntil(
      LoginTeacherPage.routeName,
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 241, 255, 1),
      body: Form(
        key: _formKey, // Подключаем форму
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    'Регистрация',
                    style: TextStyle(
                      color: Color.fromRGBO(69, 86, 186, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Center(
                  child: Text(
                    'Кем вы являетесь?',
                    style: TextStyle(
                      color: Color.fromRGBO(69, 86, 186, 1),
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 20,),
                    RegistrationButtonWidget(
                      buttonName: 'Ученик',
                      onTap: (){
                        Navigator.of(context).pushNamed(RegistrationPage.routeName);
                      },
                      buttonRadiusRight: 0,
                      buttonRadiusLeft: 12,
                      buttonColor1: 255,
                      buttonColor2: 255,
                      buttonColor3: 255,
                      buttonColor4: 1,
                      buttonTextColor1: 69,
                      buttonTextColor2: 86,
                      buttonTextColor3: 186,
                      buttonTextColor4: 1,
                    ),
                    RegistrationButtonWidget(
                      buttonName: 'Учитель',
                      onTap: (){},
                      buttonRadiusRight: 12,
                      buttonRadiusLeft: 0,
                      buttonColor1: 69,
                      buttonColor2: 86,
                      buttonColor3: 186,
                      buttonColor4: 1,
                      buttonTextColor1: 255,
                      buttonTextColor2: 255,
                      buttonTextColor3: 255,
                      buttonTextColor4: 1,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  children: <Widget>[
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(right: 280),
                      child: Text(
                        'ФИО',
                        style: TextStyle(
                          color: Color.fromRGBO(69, 86, 186, 1),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    // Каждое поле теперь имеет валидатор
                    TextFieldWidget(
                      controller: _nicknameController,
                      hintText: 'ФИО',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите ФИО';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(right: 250),
                      child: Text(
                        'Телефон',
                        style: TextStyle(
                          color: Color.fromRGBO(69, 86, 186, 1),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    TextFieldWidget(
                      inputType: TextInputType.phone,
                      controller: _phoneController,
                      hintText: '+7(___)___-__-__',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите телефон';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(right: 270),
                      child: Text(
                        'E-mail',
                        style: TextStyle(
                          color: Color.fromRGBO(69, 86, 186, 1),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    TextFieldWidget(
                      inputType: TextInputType.emailAddress,
                      controller: _emailController,
                      hintText: 'vanovivan@gmail.com',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите email';
                        }
                        if (!validateEmail(value)) {
                          return 'Неверный формат email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(right: 200),
                      child: Text(
                        'Стаж работы',
                        style: TextStyle(
                          color: Color.fromRGBO(69, 86, 186, 1),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    TextFieldWidget(
                      inputType: TextInputType.number,
                      controller: _ageController,
                      hintText: '0 лет',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите стаж';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(right: 250),
                      child: Text(
                        'Пароль',
                        style: TextStyle(
                          color: Color.fromRGBO(69, 86, 186, 1),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    TextFieldWidget(
                      inputType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      hintText: 'Пароль',
                      isObsText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите пароль';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    MainButtonWidget(
                      buttonName: 'ЗАРЕГЕСТРИРОВАТЬСЯ',
                      onTap: _singUp,
                    ),
                    const SizedBox(height: 5),
                    const Center(
                      child: Text(
                        'Вы уже зарегистрированы?',
                        style: TextStyle(
                          color: Color.fromRGBO(69, 86, 186, 1),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Center(
                      child: SmallButtonWidget(
                        buttonName: 'Войти',
                        buttonColor: Colors.transparent,
                        onTap: () {
                          Navigator.of(context).pushNamed(LoginTeacherPage.routeName);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Валидация email
  bool validateEmail(String value) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(value);
  }
}