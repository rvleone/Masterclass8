import 'dart:convert';

import 'package:api_rest/src/adapter/user_adapter.dart';
import 'package:http/http.dart';

class UserService {
  final Client client;

  UserService(this.client);

  Future<List> getTodos() async {
    try {
      final response =
          await client.get(Uri.parse('http://127.0.0.1:3031/users'));
      final body = response.body;
      final list = jsonDecode(body) as List;
      return list.map((e) => UserAdapter.fromMap(e)).toList();
    } catch (e) {
      return [];
    }
  }
}
