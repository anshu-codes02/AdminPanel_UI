class Admin{
 
  String? ids;
  String? name;
  String? email;
  String? password;
  String? token;

  Admin({
    this.ids,
    this.name,
    this.email,
    this.password,
    this.token,
  });

  factory Admin.fromJson(Map<String,dynamic> json){
    return Admin(
      ids: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      token: json['token'],

    );
  }

  Map<String,dynamic> toJson(){
    return{
      "id": ids,
      "name": name,
      "email": email,
      "password": password,
      "token": token,
    };
  }
}