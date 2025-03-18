import 'package:driver_app/export.dart';
import 'package:driver_app/presentation/common/common_dialouge_box.dart';
import 'package:driver_app/presentation/common/common_snackbar.dart';
import 'package:driver_app/presentation/widget/profile/order_history/controller/order_history_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<OrderHistoryCubit>().orderHistory();
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(title: appLocale.orderHistory),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: BlocConsumer<OrderHistoryCubit, OrderHistoryState>(
          listener: (context, state) {
            if (state is OrderHistoryLoading) {
              CommonDialogsBox.showLoadingDialogue(context: context);
            }
            if (state is OrderHistoryError) {
              showCustomSnackBar(context,
                  message: state.error.toString(),
                  type: SnackBarType.error);
            } else if (state is OrderHistorySuccess) {}
          },
          builder: (context, state) {
            return state is OrderHistorySuccess
            ? state.orderHistory.length != 0
                ? ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: state.orderHistory.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColor.white10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              children: [
                                Expanded(
                                  child: AppTextMedium(
                                    title: '${appLocale.orderID}: # ${state.orderHistory[index].assignment?.orderId.toString()}',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.primaryBlack,
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: AppTextMedium(
                                      title: '${appLocale.status}: ${state.orderHistory[index].assignment?.status}',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.primaryBlack,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, right: 15.w, bottom: 10.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: CircleAvatar(
                                    backgroundImage: state.orderHistory[index].assignment?.driver?.profilePic != null ? NetworkImage(state.orderHistory[index].assignment!.driver!.profilePic.toString()) : AssetImage(AppImages.avatar),
                                  ),
                                  title: AppTextRegular(
                                    title: state.orderHistory[index].assignment?.driver?.firstName != null ? '${state.orderHistory[index].assignment!.driver!.firstName.toString()} ${state.orderHistory[index].assignment!.driver!.lastName.toString()}' : '',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.primaryBlack,
                                  ),
                                  subtitle: AppTextMedium(
                                    title: '${appLocale.items}: ${appLocale
                                        .tenBoxes}',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.primaryBlack,
                                  ),
                                ),
                                AppTextMedium(
                                  title: '${appLocale.orderDate}: ${state.orderHistory[index].arrivalDate.toString()}',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primaryBlack,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ): Center(
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
      ),
    );
  }
}
