class UserModel {
   int? id;
  String? phone;
  String? password;

  UserModel({this.id, required this.phone, required this.password});

  Map<String, dynamic> toMap() {
    return {'id': id, 'phone': phone, 'password': password};
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      phone: map['phone'],
      password: map['password'],
    );
  }
}

