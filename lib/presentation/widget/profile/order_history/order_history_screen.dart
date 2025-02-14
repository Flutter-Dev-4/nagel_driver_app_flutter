import 'package:driver_app/export.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {

    final appLocale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(title: appLocale.orderHistory),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 10,
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
                                  title: '${appLocale.orderID}: #12345',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primaryBlack,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: AppTextMedium(
                                    title: '${appLocale.status}: ${appLocale.delivered}',
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
                                leading: const CircleAvatar(
                                  backgroundImage:
                                      AssetImage(AppImages.avatar),
                                ),
                                title: AppTextRegular(
                                  title: appLocale.aqibJavid,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.primaryBlack,
                                ),
                                subtitle: AppTextMedium(
                                  title: '${appLocale.items}: ${appLocale.tenBoxes}',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primaryBlack,
                                ),
                              ),
                              AppTextMedium(
                                title: '${appLocale.orderDate}: ${appLocale.june2024}',
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
        ),
      ),
    );
  }
}
