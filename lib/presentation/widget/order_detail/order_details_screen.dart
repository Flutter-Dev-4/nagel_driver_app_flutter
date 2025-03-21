import 'package:driver_app/export.dart';
import 'package:driver_app/presentation/common/common_dialouge_box.dart';
import 'package:driver_app/presentation/common/common_snackbar.dart';
import 'package:driver_app/presentation/widget/order_detail/controller/move_start_cubit.dart';
import 'package:driver_app/presentation/widget/order_detail/controller/order_detail_api_cubit.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {

  final double latitude = 37.422; // Example latitude
  final double longitude = -122.084; // Example longitude

  int currentIndex = 0;
  final String phoneNumber =
      "1234567890"; // Replace with the user's contact number

  late GoogleMapController mapController;
  LatLng? currentLocation;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  StreamSubscription<Position>? positionStream;

  BitmapDescriptor? userLocation;
  BitmapDescriptor? dropOff;

  void setCustomIconLocation(String _imageString) {
    BitmapDescriptor.fromAssetImage(
      // ImageConfiguration.empty, MyImgs.pickupLocation)
        ImageConfiguration.empty, _imageString)
        .then((icon) {
      setState(() {
        userLocation = icon;
      });
    });
  }

  void setCustomIconDropLocation(String _imageString) {
    BitmapDescriptor.fromAssetImage(
      // ImageConfiguration.empty, MyImgs.pickupLocation)
        ImageConfiguration.empty, _imageString)
        .then((icon) {
      setState(() {
        dropOff = icon;
      });
    });
  }

  Future<void> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      // Handle permission denied case
      print("Location permission denied");
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<OrderDetailApiCubit>().orderDetail();

    _requestLocationPermission();
    _getCurrentLocation();
    setCustomIconLocation(AppImages.currentLocation);
    setCustomIconDropLocation(AppImages.destinationLocation);
  }

  /// Get the current location of the user
  Future<void> _getCurrentLocation() async {

    final cubit = context.read<OrderDetailApiCubit>();

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      currentLocation = LatLng(cubit.fromLat!, cubit.fromLong!);
      markers.add(
        Marker(
          markerId: MarkerId("current"),
          icon: userLocation == null ? BitmapDescriptor.defaultMarker : userLocation!,
          position: LatLng(cubit.fromLat!, cubit.fromLong!),
          infoWindow: InfoWindow(title: "Current Location"),
        ),
      );
    });
    _getDirections(); // Fetch route once location is available
  }

  /// Fetch route between current location and destination
  Future<void> _getDirections() async {

    final cubit = context.read<OrderDetailApiCubit>();

    if (currentLocation == null) return;

    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: "AIzaSyBa7gpIFsqCjngZdpif0HPOSJBP1mQ_ty8",
      request: PolylineRequest(origin: PointLatLng(currentLocation!.latitude, currentLocation!.longitude), destination: PointLatLng(cubit.toLat!, cubit.toLong!), mode: TravelMode.driving),
    );

    if (result.points.isNotEmpty) {
      List<LatLng> polylineCoordinates = result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();

      setState(() {
        polylines.add(Polyline(
          polylineId: PolylineId("route"),
          points: polylineCoordinates,
          color: Colors.black,
          width: 5,
        ));
        markers.add(
          Marker(
            markerId: MarkerId("destination"),
            icon: dropOff == null ? BitmapDescriptor.defaultMarker : dropOff!,
            position: LatLng(cubit.toLat!, cubit.toLong!),
            infoWindow: InfoWindow(title: "Destination"),
          ),
        );
      });
    }
  }

  /// Start real-time tracking when driver presses "Start Move"
  void _startTracking() {

    final cubit = context.read<OrderDetailApiCubit>();

    positionStream = Geolocator.getPositionStream(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    ).listen((Position position) {
      setState(() {
        currentLocation = LatLng(cubit.fromLat!, cubit.fromLong!);
        markers.removeWhere((m) => m.markerId.value == "current");
        markers.add(
          Marker(
            markerId: MarkerId("current"),
            position: LatLng(cubit.fromLat!, cubit.fromLong!),
            infoWindow: InfoWindow(title: "Current Location"),
          ),
        );

        // Center the camera on the updated location
        mapController.animateCamera(
          CameraUpdate.newLatLng(currentLocation!),
        );

        // Check if reached destination
        if (_checkIfArrived()) {
          positionStream?.cancel();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("You have arrived at your destination!")),
          );
        }
      });
    });
  }

  /// Check if the driver reached the destination
  bool _checkIfArrived() {

    final cubit = context.read<OrderDetailApiCubit>();

    double distance = Geolocator.distanceBetween(
      cubit.fromLat!,
      cubit.fromLong!,
      cubit.toLat!,
      cubit.toLong!,
    );
    return distance < 10; // Stop tracking if within 10 meters
  }

  @override
  void dispose() {
    positionStream?.cancel();
    super.dispose();
  }

  Future<void> _makePhoneCall(String number) async {
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

  Future<void> _openMap(double lat, double long) async {
    final String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    final String appleMapsUrl = 'http://maps.apple.com/?q=$lat,$long';

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl); // Launch Google Maps
    } else if (await canLaunch(appleMapsUrl)) {
      await launch(appleMapsUrl); // Launch Apple Maps (iOS fallback)
    } else {
      throw 'Could not launch Maps';
    }
  }


  @override
  Widget build(BuildContext context) {

    final appLocale = AppLocalizations.of(context);

    return BlocBuilder<OrderDetailCubit, OrderDetailsState>(
        builder: (context, state) {
      final cubit = context.read<OrderDetailCubit>();
      return Scaffold(
        body: SlidingUpPanel(
          backdropOpacity: 0,
          parallaxOffset: 0,
          renderPanelSheet: false,
          color: Colors.transparent,
          minHeight: 580.h, // Adjust this as needed
          maxHeight: 1.sh, // Full screen
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          panelBuilder: (scrollController) =>
              _pickUpBuildPanel(scrollController),
          body: SizedBox(
            height: 370.h,
            width: double.infinity,
            child: Stack(
              children: [
                BlocBuilder<OrderDetailApiCubit, OrderDetailApiState>(
                  builder: (context, state) {

                    final cubit = context.read<OrderDetailApiCubit>();

                    return SizedBox(
                  height: 370.h,
                  child: state is OrderDetailApiSuccess
                      ? cubit.fromLat != null
                      || cubit.fromLong != null
                      ? GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(cubit.fromLat!, cubit.fromLong!),
                      zoom: 7,
                    ),
                    markers: markers,
                    polylines: polylines,
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                  ) : Center(child: CircularProgressIndicator())
                      : Center(child: CircularProgressIndicator()),
                );
  },
),
                Padding(
                  padding: EdgeInsets.only(
                    top: 30.h,
                    left: 15.w,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      AppLocalizations.of(context)!.localeName == 'en' ? AppImages.back : AppImages.back2,
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _pickUpBuildPanel(ScrollController scrollController) {
    final appLocale = AppLocalizations.of(context)!;

    return BlocBuilder<OrderDetailApiCubit, OrderDetailApiState>(
  builder: (context, state) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Container(
              padding: EdgeInsets.all(20.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 60.w,
                        height: 5.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.w, right: 15.w, bottom: 10.h),
                      child: Column(
                        spacing: 15.h,
                        children: [
                          ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                backgroundImage: state is OrderDetailApiSuccess ? state.orderDetailModel.order!.assignment!.driver!.profilePic != null ? NetworkImage(state.orderDetailModel.order!.assignment!.driver!.profilePic.toString()) : AssetImage(AppImages.avatar) : AssetImage(AppImages.avatar),
                              ),
                              title: AppTextRegular(
                                title: state is OrderDetailApiSuccess ? '${state.orderDetailModel.order!.assignment!.driver!.firstName.toString()} ${state.orderDetailModel.order!.assignment!.driver!.lastName.toString()}' : '',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.primaryBlack,
                              ),
                              subtitle: Row(
                                children: [
                                  AppTextMedium(
                                    title: appLocale.arrivalBetween,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.primaryBlack,
                                  ),
                                  10.x,
                                  AppTextMedium(
                                    title: state is OrderDetailApiSuccess ? state.orderDetailModel.order!.arrivalTime.toString() : '',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.primaryBlack,
                                  ),
                                ],
                              )),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppImages.location,
                                width: 13.w,
                                height: 16.h,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Expanded(
                                child: AppTextMedium(
                                  title: state is OrderDetailApiSuccess ? '${state.orderDetailModel.order!.fromFloor.toString()} ${state.orderDetailModel.order!.fromApartment.toString()} ${state.orderDetailModel.order!.fromAddress.toString()}' : '',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primaryBlack,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppImages.location,
                                width: 13.w,
                                height: 16.h,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Expanded(
                                child: AppTextMedium(
                                  title: state is OrderDetailApiSuccess ? '${state.orderDetailModel.order!.toFloor.toString()} ${state.orderDetailModel.order!.toApartment.toString()} ${state.orderDetailModel.order!.toAddress.toString()}' : '',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primaryBlack,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: AppTextRegular(
                                  title: appLocale.customerInventoryItems,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.primaryBlack,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const AddItemDialogue();
                                    },
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: AppColor.red,
                                      size: 20.sp,
                                    ),
                                    AppTextRegular(
                                      title: appLocale.addExtraItem,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.red,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const RoomsData(),
                          ButtonWidget(
                            loading: false,
                            title: currentIndex == 0
                                ? appLocale.moveStart
                                : currentIndex == 1
                                    ? appLocale.markAsArrived
                                    : appLocale.moveDelivered,
                            onPress: () {
                                if(currentIndex==0 || currentIndex==1){
                                  showDialog(
                                    context: context,
                                    builder: (context) {

                                      final cubit = context.read<OrderDetailApiCubit>();
                                      final orderId = state is OrderDetailApiSuccess ? state.orderDetailModel.order!.assignment!.orderId : 0;
                                      final latitude = state is OrderDetailApiSuccess ? state.orderDetailModel.order!.expectedDestinationLatitude : 0.0;
                                      final longitude = state is OrderDetailApiSuccess ? state.orderDetailModel.order!.expectedDestinationLongitude : 0.0;

                                      return BlocConsumer<MoveStartCubit, MoveStartState>(
                                        listener: (context, state) {
                                          if(state is MoveStartLoading){
                                            CommonDialogsBox.showLoadingDialogue(context: context);
                                          }
                                          if(state is MoveStartError){
                                            Navigator.pop(context);
                                            showCustomSnackBar(context, message: state.error.toString(), type: SnackBarType.error);
                                            Navigator.pop(context);
                                          }
                                          else if(state is MoveStartSuccess){
                                            currentIndex++;
                                            Navigator.pop(context);
                                            showCustomSnackBar(context, message: state.message.toString(), type: SnackBarType.success);
                                          }
                                        },
                                        builder: (context, state) {
                                          return StatesDialogueConfirm(
                                        title: currentIndex == 0 ? appLocale.moveStarted : appLocale.markArrived,
                                        onPress: () {
                                          context.read<MoveStartCubit>().moveStart(orderId!, cubit.fromLat!, cubit.fromLong!);
                                          _startTracking();
                                        },
                                      );
                                        },
                                      );
                                    },
                                  );
                                }
                                if(currentIndex==2){
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return BookingSuccessfully();
                                    },
                                  );
                                }
                              print(currentIndex.toString());
                            },
                            buttonColor: AppColor.red,
                            textColor: AppColor.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: appLocale.localeName == 'en' ? 20.w : 0.w,
                left: appLocale.localeName == 'ar' ? 20.w : 0.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    _openMap(state is OrderDetailApiSuccess ? state.orderDetailModel.order!.departureLatitude : 0.0, state is OrderDetailApiSuccess ? state.orderDetailModel.order!.departureLongitude : 0.0);
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColor.lightRed,
                    child: Center(
                        child: Image(
                      image: const AssetImage(AppImages.googleLocation1),
                      width: 18.w,
                      height: 25.h,
                    )),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    _makePhoneCall(state is OrderDetailApiSuccess ? state.orderDetailModel.order!.customer!.phone.toString() : '1234567890');
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColor.red,
                    child: Center(
                      child: SvgPicture.asset(
                        AppImages.calling,
                        width: 19.w,
                        height: 19.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  },
);
  }
}
