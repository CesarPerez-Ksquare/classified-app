class PictureModel {
  String? imgURL;

  PictureModel({this.imgURL});

  PictureModel.fromJson(Map<String, dynamic> json) {
    imgURL = json['imgURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imgURL'] = imgURL;
    return data;
  }
}
