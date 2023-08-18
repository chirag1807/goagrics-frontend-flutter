import 'package:goagrics/models/get_single_farmer.dart';

class Registration {
  String? message;
  String? accessToken;
  String? refreshToken;
  Data? data;

  Registration({this.message, this.accessToken, this.refreshToken, this.data});

  Registration.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Avatar? avatar;
  String? fname;
  String? category;
  String? address;
  int? pincode;
  int? phoneNo;
  String? sId;
  List<LandDetails>? landDetails;
  List<ToolDetails>? toolDetails;
  int? iV;

  Data(
      {this.avatar,
      this.fname,
      this.category,
      this.address,
      this.pincode,
      this.phoneNo,
      this.sId,
      this.landDetails,
      this.toolDetails,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    avatar =
        json['Avatar'] != null ? new Avatar.fromJson(json['Avatar']) : null;
    fname = json['fname'];
    category = json['category'];
    address = json['address'];
    pincode = json['pincode'];
    phoneNo = json['phoneNo'];
    sId = json['_id'];
    if (json['landDetails'] != null) {
      landDetails = <LandDetails>[];
      json['landDetails'].forEach((v) {
        landDetails!.add(new LandDetails.fromJson(v));
      });
    }
    if (json['toolDetails'] != null) {
      toolDetails = <ToolDetails>[];
      json['toolDetails'].forEach((v) {
        toolDetails!.add(new ToolDetails.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avatar != null) {
      data['Avatar'] = this.avatar!.toJson();
    }
    data['fname'] = this.fname;
    data['category'] = this.category;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['phoneNo'] = this.phoneNo;
    data['_id'] = this.sId;
    if (this.landDetails != null) {
      data['landDetails'] = this.landDetails!.map((v) => v.toJson()).toList();
    }
    if (this.toolDetails != null) {
      data['toolDetails'] = this.toolDetails!.map((v) => v.toJson()).toList();
    }
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

class LandDetails {
  List<LImages>? lImages;
  String? lType;
  int? lPrice;
  String? lArea;
  String? sId;
  List<BidDetails>? bidDetails;

  LandDetails(
      {this.lImages,
      this.lType,
      this.lPrice,
      this.lArea,
      this.sId,
      this.bidDetails});

  LandDetails.fromJson(Map<String, dynamic> json) {
    if (json['l_Images'] != null) {
      lImages = <LImages>[];
      json['l_Images'].forEach((v) {
        lImages!.add(new LImages.fromJson(v));
      });
    }
    lType = json['l_Type'];
    lPrice = json['l_Price'];
    lArea = json['l_Area'];
    sId = json['_id'];
    if (json['bidDetails'] != null) {
      bidDetails = <BidDetails>[];
      json['bidDetails'].forEach((v) {
        bidDetails!.add(new BidDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lImages != null) {
      data['l_Images'] = this.lImages!.map((v) => v.toJson()).toList();
    }
    data['l_Type'] = this.lType;
    data['l_Price'] = this.lPrice;
    data['l_Area'] = this.lArea;
    data['_id'] = this.sId;
    if (this.bidDetails != null) {
      data['bidDetails'] = this.bidDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ToolDetails {
  List<TImages>? tImages;
  int? tPrice;
  String? sId;

  ToolDetails({this.tImages, this.tPrice, this.sId});

  ToolDetails.fromJson(Map<String, dynamic> json) {
    if (json['t_Images'] != null) {
      tImages = <TImages>[];
      json['t_Images'].forEach((v) {
        tImages!.add(new TImages.fromJson(v));
      });
    }
    tPrice = json['t_Price'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tImages != null) {
      data['t_Images'] = this.tImages!.map((v) => v.toJson()).toList();
    }
    data['t_Price'] = this.tPrice;
    data['_id'] = this.sId;
    return data;
  }
}
