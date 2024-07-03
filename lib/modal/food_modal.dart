
class Foodimage {
    String? id;
    String? calories;
    String? ingredients;
    String? methods;
    String? images;
    String? thumbImage;

    Foodimage({this.id, this.calories, this.ingredients, this.methods, this.images, this.thumbImage});

    Foodimage.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        calories = json["calories"];
        ingredients = json["ingredients"];
        methods = json["methods"];
        images = json["images"];
        thumbImage = json["thumb_image"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["calories"] = calories;
        _data["ingredients"] = ingredients;
        _data["methods"] = methods;
        _data["images"] = images;
        _data["thumb_image"] = thumbImage;
        return _data;
    }
    static List <Foodimage> getImage(List image){
      return image.map((e) => Foodimage.fromJson(e)).toList();
    }
}