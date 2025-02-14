import 'package:driver_app/export.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
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
              spacing: 15.h,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingText(
                  title: appLocale.setNewPassword,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primaryBlack,
                ),
                AppTextRegular(
                  title:
                  appLocale.setYourNewPassword,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryBlack,
                ),
                PrefixTextField(
                    obscureText: true,
                    svgPath: AppImages.lock,
                    hintText: '********',
                ),
                PrefixTextField(
                  obscureText: true,
                  svgPath: AppImages.lock,
                  hintText: '********',
                ),
                ButtonWidget(
                  loading: false,
                  title: appLocale.setPassword,
                  onPress: () {
                    Navigator.pushNamed(context, RoutesNames.login);
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
