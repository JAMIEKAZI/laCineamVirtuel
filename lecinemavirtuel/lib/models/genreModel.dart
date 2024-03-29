class GenreModel {
  List<Data>? data;

  GenreModel({this.data});

  GenreModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? imageUrl;
  bool? isDeleted;
  String? sId;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  Data(
      {this.imageUrl,
      this.isDeleted,
      this.sId,
      this.name,
      this.slug,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['id'] = this.id;
    return data;
  }
}
