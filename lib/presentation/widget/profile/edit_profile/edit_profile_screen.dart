import 'package:driver_app/export.dart';
import 'package:driver_app/presentation/common/common_dialouge_box.dart';
import 'package:driver_app/presentation/common/common_snackbar.dart';
import 'package:driver_app/presentation/widget/profile/controller/get_profile_cubit.dart';
import 'package:driver_app/presentation/widget/profile/controller/profile_text_field_controller.dart';
import 'package:driver_app/presentation/widget/profile/edit_profile/controller/update_profile_cubit.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;

    return BlocProvider<ImagePickerCubit>(
      create: (context) => ImagePickerCubit(),
      child: Scaffold(
        appBar: CustomAppBar(title: appLocale.editProfile),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                60.y,
                BlocBuilder<ImagePickerCubit, XFile?>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        context.read<ImagePickerCubit>().logoBottomSheet(context);
                      },
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          BlocBuilder<GetProfileCubit, GetProfileState>(
                            builder: (context, state) {
                              return CircleAvatar(
                                radius: 40.r,
                                backgroundImage: state is GetProfileSuccess ? state.getProfileModel.profilePic != null ? NetworkImage(state.getProfileModel.profilePic.toString()) : AssetImage(AppImages.avatar) : AssetImage(AppImages.avatar),
                              );
                            },
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
                BlocBuilder<GetProfileCubit, GetProfileState>(
                  builder: (context, state) {
                    ProfileTextFieldController.instance.firstNameController.text = state is GetProfileSuccess ? state.getProfileModel.firstName.toString() : ProfileTextFieldController.instance.firstNameController.text;
                    ProfileTextFieldController.instance.lastNameController.text = state is GetProfileSuccess ? state.getProfileModel.lastName.toString() : ProfileTextFieldController.instance.lastNameController.text;
                    return Column(
                      children: [
                        PrefixTextField(
                            controller: ProfileTextFieldController.instance.firstNameController,
                            obscureText: false,
                            svgPath: AppImages.profile,
                            hintText: appLocale.firstName),
                        20.y,
                        PrefixTextField(
                          controller: ProfileTextFieldController.instance.lastNameController,
                          obscureText: false,
                          svgPath: AppImages.profile,
                          hintText: appLocale.lastName,
                        ),
                      ],
                    );
                  },
                ),
                50.y,
                BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
                  listener: (context, state) {
                    if(state is UpdateProfileLoading){
                      CommonDialogsBox.showLoadingDialogue(context: context);
                    }
                    else if(state is UpdateProfileSuccess){
                      Navigator.pop(context);
                      showCustomSnackBar(context, message: state.message.toString(), type: SnackBarType.success);
                    }
                    else if(state is UpdateProfileError){
                      showCustomSnackBar(context, message: state.error.toString(), type: SnackBarType.error);
                    }
                  },
                  builder: (context, state) {
                    return ButtonWidget(
                      loading: false,
                      title: appLocale.update,
                      onPress: () {
                        context.read<UpdateProfileCubit>().updateProfile();
                      },
                      buttonColor: AppColor.red,
                      textColor: AppColor.white,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
