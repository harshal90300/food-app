class AllPosts {
    String? postId;
    String? calories;
    String? ingredients;
    String? methods;
    String? postImage;
    String? thumbImage;
    List<String>? catId;

    AllPosts({this.postId, this.calories, this.ingredients, this.methods, this.postImage, this.thumbImage, this.catId});

    AllPosts.fromJson(Map<String, dynamic> json) {
        postId = json["post_id"];
        calories = json["calories"];
        ingredients = json["ingredients"];
        methods = json["methods"];
        postImage = json["post_image"];
        thumbImage = json["thumb_image"];
        catId = json["cat_id"] == null ? null : List<String>.from(json["cat_id"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["post_id"] = postId;
        _data["calories"] = calories;
        _data["ingredients"] = ingredients;
        _data["methods"] = methods;
        _data["post_image"] = postImage;
        _data["thumb_image"] = thumbImage;
        if(catId != null) {
            _data["cat_id"] = catId;
        }
        return _data;
    }
}