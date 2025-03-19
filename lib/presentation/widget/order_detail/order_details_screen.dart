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

  final Set<Polyline> polylines = const {};

  int currentIndex = 0;
  final String phoneNumber =
      "1234567890"; // Replace with the user's contact number

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
  void initState() {
    super.initState();
    context.read<OrderDetailApiCubit>().orderDetail();
    context.read<OrderDetailCubit>().fetchLocation();
    context
        .read<OrderDetailCubit>()
        .setCustomCurrentLocation(AppImages.currentLocation);
    context
        .read<OrderDetailCubit>()
        .setCustomDestinationLocation(AppImages.destinationLocation);
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
                    return SizedBox(
                  height: 370.h,
                  child: state is OrderDetailApiSuccess
                      ? GoogleMap(
                    zoomControlsEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(state.orderDetailModel.order?.expectedDestinationLatitude != null ? state.orderDetailModel.order?.expectedDestinationLatitude :  0.0, state.orderDetailModel.order?.expectedDestinationLongitude != null ? state.orderDetailModel.order?.expectedDestinationLongitude : 0.0),
                      zoom: 12.0,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId("currentLocation"),
                        position: LatLng(state.orderDetailModel.order?.expectedDestinationLatitude != null ? state.orderDetailModel.order?.expectedDestinationLatitude :  0.0, state.orderDetailModel.order?.expectedDestinationLongitude != null ? state.orderDetailModel.order?.expectedDestinationLongitude : 0.0),
                        infoWindow: InfoWindow(title: "Current Location"),
                        icon: cubit.currentIcon == null
                            ? BitmapDescriptor.defaultMarker
                            : cubit.currentIcon!,
                      ),
                        Marker(
                          markerId: MarkerId("destination"),
                          position: LatLng(state.orderDetailModel.order?.departureLatitude != null ? state.orderDetailModel.order?.departureLatitude :  0.0, state.orderDetailModel.order?.departureLongitude != null ? state.orderDetailModel.order?.departureLongitude : 0.0),
                          infoWindow: InfoWindow(title: "Destination"),
                          icon: cubit.destinationIcon == null
                              ? BitmapDescriptor.defaultMarker
                              : cubit.destinationIcon!,
                        ),
                    },
                    polylines: state.polylines,
                    onMapCreated: (controller) => context
                        .read<OrderDetailCubit>()
                        .mapController = controller,
                  )
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
                                          context.read<MoveStartCubit>().moveStart(orderId!, latitude, longitude);
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
