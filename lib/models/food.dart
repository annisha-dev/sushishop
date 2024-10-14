class Food {
  String name;
  String price;
  String imagepath;
  String rating;

  Food({
    required this.name,
    required this.price,
    required this.imagepath,
    required this.rating,
  });

  
  String get getName => name;
  String get getPrice => price;
  String get getImagePath => imagepath;
  String get getRating => rating;
}

