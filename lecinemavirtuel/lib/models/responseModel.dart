class ResponseModel {
  dynamic message;
  dynamic status;
  dynamic code;
  dynamic data;

  ResponseModel({this.message, this.status, this.code, this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    try {
      // backend returns errors instead of message in some response i.e signup
      // not neccesary for now, fixed from the backend. commented instead of removing for future occurence

      // if (json.containsKey('errors') || json.containsKey('Errors')) {
      //   print('here $json');
      //   message = json['errors'].toString() ?? json['Errors'].toString();
      //   status = json['status'].toString() ?? json['Status'].toString() ?? '';
      // } else {
      //   message = json['message'] ?? json['Message'];
      //   status = json['status'] ?? json['Status'];
      // }

      status = json['status'] ?? json['Status'];
      code = json['code'] ?? json['Code'];
      data = json['data'] ?? json['Data'];
      message = json['message'] ?? json['Message'];
    } catch (e) {
      print('error $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['code'] = this.code;
    data['data'] = this.data;
    return data;
  }
}

// class ResponseModel {
//   String message;
//   String status;
//   String code;
//   dynamic data;

//   ResponseModel({this.message, this.status, this.code, this.data});

//   ResponseModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     status = json['status'];
//     code = json['code'];
//     data = json['data'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     data['status'] = this.status;
//     data['code'] = this.code;
//     data['data'] = this.data;
//     return data;
//   }
// }
