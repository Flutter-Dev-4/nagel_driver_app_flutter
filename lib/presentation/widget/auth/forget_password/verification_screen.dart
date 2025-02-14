import 'package:driver_app/export.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  bool isResendEnabled = false;
  int countdown = 60;
  Timer? timer;

  void startTimer() {
    setState(() {
      isResendEnabled = false;
      countdown = 59; // Set countdown to 60 seconds
    });

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          isResendEnabled = true;
          timer.cancel(); // Stop the timer
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {

    final appLocale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.y,
                HeadingText(
                  title: appLocale.verifyOTP,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primaryBlack,
                ),
                10.y,
                AppTextRegular(
                  title: appLocale.weHaveSentYouOTP,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryBlack,
                ),
                20.y,
                PinCodeTextField(
                  appContext: (context),
                  keyboardType: TextInputType.number,
                  length: 4,
                  textStyle: TextStyle(
                    fontFamily: 'SFPRODISPLAY',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.grey,
                  ),
                  cursorColor: Colors.black26,
                  errorTextMargin: EdgeInsets.only(top: 35.h),
                  errorTextSpace: 40,
                  validator: (v) {
                    if (v!.length < 4) {
                      return appLocale.notCorrect;
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10.r),
                    fieldHeight: 65.h,
                    fieldWidth: 65.w,
                    activeColor: AppColor.lightRed,
                    activeFillColor: AppColor.lightRed,
                    selectedFillColor: AppColor.lightRed,
                    selectedColor: AppColor.lightRed,
                    inactiveFillColor: AppColor.lightRed,
                    inactiveColor: AppColor.lightRed,
                    activeBorderWidth: 2.w,
                    inactiveBorderWidth: 2.w,
                    selectedBorderWidth: 2.w,
                  ),
                ),
                AppTextRegular(
                  title: '${appLocale.resendCodeIn}$countdown',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryBlack,
                ),
                20.y,
                ButtonWidget(
                  loading: false,
                  title: appLocale.verifyOTP,
                  onPress: () {
                    Navigator.pushNamed(context, RoutesNames.new_password);
                  },
                  buttonColor: AppColor.red,
                  textColor: AppColor.white,
                ),
                40.y,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppTextRegular(
                      title: appLocale.noReceived,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.primaryBlack,
                    ),
                    InkWell(
                      onTap: () {},
                      child: AppTextRegular(
                        title: appLocale.resend,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primaryBlack,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
