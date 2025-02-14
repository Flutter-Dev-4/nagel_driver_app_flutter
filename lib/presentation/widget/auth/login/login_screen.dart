import 'package:driver_app/export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _canPop = false; // Set this to true to allow navigation back

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;

    return PopScope(
      canPop: _canPop,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          // Show a confirmation dialog before exiting
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: AppColor.white,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20.h,
                mainAxisSize: MainAxisSize.min,
                children: [
                  HeadingText(
                    title: appLocale.exit,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primaryBlack,
                    textAlign: TextAlign.center,
                  ),
                  AppTextRegular(
                    title: appLocale.doYuoReallyWantToExit,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primaryBlack,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    spacing: 20.w,
                    children: [
                      Expanded(
                        child: Container(
                          height: 52.h,
                          width: 164.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.red),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.0.h), // Adjust padding as needed
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor
                                      .white, // Use 'primary' for button's color
                                  shadowColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: AppTextRegular(
                                  title: appLocale.no,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 52.h,
                          child: ButtonWidget(
                            loading: false,
                            title: appLocale.yes,
                            onPress: (){
                              _canPop = true;
                              SystemNavigator.pop();
                            },
                            buttonColor: AppColor.red,
                            textColor: AppColor.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 0,
              child: Column(
                children: [
                  67.y,
                  SvgPicture.asset(
                    AppImages.circle,
                    width: 348.w,
                    height: 348.h,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  140.y,
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 370.w,
                          height: 280.h,
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(AppImages.loginPic),
                            fit: BoxFit.fill,
                          )),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.sp),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 12.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      AppImages.truck,
                                      width: 19.w,
                                      height: 19.h,
                                    ),
                                    8.x,
                                    AppTextRegular(
                                      title: appLocale.truckArrived,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.primaryBlack,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 125.h,
                              left: 10.w,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      AppImages.check,
                                      width: 19.w,
                                      height: 19.h,
                                    ),
                                    8.x,
                                    AppTextRegular(
                                      title: appLocale.moverBookedSuccessfully,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.primaryBlack,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  50.y,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadingText(
                          title: appLocale.helloDriver,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColor.primaryBlack,
                        ),
                        10.y,
                        AppTextRegular(
                          title: appLocale.enterYourEmailAndPassword,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.primaryBlack,
                        ),
                        30.y,
                        PrefixTextField(
                          obscureText: false,
                          svgPath: AppImages.email,
                          hintText: appLocale.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        15.y,
                        const PrefixTextField(
                          obscureText: true,
                          svgPath: AppImages.lock,
                          hintText: '********',
                        ),
                        5.y,
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform.scale(
                                    scale: 0.6,
                                    child: Switch(
                                      value: true,
                                      onChanged: (value) {},
                                      activeTrackColor: AppColor.red,
                                    ),
                                  ),
                                  Expanded(
                                    child: AppTextRegular(
                                      title: appLocale.rememberMe,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.primaryBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutesNames.forget_email);
                                  },
                                  child: AppTextRegular(
                                    title: appLocale.forgetPassword,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.primaryBlack,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        20.y,
                        ButtonWidget(
                          loading: false,
                          title: appLocale.login,
                          onPress: () {
                            Navigator.pushNamed(context, RoutesNames.home);
                          },
                          buttonColor: AppColor.red,
                          textColor: AppColor.white,
                        ),
                        20.y,
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
