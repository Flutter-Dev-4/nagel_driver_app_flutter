class GetMyOrdersModel {
  List<Orders>? orders;

  GetMyOrdersModel({this.orders});

  GetMyOrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
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

class Orders {
  int? id;
  String? fromAddress;
  String? toAddress;
  String? status;
  String? arrivalDate;
  String? arrivalTime;
  Assignment? assignment;

  Orders(
      {this.id,
        this.fromAddress,
        this.toAddress,
        this.status,
        this.arrivalDate,
        this.arrivalTime,
        this.assignment});

  Orders.fromJson(Map<String, dynamic> json) {
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
  dynamic startLocationCoordinates;
  dynamic arrivedLocationCoordinates;
  String? createdAt;
  String? updatedAt;

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
        this.updatedAt});

  Assignment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['orderId'];
    companyId = json['companyId'];
    driverId = json['driverId'];
    vehicleId = json['vehicleId'];
    status = json['status'];
    startLocationCoordinates = json['startLocationCoordinates'];
    arrivedLocationCoordinates = json['arrivedLocationCoordinates'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderId'] = this.orderId;
    data['companyId'] = this.companyId;
    data['driverId'] = this.driverId;
    data['vehicleId'] = this.vehicleId;
    data['status'] = this.status;
    data['startLocationCoordinates'] = this.startLocationCoordinates;
    data['arrivedLocationCoordinates'] = this.arrivedLocationCoordinates;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
