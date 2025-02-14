import 'package:driver_app/export.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: CustomAppBar(title: appLocale.profile),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            40.y,
            CircleAvatar(
              radius: 40.r,
              backgroundImage: const AssetImage(AppImages.avatar),
            ),
            40.y,
            CardWidget(
              imagePath: AppImages.profile,
              title: appLocale.profile,
              onPress: () {
                Navigator.pushNamed(context, RoutesNames.edit_profile);
              },
            ),
            CardWidget(
              imagePath: AppImages.changePasswordLock,
              title: appLocale.changePassword,
              onPress: () {
                Navigator.pushNamed(context, RoutesNames.change_password);
              },
            ),
            CardWidget(
              imagePath: AppImages.changeLanguage,
              title: appLocale.changeLanguage,
              onPress: () {
                Navigator.pushNamed(context, RoutesNames.change_language);
              },
            ),
            CardWidget(
              imagePath: AppImages.orderHistory,
              title: appLocale.orderHistory,
              onPress: () {
                Navigator.pushNamed(context, RoutesNames.order_history);
              },
            ),
            CardWidget(
              imagePath: AppImages.privacy,
              title: appLocale.privacyPolicy,
              onPress: () {},
            ),
            CardWidget(
              imagePath: AppImages.logout,
              title: appLocale.logout,
              onPress: () {
                Navigator.pushNamed(context, RoutesNames.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
