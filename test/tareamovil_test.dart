import 'package:tareamovil/tareamovil.dart';
import 'package:test/test.dart';

void main() {
  test('User.fromJson creates a User from JSON', () {
    final json = {
      "id": 1,
      "name": "Leanne Graham",
      "username": "Bret",
      "email": "Sincere@april.biz"
    };
    final user = User.fromJson(json);
    expect(user.id, 1);
    expect(user.name, 'Leanne Graham');
    expect(user.username, 'Bret');
    expect(user.email, 'Sincere@april.biz');
  });

  test('filtrarUsuarios filters users with username longer than 6 characters', () {
    final users = [
      User(id: 1, name: 'User1', username: 'Short', email: 'short@example.com'),
      User(id: 2, name: 'User2', username: 'LongerUsername', email: 'long@example.com'),
    ];
    final filtered = filtrarUsuarios(users);
    expect(filtered.length, 1);
    expect(filtered[0].username, 'LongerUsername');
  });

  test('contarUsuariosBiz counts users with email ending in .biz', () {
    final users = [
      User(id: 1, name: 'User1', username: 'User1', email: 'user1@example.biz'),
      User(id: 2, name: 'User2', username: 'User2', email: 'user2@example.com'),
    ];
    final count = contarUsuariosBiz(users);
    expect(count, 1);
  });
}
