import 'package:driver_app/export.dart';

class CustomTextField extends StatelessWidget {

  final String hintText;

  const CustomTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColor.grey,
            fontFamily: 'SFPRODISPLAYREGULAR',
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius:  BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                  color: AppColor.lightRed
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius:  BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                  color: AppColor.lightRed
              )
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColor.lightRed
              )
          ),
        ),
      ),
    );
  }
}
