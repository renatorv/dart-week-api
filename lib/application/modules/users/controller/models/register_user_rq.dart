import 'package:aqueduct/aqueduct.dart';

class RegisterUserRq extends Serializable {
  String name;
  String email;
  String password;

  // Convert o objeto para json
  @override
  Map<String, dynamic> asMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  // Convert o json para objeto
  @override
  void readFromMap(Map<String, dynamic> object) {
    name = object['name'] as String;
    email = object['email'] as String;
    password = object['password'] as String;
  }
}
