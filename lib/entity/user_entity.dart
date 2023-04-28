

class User {
  final int id;
  final String name;
  final String lastname;
  final String login;
  final String password;
  final String phone;

  User({
    required this.id,
    required this.name,
    required this.lastname,
    required this.login,
    required this.password,
    required this.phone
  });
  factory User.fromJson(Map<String, dynamic> json){
    return User(
        id: json['id'] as int,
        name: json['name'] as String,
        lastname: json['lastname'] as String,
        login: json['login'] as String,
        password: json['password'] as String,
        phone: json['phone'] as String,
    );
  }
}