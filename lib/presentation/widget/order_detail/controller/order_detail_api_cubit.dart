import 'dart:developer';

import 'package:driver_app/application/DiLayer/depdency_injection.dart';
import 'package:driver_app/application/services/ApiServices/api_services.dart';
import 'package:driver_app/data/repositories/order_detail_repo.dart';
import 'package:driver_app/domain/models/order_detail_model.dart';
import 'package:driver_app/export.dart';

part 'order_detail_api_state.dart';

class OrderDetailApiCubit extends Cubit<OrderDetailApiState> {
  OrderDetailApiCubit() : super(OrderDetailApiInitial());

  OrderDetailRepo orderDetailRepo = OrderDetailRepo(apiService: locator<ApiServices>());

  double? fromLat;
  double? fromLong;
  double? toLat;
  double? toLong;

  Future orderDetail() async {
    emit(OrderDetailApiLoading());
    orderDetailRepo.orderDetail().then((val){
      log("Val Response is ${val.data.toString()}");
      if(val.success == true){
        OrderDetailModel orderDetailModel = OrderDetailModel.fromJson(val.data!['data']);
        emit(OrderDetailApiSuccess(orderDetailModel: orderDetailModel));

        fromLat = orderDetailModel.order?.expectedDestinationLatitude;
        fromLong = orderDetailModel.order?.expectedDestinationLongitude;

        toLat = orderDetailModel.order?.departureLatitude;
        toLong = orderDetailModel.order?.departureLongitude;

        log('This is latitude and Longitude \n${orderDetailModel.order?.expectedDestinationLatitude.toString()}, ${orderDetailModel.order?.expectedDestinationLongitude.toString()}');
      }else{
        emit(OrderDetailApiError(error: val.data!['errormessage'].toString()));
      }
    });
  }


  LatLng current = LatLng(24.696657, 46.671547); // Example Current
  LatLng destination = LatLng(21.578569, 39.170686); // Example Destination

  GoogleMapController? mapController;
  BitmapDescriptor? currentIcon;
  BitmapDescriptor? destinationIcon;

  void setCustomCurrentLocation(String _imageString) {
    BitmapDescriptor.asset(
      // ImageConfiguration.empty, MyImgs.pickupLocation)
        ImageConfiguration.empty, _imageString)
        .then((icon) {
      currentIcon = icon;
    });
  }

  void setCustomDestinationLocation(String _imageString) {
    BitmapDescriptor.asset(
      // ImageConfiguration.empty, MyImgs.pickupLocation)
        ImageConfiguration.empty, _imageString)
        .then((icon) {
      destinationIcon = icon;
    });
  }

  Future<void> fetchLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      return;
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    emit(state.copyWith(currentPosition: position, isLoading: false));
    _fetchDirections(position);
  }

  Future<void> _fetchDirections(Position position) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: 'AIzaSyBa7gpIFsqCjngZdpif0HPOSJBP1mQ_ty8',
        request: PolylineRequest(
          origin: PointLatLng(current.latitude, current.longitude),
          destination: PointLatLng(destination.latitude, destination.longitude),
          mode: TravelMode.driving, // Choose from driving, walking, bicycling, transit
        )
    );

    Set<Polyline> polylines = {};
    if (result.points.isNotEmpty) {
      List<LatLng> polylineCoordinates = result.points.map((p) => LatLng(p.latitude, p.longitude)).toList();
      polylines.add(Polyline(
        polylineId: PolylineId("route"),
        points: polylineCoordinates,
        color: Colors.black,
        width: 5,
      ));
    }
    emit(state.copyWith(destination: destination, current: current, polylines: polylines));
  }

}
