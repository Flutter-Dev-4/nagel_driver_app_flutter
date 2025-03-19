class GetMyOrdersModel {
  List<MyOrdersList>? orders;

  GetMyOrdersModel({this.orders});

  GetMyOrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <MyOrdersList>[];
      json['orders'].forEach((v) {
        orders!.add(new MyOrdersList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyOrdersList {
  int? id;
  String? fromAddress;
  String? toAddress;
  String? status;
  String? arrivalDate;
  String? arrivalTime;
  Assignment? assignment;

  MyOrdersList(
      {this.id,
        this.fromAddress,
        this.toAddress,
        this.status,
        this.arrivalDate,
        this.arrivalTime,
        this.assignment});

  MyOrdersList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fromAddress = json['from_address'];
    toAddress = json['to_address'];
    status = json['status'];
    arrivalDate = json['arrival_date'];
    arrivalTime = json['arrival_time'];
    assignment = json['Assignment'] != null
        ? new Assignment.fromJson(json['Assignment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from_address'] = this.fromAddress;
    data['to_address'] = this.toAddress;
    data['status'] = this.status;
    data['arrival_date'] = this.arrivalDate;
    data['arrival_time'] = this.arrivalTime;
    if (this.assignment != null) {
      data['Assignment'] = this.assignment!.toJson();
    }
    return data;
  }
}

class Assignment {
  int? id;
  int? orderId;
  int? companyId;
  int? driverId;
  int? vehicleId;
  String? status;
  StartLocationCoordinates? startLocationCoordinates;
  StartLocationCoordinates? arrivedLocationCoordinates;
  String? createdAt;
  String? updatedAt;
  Driver? driver;
  Vehicle? vehicle;

  Assignment(
      {this.id,
        this.orderId,
        this.companyId,
        this.driverId,
        this.vehicleId,
        this.status,
        this.startLocationCoordinates,
        this.arrivedLocationCoordinates,
        this.createdAt,
        this.updatedAt,
        this.driver,
        this.vehicle});

  Assignment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['orderId'];
    companyId = json['companyId'];
    driverId = json['driverId'];
    vehicleId = json['vehicleId'];
    status = json['status'];
    startLocationCoordinates = json['startLocationCoordinates'] != null
        ? new StartLocationCoordinates.fromJson(
        json['startLocationCoordinates'])
        : null;
    arrivedLocationCoordinates = json['arrivedLocationCoordinates'] != null
        ? new StartLocationCoordinates.fromJson(
        json['arrivedLocationCoordinates'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    driver =
    json['driver'] != null ? new Driver.fromJson(json['driver']) : null;
    vehicle =
    json['Vehicle'] != null ? new Vehicle.fromJson(json['Vehicle']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderId'] = this.orderId;
    data['companyId'] = this.companyId;
    data['driverId'] = this.driverId;
    data['vehicleId'] = this.vehicleId;
    data['status'] = this.status;
    if (this.startLocationCoordinates != null) {
      data['startLocationCoordinates'] =
          this.startLocationCoordinates!.toJson();
    }
    if (this.arrivedLocationCoordinates != null) {
      data['arrivedLocationCoordinates'] =
          this.arrivedLocationCoordinates!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.driver != null) {
      data['driver'] = this.driver!.toJson();
    }
    if (this.vehicle != null) {
      data['Vehicle'] = this.vehicle!.toJson();
    }
    return data;
  }
}

class StartLocationCoordinates {
  String? type;
  List<double>? coordinates;

  StartLocationCoordinates({this.type, this.coordinates});

  StartLocationCoordinates.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Driver {
  int? id;
  String? firstName;
  String? lastName;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? profilePic;
  String? role;
  String? dob;
  int? age;
  String? gender;
  String? bio;
  String? accountStatus;
  dynamic deactivatedDate;
  String? country;
  String? city;
  dynamic latitude;
  dynamic longitude;
  dynamic area;
  String? address;
  dynamic resetToken;
  dynamic otp;
  dynamic fotgototp;
  dynamic otpGeneratedTime;
  dynamic otpExpirationTime;
  dynamic fotgototpGeneratedTime;
  dynamic fotgototpExpirationTime;
  dynamic mobileTokens;
  dynamic licenseExpiry;
  dynamic licenseNo;
  int? companyId;
  String? idetityNumber;
  String? dateOfBirthHijri;
  String? dateOfBirthGregorian;
  bool? isRegistered;
  bool? isDeleteRequest;
  String? createdAt;
  String? updatedAt;

  Driver(
      {this.id,
        this.firstName,
        this.lastName,
        this.name,
        this.email,
        this.password,
        this.phone,
        this.profilePic,
        this.role,
        this.dob,
        this.age,
        this.gender,
        this.bio,
        this.accountStatus,
        this.deactivatedDate,
        this.country,
        this.city,
        this.latitude,
        this.longitude,
        this.area,
        this.address,
        this.resetToken,
        this.otp,
        this.fotgototp,
        this.otpGeneratedTime,
        this.otpExpirationTime,
        this.fotgototpGeneratedTime,
        this.fotgototpExpirationTime,
        this.mobileTokens,
        this.licenseExpiry,
        this.licenseNo,
        this.companyId,
        this.idetityNumber,
        this.dateOfBirthHijri,
        this.dateOfBirthGregorian,
        this.isRegistered,
        this.isDeleteRequest,
        this.createdAt,
        this.updatedAt});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    profilePic = json['profilePic'];
    role = json['role'];
    dob = json['dob'];
    age = json['age'];
    gender = json['gender'];
    bio = json['bio'];
    accountStatus = json['accountStatus'];
    deactivatedDate = json['deactivatedDate'];
    country = json['country'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    area = json['area'];
    address = json['address'];
    resetToken = json['resetToken'];
    otp = json['otp'];
    fotgototp = json['fotgototp'];
    otpGeneratedTime = json['otpGeneratedTime'];
    otpExpirationTime = json['otpExpirationTime'];
    fotgototpGeneratedTime = json['fotgototpGeneratedTime'];
    fotgototpExpirationTime = json['fotgototpExpirationTime'];
    mobileTokens = json['mobileTokens'];
    licenseExpiry = json['licenseExpiry'];
    licenseNo = json['licenseNo'];
    companyId = json['companyId'];
    idetityNumber = json['idetityNumber'];
    dateOfBirthHijri = json['dateOfBirthHijri'];
    dateOfBirthGregorian = json['dateOfBirthGregorian'];
    isRegistered = json['isRegistered'];
    isDeleteRequest = json['isDeleteRequest'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['profilePic'] = this.profilePic;
    data['role'] = this.role;
    data['dob'] = this.dob;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['bio'] = this.bio;
    data['accountStatus'] = this.accountStatus;
    data['deactivatedDate'] = this.deactivatedDate;
    data['country'] = this.country;
    data['city'] = this.city;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['area'] = this.area;
    data['address'] = this.address;
    data['resetToken'] = this.resetToken;
    data['otp'] = this.otp;
    data['fotgototp'] = this.fotgototp;
    data['otpGeneratedTime'] = this.otpGeneratedTime;
    data['otpExpirationTime'] = this.otpExpirationTime;
    data['fotgototpGeneratedTime'] = this.fotgototpGeneratedTime;
    data['fotgototpExpirationTime'] = this.fotgototpExpirationTime;
    data['mobileTokens'] = this.mobileTokens;
    data['licenseExpiry'] = this.licenseExpiry;
    data['licenseNo'] = this.licenseNo;
    data['companyId'] = this.companyId;
    data['idetityNumber'] = this.idetityNumber;
    data['dateOfBirthHijri'] = this.dateOfBirthHijri;
    data['dateOfBirthGregorian'] = this.dateOfBirthGregorian;
    data['isRegistered'] = this.isRegistered;
    data['isDeleteRequest'] = this.isDeleteRequest;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Vehicle {
  int? id;
  int? companyId;
  String? truckCompany;
  String? name;
  String? plate;
  String? plateInEnglish;
  String? plateInArabic;
  int? plateType;
  int? sequenceNo;
  dynamic image;
  String? status;
  bool? isRegistered;
  bool? isDeleteRequest;
  String? createdAt;
  String? updatedAt;

  Vehicle(
      {this.id,
        this.companyId,
        this.truckCompany,
        this.name,
        this.plate,
        this.plateInEnglish,
        this.plateInArabic,
        this.plateType,
        this.sequenceNo,
        this.image,
        this.status,
        this.isRegistered,
        this.isDeleteRequest,
        this.createdAt,
        this.updatedAt});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['companyId'];
    truckCompany = json['truckCompany'];
    name = json['name'];
    plate = json['plate'];
    plateInEnglish = json['plateInEnglish'];
    plateInArabic = json['plateInArabic'];
    plateType = json['plateType'];
    sequenceNo = json['sequenceNo'];
    image = json['image'];
    status = json['status'];
    isRegistered = json['isRegistered'];
    isDeleteRequest = json['isDeleteRequest'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyId'] = this.companyId;
    data['truckCompany'] = this.truckCompany;
    data['name'] = this.name;
    data['plate'] = this.plate;
    data['plateInEnglish'] = this.plateInEnglish;
    data['plateInArabic'] = this.plateInArabic;
    data['plateType'] = this.plateType;
    data['sequenceNo'] = this.sequenceNo;
    data['image'] = this.image;
    data['status'] = this.status;
    data['isRegistered'] = this.isRegistered;
    data['isDeleteRequest'] = this.isDeleteRequest;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
