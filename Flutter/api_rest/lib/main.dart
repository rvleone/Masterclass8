import 'package:api_rest/src/service/user_service.dart';

void main(List<String> args) async {}

class UserController {
  final UserService service;

  UserController({
    required this.service,
  });

  Future<void> getTodos() async {
    final list = service.getTodos();
    print(list);
  }
}
