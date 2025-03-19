class OrderDetailModel {
  OrderDetail? order;

  OrderDetailModel({this.order});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? new OrderDetail.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class OrderDetail {
  int? id;
  int? customerId;
  String? fromAddress;
  String? fromApartment;
  int? fromFloor;
  bool? fromElevator;
  dynamic departureLongitude;
  dynamic departureLatitude;
  bool? extraPickupEnabled;
  String? extraPickupAddress;
  String? extraPickupApartment;
  int? extraPickupFloor;
  bool? extraPickupElevator;
  String? toAddress;
  String? toApartment;
  int? toFloor;
  bool? toElevator;
  dynamic expectedDestinationLatitude;
  dynamic expectedDestinationLongitude;
  bool? extraDropoffEnabled;
  dynamic extraDropoffAddress;
  dynamic extraDropoffApartment;
  dynamic extraDropoffFloor;
  bool? extraDropoffElevator;
  String? name;
  String? email;
  String? phone;
  String? arrivalDate;
  String? arrivalTime;
  String? specialRequests;
  bool? termsAccepted;
  int? weight;
  String? tripNumber;
  String? status;
  dynamic cancellationReason;
  String? createdAt;
  String? updatedAt;
  Customer? customer;
  Assignment? assignment;

  OrderDetail(
      {this.id,
        this.customerId,
        this.fromAddress,
        this.fromApartment,
        this.fromFloor,
        this.fromElevator,
        this.departureLongitude,
        this.departureLatitude,
        this.extraPickupEnabled,
        this.extraPickupAddress,
        this.extraPickupApartment,
        this.extraPickupFloor,
        this.extraPickupElevator,
        this.toAddress,
        this.toApartment,
        this.toFloor,
        this.toElevator,
        this.expectedDestinationLatitude,
        this.expectedDestinationLongitude,
        this.extraDropoffEnabled,
        this.extraDropoffAddress,
        this.extraDropoffApartment,
        this.extraDropoffFloor,
        this.extraDropoffElevator,
        this.name,
        this.email,
        this.phone,
        this.arrivalDate,
        this.arrivalTime,
        this.specialRequests,
        this.termsAccepted,
        this.weight,
        this.tripNumber,
        this.status,
        this.cancellationReason,
        this.createdAt,
        this.updatedAt,
        this.customer,
        this.assignment});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customerId'];
    fromAddress = json['from_address'];
    fromApartment = json['from_apartment'];
    fromFloor = json['from_floor'];
    fromElevator = json['from_elevator'];
    departureLongitude = json['departureLongitude'];
    departureLatitude = json['departureLatitude'];
    extraPickupEnabled = json['extra_pickup_enabled'];
    extraPickupAddress = json['extra_pickup_address'];
    extraPickupApartment = json['extra_pickup_apartment'];
    extraPickupFloor = json['extra_pickup_floor'];
    extraPickupElevator = json['extra_pickup_elevator'];
    toAddress = json['to_address'];
    toApartment = json['to_apartment'];
    toFloor = json['to_floor'];
    toElevator = json['to_elevator'];
    expectedDestinationLatitude = json['expectedDestinationLatitude'];
    expectedDestinationLongitude = json['expectedDestinationLongitude'];
    extraDropoffEnabled = json['extra_dropoff_enabled'];
    extraDropoffAddress = json['extra_dropoff_address'];
    extraDropoffApartment = json['extra_dropoff_apartment'];
    extraDropoffFloor = json['extra_dropoff_floor'];
    extraDropoffElevator = json['extra_dropoff_elevator'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    arrivalDate = json['arrival_date'];
    arrivalTime = json['arrival_time'];
    specialRequests = json['special_requests'];
    termsAccepted = json['terms_accepted'];
    weight = json['weight'];
    tripNumber = json['tripNumber'];
    status = json['status'];
    cancellationReason = json['cancellationReason'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    assignment = json['Assignment'] != null
        ? new Assignment.fromJson(json['Assignment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customerId'] = this.customerId;
    data['from_address'] = this.fromAddress;
    data['from_apartment'] = this.fromApartment;
    data['from_floor'] = this.fromFloor;
    data['from_elevator'] = this.fromElevator;
    data['departureLongitude'] = this.departureLongitude;
    data['departureLatitude'] = this.departureLatitude;
    data['extra_pickup_enabled'] = this.extraPickupEnabled;
    data['extra_pickup_address'] = this.extraPickupAddress;
    data['extra_pickup_apartment'] = this.extraPickupApartment;
    data['extra_pickup_floor'] = this.extraPickupFloor;
    data['extra_pickup_elevator'] = this.extraPickupElevator;
    data['to_address'] = this.toAddress;
    data['to_apartment'] = this.toApartment;
    data['to_floor'] = this.toFloor;
    data['to_elevator'] = this.toElevator;
    data['expectedDestinationLatitude'] = this.expectedDestinationLatitude;
    data['expectedDestinationLongitude'] = this.expectedDestinationLongitude;
    data['extra_dropoff_enabled'] = this.extraDropoffEnabled;
    data['extra_dropoff_address'] = this.extraDropoffAddress;
    data['extra_dropoff_apartment'] = this.extraDropoffApartment;
    data['extra_dropoff_floor'] = this.extraDropoffFloor;
    data['extra_dropoff_elevator'] = this.extraDropoffElevator;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['arrival_date'] = this.arrivalDate;
    data['arrival_time'] = this.arrivalTime;
    data['special_requests'] = this.specialRequests;
    data['terms_accepted'] = this.termsAccepted;
    data['weight'] = this.weight;
    data['tripNumber'] = this.tripNumber;
    data['status'] = this.status;
    data['cancellationReason'] = this.cancellationReason;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.assignment != null) {
      data['Assignment'] = this.assignment!.toJson();
    }
    return data;
  }
}

class Customer {
  int? id;
  dynamic firstName;
  dynamic lastName;
  String? name;
  dynamic email;
  dynamic password;
  String? phone;
  dynamic profilePic;
  String? role;
  dynamic dob;
  dynamic age;
  dynamic gender;
  dynamic bio;
  String? accountStatus;
  dynamic deactivatedDate;
  dynamic country;
  dynamic city;
  dynamic latitude;
  dynamic longitude;
  dynamic area;
  dynamic address;
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
  dynamic companyId;
  dynamic idetityNumber;
  dynamic dateOfBirthHijri;
  dynamic dateOfBirthGregorian;
  bool? isRegistered;
  bool? isDeleteRequest;
  String? createdAt;
  String? updatedAt;

  Customer(
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

  Customer.fromJson(Map<String, dynamic> json) {
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

class Assignment {
  int? id;
  int? orderId;
  int? companyId;
  int? driverId;
  int? vehicleId;
  String? status;
  StartLocationCoordinates? startLocationCoordinates;
  dynamic arrivedLocationCoordinates;
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
    arrivedLocationCoordinates = json['arrivedLocationCoordinates'];
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
    data['arrivedLocationCoordinates'] = this.arrivedLocationCoordinates;
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
