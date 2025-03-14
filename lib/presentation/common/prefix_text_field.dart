import 'package:driver_app/export.dart';

class PrefixTextField extends StatelessWidget {

  final bool obscureText;
  final String svgPath;
  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;


  const PrefixTextField({super.key, required this.obscureText, required this.svgPath, required this.hintText, this.keyboardType, required this.controller, this.validator});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      obscuringCharacter: '*',
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.grey,
          fontFamily: 'SFPRODISPLAYREGULAR',
        ),
        prefixIcon: SizedBox(
          width: 20.w, height: 20.h,
          child: Center(child: SvgPicture.asset(svgPath,),),),
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
        errorBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(10.r),
            borderSide: const BorderSide(
                color: AppColor.lightRed
            )
        ),
        border: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(10.r),
            borderSide: const BorderSide(
                color: AppColor.lightRed
            )
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(10.r),
            borderSide: const BorderSide(
                color: AppColor.lightRed
            )
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(10.r),
            borderSide: const BorderSide(
                color: AppColor.lightRed
            )
        ),
      ),
    );
  }
}
