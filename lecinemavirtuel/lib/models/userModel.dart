class UserModel {
  String? sId;
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  bool? isActivated;
  String? createdAt;
  String? updatedAt;
  String? role;
  Country? country;

  UserModel(
      {this.sId,
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.isActivated,
      this.createdAt,
      this.updatedAt,
      this.role,
      this.country});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    isActivated = json['isActivated'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    role = json['role'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['isActivated'] = this.isActivated;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['role'] = this.role;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    return data;
  }
}

class Country {
  String? sId;
  String? name;
  String? dialCode;
  String? code;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  Country(
      {this.sId,
      this.name,
      this.dialCode,
      this.code,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.id});

  Country.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    dialCode = json['dialCode'];
    code = json['code'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['dialCode'] = this.dialCode;
    data['code'] = this.code;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['id'] = this.id;
    return data;
  }
}
