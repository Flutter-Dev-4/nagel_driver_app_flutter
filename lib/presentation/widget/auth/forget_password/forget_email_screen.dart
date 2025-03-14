import 'package:driver_app/export.dart';

class ForgetEmailScreen extends StatefulWidget {
  const ForgetEmailScreen({super.key});

  @override
  State<ForgetEmailScreen> createState() => _ForgetEmailScreenState();
}

class _ForgetEmailScreenState extends State<ForgetEmailScreen> {

  @override
  Widget build(BuildContext context) {

    final appLocale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              spacing: 20.h,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingText(
                  title: appLocale.forgetPassword,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primaryBlack,
                ),
                AppTextRegular(
                  title:
                      appLocale.enterYourEmailToGetOTP,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryBlack,
                ),
                PrefixTextField(
                  controller: TextEditingController(),
                    obscureText: false,
                    svgPath: AppImages.email,
                    hintText: appLocale.email),
                ButtonWidget(
                    loading: false,
                    title: appLocale.sendCode,
                    onPress: () {
                      Navigator.pushNamed(context, RoutesNames.otp_verification);
                    },
                    buttonColor: AppColor.red,
                    textColor: AppColor.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
