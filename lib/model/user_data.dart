class User {
  final int id;
  final String firstName;
  final String username;
  final String email;

  // Constructor
  User(this.id, this.firstName, this.username, this.email);

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      firstName = json['firstName'],
      username = json['username'],
      email = json['email'];

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': firstName, 'username': username, 'email': email};
  }
}
