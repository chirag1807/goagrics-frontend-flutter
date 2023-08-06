// class GetAllLabors {
//   bool? success;
//   List<Data>? data;
//
//   GetAllLabors({this.success, this.data});
//
//   GetAllLabors.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class GetAllLabors {
  Avatar? avatar;
  String? sId;
  String? lname;
  String? category;
  String? address;
  int? pincode;
  int? phoneNo;
  List<String>? skills;
  int? iV;
  int? wage;

  GetAllLabors(
      {this.avatar,
      this.sId,
      this.lname,
      this.category,
      this.address,
      this.pincode,
      this.phoneNo,
      this.skills,
      this.iV,
      this.wage});

  GetAllLabors.fromJson(Map<String, dynamic> json) {
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
    wage = json['pricePerDay'];
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
    data['pricePerDay'] = this.wage;
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
