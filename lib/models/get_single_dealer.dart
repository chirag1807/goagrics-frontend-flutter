class GetSingleDealer {
  bool? success;
  Data? data;

  GetSingleDealer({this.success, this.data});

  GetSingleDealer.fromJson(Map<String, dynamic> json) {
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
  String? dname;
  String? category;
  int? pincode;
  String? address;
  int? phoneNo;
  List<BidDetails>? bidDetails;
  List<ToolDetails>? toolDetails;
  int? iV;

  Data(
      {this.avatar,
        this.sId,
        this.dname,
        this.category,
        this.pincode,
        this.address,
        this.phoneNo,
        this.bidDetails,
        this.toolDetails,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    avatar =
    json['Avatar'] != null ? new Avatar.fromJson(json['Avatar']) : null;
    sId = json['_id'];
    dname = json['dname'];
    category = json['category'];
    pincode = json['pincode'];
    address = json['address'];
    phoneNo = json['phoneNo'];
    if (json['bidDetails'] != null) {
      bidDetails = <BidDetails>[];
      json['bidDetails'].forEach((v) {
        bidDetails!.add(new BidDetails.fromJson(v));
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
    data['_id'] = this.sId;
    data['dname'] = this.dname;
    data['category'] = this.category;
    data['pincode'] = this.pincode;
    data['address'] = this.address;
    data['phoneNo'] = this.phoneNo;
    if (this.bidDetails != null) {
      data['bidDetails'] = this.bidDetails!.map((v) => v.toJson()).toList();
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

class BidDetails {
  String? farmerId;
  int? bPrice;
  String? sId;

  BidDetails({this.farmerId, this.bPrice, this.sId});

  BidDetails.fromJson(Map<String, dynamic> json) {
    farmerId = json['farmer_Id'];
    bPrice = json['bPrice'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['farmer_Id'] = this.farmerId;
    data['bPrice'] = this.bPrice;
    data['_id'] = this.sId;
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

class TImages {
  String? publicId;
  String? url;
  String? sId;

  TImages({this.publicId, this.url, this.sId});

  TImages.fromJson(Map<String, dynamic> json) {
    publicId = json['public_id'];
    url = json['url'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['public_id'] = this.publicId;
    data['url'] = this.url;
    data['_id'] = this.sId;
    return data;
  }
}