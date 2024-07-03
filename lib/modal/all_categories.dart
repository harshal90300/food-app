class AllCategories {
    String? id;
    String? catName;
    String? catImage;
    String? thumbImage;

    AllCategories({this.id, this.catName, this.catImage, this.thumbImage});

    AllCategories.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        catName = json["cat_name"];
        catImage = json["cat_image"];
        thumbImage = json["thumb_image"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["cat_name"] = catName;
        _data["cat_image"] = catImage;
        _data["thumb_image"] = thumbImage;
        return _data;
    }
}