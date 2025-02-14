import 'package:driver_app/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final List<String> status = [
      appLocale.active,
      appLocale.assigned,
      appLocale.assigned
    ];

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
                      child: const CircleAvatar(
                        backgroundImage: AssetImage(AppImages.avatar),
                      ),
                    ),
                    10.x,
                    AppTextRegular(
                      title: appLocale.helloAswadHaider,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.primaryBlack,
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
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesNames.order_details);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
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
                                      title: appLocale.arrivalBetween,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.primaryBlack,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: AppTextMedium(
                                      title: appLocale.eightAugust2024,
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
                                  left: 15.w, right: 15.w, bottom: 10.h),
                              child: Column(
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: const CircleAvatar(
                                      backgroundImage:
                                          AssetImage(AppImages.avatar),
                                    ),
                                    title: Row(
                                      children: [
                                        AppTextRegular(
                                          title: appLocale.aqibJavid,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.primaryBlack,
                                        ),
                                        5.x,
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7.w, vertical: 1.h),
                                          decoration: BoxDecoration(
                                            color: AppColor.red,
                                            borderRadius:
                                                BorderRadius.circular(40.r),
                                          ),
                                          child: AppTextRegular(
                                            title: status[index],
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
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
                                          title: appLocale.alAkariaAlOlayah,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.primaryBlack,
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
                                          title: appLocale.raihanatAlJazirah,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.primaryBlack,
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
                }),
          ],
        ),
      ),
    );
  }
}
