import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String name;
  final String username;
  final String email;

  User({required this.id, required this.name, required this.username, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
    );
  }
}

Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Error al obtener usuarios');
  }
}

List<User> filtrarUsuarios(List<User> usuarios) {
  return usuarios.where((user) => user.username.length > 6).toList();
}

int contarUsuariosBiz(List<User> usuarios) {
  return usuarios.where((user) => user.email.endsWith('.biz')).length;
}
