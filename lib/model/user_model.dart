class UserModel{
  String? userId;
  String? name;
  String? email;
  String? image;


  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.image
  });

  UserModel.fromJson(json){
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
  }
  toJson(){
    return {
      'user_id': userId,
      'name': name,
      'email': email,
      'image': image
    };
  }
}