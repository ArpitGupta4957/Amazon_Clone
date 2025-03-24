import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String type;
  final String address;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.type,
    required this.address,
    required this.password,
  });

  Map<String,dynamic> toMap(){
    return{
      'id':id,
      'name':name,
      "password":password,
      "address":address,
      "type":type,
      "email":email,
      "token":token,
    };
  }
  factory User.fromMap(Map<String,dynamic> map){
    return User(
      id: map['_id']??"",
      type: map['type']??"",
      token: map['token']??"",
      address: map['address']??"",
      password: map['password']??"",
      name: map['name']??"", email: map['email']??"",
    );
  }
  String toJson()=>json.encode(toMap());
  factory User.fromJson(String source)=>User.fromMap(json.decode(source));
}
