class User {
  int id;
  String name;
  String email;
  String phone;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    });
    
    factory User.fromJson(Map<String,dynamic> json){
      return User(
        id: json["id"] as int,
        name: json["name"] as String,
        phone: json["phone"] as String,
        email: json["email"] as String,
      );
    }
}

class Posts {
  int userId;
  int id;
  String title;
  

  Posts({
    required this.userId,
    required this.id,
    required this.title,
    });
    
    factory Posts.fromJson(Map<String,dynamic> json){
      return Posts(
        userId: json["userId"] as int,
        id: json["id"] as int, 
        title: json["title"] as String,
      );
    }
}