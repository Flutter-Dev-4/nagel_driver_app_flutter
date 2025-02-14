import 'package:driver_app/export.dart';

class CardWidget extends StatelessWidget {
  final VoidCallback? onPress;
  final String imagePath;
  final String title;
  const CardWidget(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onPress,
      leading: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
        ),
        child: Center(
          child: SvgPicture.asset(imagePath),
        ),
      ),
      title: AppTextRegular(
        title: title,
        fontSize: 16.sp,
        color: AppColor.primaryBlack,
        fontWeight: FontWeight.w400,
      ),
      trailing:
          Icon(Icons.chevron_right, color: AppColor.primaryBlack, size: 24.sp),
    );
  }
}
