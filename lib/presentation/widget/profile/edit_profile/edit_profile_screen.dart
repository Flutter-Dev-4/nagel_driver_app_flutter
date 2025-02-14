import 'package:driver_app/export.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {

    final appLocale = AppLocalizations.of(context)!;

    return BlocProvider<ImagePickerCubit>(
      create: (context) => ImagePickerCubit(),
      child: Scaffold(
        appBar: CustomAppBar(title: appLocale.editProfile),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              60.y,
              BlocBuilder<ImagePickerCubit, XFile?>(
                builder: (context, state) {
                  return InkWell(
                    onTap: (){
                      context
                          .read<ImagePickerCubit>()
                          .logoBottomSheet(context);
                    },
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 40.r,
                          backgroundImage: state == null
                              ? const AssetImage(AppImages.avatar)
                              : FileImage(File(state.path)),
                        ),
                        Container(
                          height: 26.h,
                          width: 26.w,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColor.lightRed,
                            ),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppImages.edit,
                              width: 16.w,
                              height: 16.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              70.y,
              PrefixTextField(
                  obscureText: false,
                  svgPath: AppImages.profile,
                  hintText: appLocale.firstName),
              20.y,
              PrefixTextField(
                obscureText: false,
                svgPath: AppImages.profile,
                hintText: appLocale.lastName,
              ),
              50.y,
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
    );
  }
}
