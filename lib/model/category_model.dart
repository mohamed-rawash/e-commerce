class CategoryModel{
  String? name;
  String? image;

  CategoryModel({
    required this.name,
    required this.image,
  });

  CategoryModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    image = json['image'];
  }

  toJson(){
    return {
      'name': name,
      'image': image,
    };
  }
}