import 'package:driver_app/export.dart';
import 'package:driver_app/presentation/common/common_dialouge_box.dart';
import 'package:driver_app/presentation/common/common_snackbar.dart';
import 'package:driver_app/presentation/widget/profile/change_password/controller/change_password_cubit.dart';
import 'package:driver_app/presentation/widget/profile/controller/profile_text_field_controller.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(title: appLocale.changePassword),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _globalKey,
              child: Column(
                spacing: 20.h,
                children: [
                  PrefixTextField(
                      controller: ProfileTextFieldController.instance.oldPassController,
                      obscureText: true,
                      svgPath: AppImages.changePasswordLock,
                      hintText: appLocale.oldPassword,
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return appLocale.enterOldPassword;
                        }
                        return null;
                      },
                  ),
                  PrefixTextField(
                      controller: ProfileTextFieldController.instance.newPassController,
                      obscureText: true,
                      svgPath: AppImages.changePasswordLock,
                      hintText: appLocale.newPassword,
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return appLocale.enterNewPassword;
                        }
                        return null;
                      },
                  ),
                  PrefixTextField(
                      controller: ProfileTextFieldController.instance.confirmPassController,
                      obscureText: true,
                      svgPath: AppImages.changePasswordLock,
                      hintText: appLocale.confirmPassword,
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return appLocale.enterConfirmPassword;
                        }
                        return null;
                      },
                  ),
                  30.y,
                  BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                    listener: (context, state) {
                      if(state is ChangePasswordLoading){
                        CommonDialogsBox.showLoadingDialogue(context: context);
                      }
                      if(state is ChangePasswordError){
                        Navigator.pop(context);
                        showCustomSnackBar(context, message: state.error.toString(), type: SnackBarType.error);
                      }
                      else if(state is ChangePasswordSuccess){
                        Navigator.pop(context);
                        showCustomSnackBar(context, message: state.message.toString(), type: SnackBarType.success);
                      }
                    },
                    builder: (context, state) {
                      return ButtonWidget(
                    loading: false,
                    title: appLocale.update,
                    onPress: () {
                      if(_globalKey.currentState!.validate()){
                        context.read<ChangePasswordCubit>().changePassword();
                      }
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
      ),
    );
  }
}
