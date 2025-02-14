import 'package:driver_app/export.dart';

class StatesDialogueConfirm extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  StatesDialogueConfirm(
      {super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;

    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: AppColor.white,
          title: SvgPicture.asset(AppImages.success),
          content: Column(
            spacing: 20.h,
            mainAxisSize: MainAxisSize.min,
            children: [
              HeadingText(
                title: title,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.primaryBlack,
                textAlign: TextAlign.center,
              ),
              AppTextRegular(
                title: appLocale.areYouSure,
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
                              title: appLocale.cancel,
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
                        title: appLocale.confirm,
                        onPress: onPress,
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
      ),
    );
  }
}
