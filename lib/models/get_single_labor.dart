class GetSingleLabor {
  bool? success;
  Data? data;

  GetSingleLabor({this.success, this.data});

  GetSingleLabor.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Avatar? avatar;
  String? sId;
  String? lname;
  String? category;
  String? address;
  int? pincode;
  int? phoneNo;
  List<String>? skills;
  int? iV;

  Data(
      {this.avatar,
        this.sId,
        this.lname,
        this.category,
        this.address,
        this.pincode,
        this.phoneNo,
        this.skills,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    avatar =
    json['Avatar'] != null ? new Avatar.fromJson(json['Avatar']) : null;
    sId = json['_id'];
    lname = json['lname'];
    category = json['category'];
    address = json['address'];
    pincode = json['pincode'];
    phoneNo = json['phoneNo'];
    skills = json['skills'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avatar != null) {
      data['Avatar'] = this.avatar!.toJson();
    }
    data['_id'] = this.sId;
    data['lname'] = this.lname;
    data['category'] = this.category;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['phoneNo'] = this.phoneNo;
    data['skills'] = this.skills;
    data['__v'] = this.iV;
    return data;
  }
}

class Avatar {
  String? publicId;
  String? url;

  Avatar({this.publicId, this.url});

  Avatar.fromJson(Map<String, dynamic> json) {
    publicId = json['public_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['public_id'] = this.publicId;
    data['url'] = this.url;
    return data;
  }
}

// "message": "Labour registration done successfully",
// "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0Y2M4Y2EyMzcwNjY2ZjFiOTIyNjQ1NyIsImlhdCI6MTY5MTEyNjk0NiwiZXhwIjoxNjkxMjEzMzQ2fQ.-vFutn8LHSIGKXXLbd28W2FohmXmdHR37DHiLPdYwL4",
// "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0Y2M4Y2EyMzcwNjY2ZjFiOTIyNjQ1NyIsImlhdCI6MTY5MTEyNjk0NiwiZXhwIjoxNzIyNjg0NTQ2fQ.ZPmBaPP7go0fCgTa0kqiugp6SjkTZIFJOZnq_arEqnQ"