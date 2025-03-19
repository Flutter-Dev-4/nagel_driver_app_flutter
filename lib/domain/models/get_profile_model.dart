class GetProfileModel {
  int? id;
  String? firstName;
  String? lastName;
  String? name;
  String? email;
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

  GetProfileModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.name,
        this.email,
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

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    name = json['name'];
    email = json['email'];
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
