import 'package:driver_app/export.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {

    final appLocale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(title: appLocale.notification),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColor.white,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25.r,
                              backgroundImage: const AssetImage(AppImages.avatar),
                            ),
                            10.x,
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppTextRegular(
                                        title: appLocale.newOrder,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.primaryBlack,
                                      ),
                                      AppTextMedium(
                                        title: appLocale.oneHourAgo,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.primaryBlack,
                                      ),
                                    ],
                                  ),
                                  AppTextMedium(
                                    title: appLocale.newOrderHasBeen,
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
                    );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
