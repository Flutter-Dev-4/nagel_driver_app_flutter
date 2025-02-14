import 'package:driver_app/export.dart';

class AddItemDialogue extends StatefulWidget {
  const AddItemDialogue({super.key});

  @override
  State<AddItemDialogue> createState() => _AddItemDialogueState();
}

class _AddItemDialogueState extends State<AddItemDialogue> {

  @override
  Widget build(BuildContext context) {

    final appLocale = AppLocalizations.of(context)!;

    return BlocProvider<ImagePickerCubit>(create: (context) => ImagePickerCubit() ,  child: Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: AppColor.white,
          title: HeadingText(
            title: appLocale.addExtraItem,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.primaryBlack,
            textAlign: TextAlign.center,
          ),
          content: Column(
            spacing: 20.h,
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<ImagePickerCubit, XFile?>(builder: (context, state){
                return InkWell(
                  onTap: (){
                    context.read<ImagePickerCubit>().logoBottomSheet(context);
                  },
                  child: state != null
                      ? Image(
                      height: 132.h,
                      image: FileImage(File(state.path)))
                      : Container(
                    padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColor.grey30,
                    ),
                    child: Center(
                      child: Column(
                        spacing: 20.h,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppImages.upload),
                          AppTextMedium(
                            title: appLocale.clickToUpload,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grey50,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              AppTextRegular(
                title: appLocale.haveAUniqueItem,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.primaryBlack,
              ),
              CustomTextField(hintText: appLocale.nameOfItem),
              CustomTextField(hintText: appLocale.widthInInches),
              CustomTextField(hintText: appLocale.heightInInches),
              CustomTextField(hintText: appLocale.depthInInches),
            ],
          ),
          actions: [
            ButtonWidget(
              loading: false,
              title: appLocale.addItem,
              onPress: (){
                Navigator.pop(context);
              },
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
