import 'package:driver_app/export.dart';
import 'package:driver_app/presentation/common/common_dialouge_box.dart';
import 'package:driver_app/presentation/common/common_snackbar.dart';
import 'package:driver_app/presentation/widget/home/controller/my_orders_cubit.dart';
import 'package:driver_app/presentation/widget/profile/controller/get_profile_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetProfileCubit>().getProfile();
    context.read<MyOrdersCubit>().getMyOrders();
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(
          children: [
            30.y,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesNames.profile);
                      },
                      child: BlocBuilder<GetProfileCubit, GetProfileState>(
                        builder: (context, state) {
                          return CircleAvatar(
                            backgroundImage: state is GetProfileSuccess
                                ? state.getProfileModel.profilePic != null
                                    ? NetworkImage(state
                                        .getProfileModel.profilePic
                                        .toString())
                                    : AssetImage(AppImages.avatar)
                                : AssetImage(AppImages.avatar),
                          );
                        },
                      ),
                    ),
                    10.x,
                    BlocBuilder<GetProfileCubit, GetProfileState>(
                      builder: (context, state) {
                        return AppTextRegular(
                          title:
                              '${appLocale.hello} ${state is GetProfileSuccess ? state.getProfileModel.firstName != null ? state.getProfileModel.firstName : '' : ''} ${state is GetProfileSuccess ? state.getProfileModel.lastName != null ? state.getProfileModel.lastName : '' : ''}',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primaryBlack,
                        );
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesNames.notification);
                    },
                    child: Badge.count(
                      backgroundColor: AppColor.red,
                      count: 2,
                      child: Padding(
                        padding: EdgeInsets.all(3.sp),
                        child: SvgPicture.asset(
                          AppImages.notification,
                          width: 25.w,
                          height: 25.h,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            15.y,
            AppTextRegular(
              title: appLocale.assignBooking,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColor.black20,
            ),
            15.y,
            BlocConsumer<MyOrdersCubit, MyOrdersState>(
              listener: (context, state) {
                if (state is MyOrdersLoading) {
                  CommonDialogsBox.showLoadingDialogue(context: context);
                }
                if (state is MyOrdersError) {
                  showCustomSnackBar(context,
                      message: state.error.toString(),
                      type: SnackBarType.error);
                } else if (state is MyOrdersSuccess) {}
              },
              builder: (context, state) {
                return state is MyOrdersSuccess
                    ? state.myOrdersList.length != 0
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.myOrdersList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 20.h),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutesNames.order_details);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: AppColor.white10),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.h, horizontal: 15.w),
                                          decoration: BoxDecoration(
                                            color: AppColor.white20,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.r),
                                              topRight: Radius.circular(10.r),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                flex: 3,
                                                child: AppTextMedium(
                                                  title:
                                                      '${appLocale.arrivalBetween} ${state.myOrdersList[index].arrivalTime.toString()}',
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.primaryBlack,
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: AppTextMedium(
                                                  title: state
                                                              .myOrdersList[
                                                                  index]
                                                              .arrivalDate !=
                                                          null
                                                      ? state
                                                          .myOrdersList[index]
                                                          .arrivalDate!
                                                          .toString()
                                                      : appLocale
                                                          .dateNotSelected,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.primaryBlack,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15.w,
                                              right: 15.w,
                                              bottom: 10.h),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                contentPadding: EdgeInsets.zero,
                                                leading: BlocBuilder<
                                                    GetProfileCubit,
                                                    GetProfileState>(
                                                  builder: (context, state) {
                                                    return CircleAvatar(
                                                      backgroundImage: state
                                                              is GetProfileSuccess
                                                          ? state.getProfileModel
                                                                      .profilePic !=
                                                                  null
                                                              ? NetworkImage(state
                                                                  .getProfileModel
                                                                  .profilePic
                                                                  .toString())
                                                              : AssetImage(
                                                                  AppImages
                                                                      .avatar)
                                                          : AssetImage(
                                                              AppImages.avatar),
                                                    );
                                                  },
                                                ),
                                                title: Row(
                                                  children: [
                                                    BlocBuilder<GetProfileCubit,
                                                        GetProfileState>(
                                                      builder:
                                                          (context, state) {
                                                        return AppTextRegular(
                                                          title:
                                                              '${state is GetProfileSuccess ? state.getProfileModel.firstName != null ? state.getProfileModel.firstName : '' : ''} ${state is GetProfileSuccess ? state.getProfileModel.lastName != null ? state.getProfileModel.lastName : '' : ''}',
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColor
                                                              .primaryBlack,
                                                        );
                                                      },
                                                    ),
                                                    5.x,
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 7.w,
                                                              vertical: 1.h),
                                                      decoration: BoxDecoration(
                                                        color: AppColor.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.r),
                                                      ),
                                                      child: AppTextRegular(
                                                        title: state
                                                            .myOrdersList[index]
                                                            .status
                                                            .toString(),
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColor.white,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    AppImages.location,
                                                    width: 13.w,
                                                    height: 16.h,
                                                  ),
                                                  15.x,
                                                  Expanded(
                                                    child: AppTextMedium(
                                                      title: state
                                                                  .myOrdersList[
                                                                      index]
                                                                  .fromAddress !=
                                                              null
                                                          ? state
                                                              .myOrdersList[
                                                                  index]
                                                              .fromAddress
                                                              .toString()
                                                          : appLocale
                                                              .addressNotMentioned,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppColor.primaryBlack,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              10.y,
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    AppImages.location,
                                                    width: 13.w,
                                                    height: 16.h,
                                                  ),
                                                  15.x,
                                                  Expanded(
                                                    child: AppTextMedium(
                                                      title: state
                                                                  .myOrdersList[
                                                                      index]
                                                                  .toAddress !=
                                                              null
                                                          ? state
                                                              .myOrdersList[
                                                                  index]
                                                              .toAddress
                                                              .toString()
                                                          : appLocale
                                                              .addressNotMentioned,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppColor.primaryBlack,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  'assets/images/home/not_found.json',
                                  width: 200.w,
                                  height: 200.h,
                                ),
                                AppTextRegular(
                                  title: appLocale.noOrdersFound,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.primaryBlack,
                                ),
                              ],
                            ),
                          )
                    : Column(
                        children: [
                          300.y,
                          Center(
                            child: CupertinoActivityIndicator(
                              radius: 20,
                              color: AppColor.red,
                            ),
                          ),
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
