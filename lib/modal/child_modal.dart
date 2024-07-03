
class Food1 {
    String? id;
    String? catName;
    String? catImg;
    String? thumbImage;

    Food1({this.id, this.catName, this.catImg, this.thumbImage});

    Food1.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        catName = json["cat_name"];
        catImg = json["cat_img"];
        thumbImage = json["thumb_image"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["cat_name"] = catName;
        _data["cat_img"] = catImg;
        _data["thumb_image"] = thumbImage;
        return _data;
    }
        static List <Food1> getImage(List image){
      return image.map((e) => Food1.fromJson(e)).toList();
    }

}