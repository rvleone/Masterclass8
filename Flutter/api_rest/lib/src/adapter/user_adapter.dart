import '../model/user_model.dart';

class UserAdapter {
  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  static Map toMap(UserModel user) {
    return <String, dynamic>{
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'password': user.password,
    };
  }
}
