import 'package:driver_app/export.dart';

class PrefixTextField extends StatelessWidget {

  final bool obscureText;
  final String svgPath;
  final String hintText;
  final TextInputType? keyboardType;

  const PrefixTextField({super.key, required this.obscureText, required this.svgPath, required this.hintText, this.keyboardType});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: TextFormField(
        obscureText: obscureText,
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
