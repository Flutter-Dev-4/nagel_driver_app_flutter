import 'package:driver_app/export.dart';
import 'package:driver_app/presentation/common/common_dialouge_box.dart';
import 'package:driver_app/presentation/widget/profile/controller/get_profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetProfileCubit>().getProfile();
  }

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
            BlocBuilder<GetProfileCubit, GetProfileState>(
              builder: (context, state) {
                return CircleAvatar(
                  radius: 40.r,
                  backgroundImage: state is GetProfileSuccess ? NetworkImage(state.getProfileModel.profilePic.toString()) : AssetImage(AppImages.avatar),
                );
              },
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
