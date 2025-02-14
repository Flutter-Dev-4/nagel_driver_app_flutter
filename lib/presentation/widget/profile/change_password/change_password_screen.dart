import 'package:driver_app/export.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(title: appLocale.changePassword),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              spacing: 20.h,
              children: [
                PrefixTextField(
                    obscureText: true,
                    svgPath: AppImages.changePasswordLock,
                    hintText: appLocale.oldPassword),
                PrefixTextField(
                    obscureText: true,
                    svgPath: AppImages.changePasswordLock,
                    hintText: appLocale.newPassword),
                PrefixTextField(
                    obscureText: true,
                    svgPath: AppImages.changePasswordLock,
                    hintText: appLocale.confirmPassword),
                30.y,
                ButtonWidget(
                  loading: false,
                  title: appLocale.update,
                  onPress: () {},
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
