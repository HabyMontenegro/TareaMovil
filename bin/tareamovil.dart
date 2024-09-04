import 'package:tareamovil/tareamovil.dart' as tareamovil;

void main(List<String> arguments) async {
  try {
    List<tareamovil.User> usuarios = await tareamovil.fetchUsers();

    // Filtrar usuarios por nombre de usuario con más de 6 caracteres
    List<tareamovil.User> usuariosFiltrados = tareamovil.filtrarUsuarios(usuarios);
    print('Usuarios con username de más de 6 caracteres:');
    usuariosFiltrados.forEach((user) => print(user.username));

    // Contar usuarios con email que termina en .biz
    int usuariosBiz = tareamovil.contarUsuariosBiz(usuarios);
    print('Cantidad de usuarios con email en el dominio .biz: $usuariosBiz');
  } catch (e) {
    print('Error: $e');
  }
}
