import 'dart:developer';

import 'package:driver_app/application/DiLayer/depdency_injection.dart';
import 'package:driver_app/application/services/ApiServices/api_services.dart';
import 'package:driver_app/data/repositories/order_detail_repo.dart';
import 'package:driver_app/domain/models/order_detail_model.dart';
import 'package:driver_app/export.dart';

class OrderDetailCubit extends Cubit<OrderDetailsState> {

  OrderDetailCubit() : super(OrderDetailsState());


  final double latitude = 37.422; // Example latitude
  final double longitude = -122.084; // Example longitude
  LatLng current = LatLng(24.696657, 46.671547); // Example Current
  LatLng destination = LatLng(21.578569, 39.170686); // Example Destination

  int currentIndex = 0;

  final String phoneNumber = "1234567890"; // Replace with the user's contact number


  Future<void> makePhoneCall(String number) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: number,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $number';
    }
  }

  Future<void>  openMap() async {
    final String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    final String appleMapsUrl = 'http://maps.apple.com/?q=$latitude,$longitude';

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl); // Launch Google Maps
    } else if (await canLaunch(appleMapsUrl)) {
      await launch(appleMapsUrl); // Launch Apple Maps (iOS fallback)
    } else {
      throw 'Could not launch Maps';
    }
  }

  final String googleAPIKey = "AIzaSyBa7gpIFsqCjngZdpif0HPOSJBP1mQ_ty8";
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

  void incrementStep() {
    emit(state.copyWith(currentIndex: state.currentIndex + 1));
  }

}
