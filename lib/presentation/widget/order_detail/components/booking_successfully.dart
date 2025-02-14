import 'package:driver_app/export.dart';

class BookingSuccessfully extends StatelessWidget {
  const BookingSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;

    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: AppColor.white,
          title: SvgPicture.asset(AppImages.success),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HeadingText(
                title: appLocale.bookingSuccessfullyDelivered,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.primaryBlack,
                textAlign: TextAlign.center,
              ),
              10.y,
              AppTextRegular(
                title: appLocale.congratulationYourBooking,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.primaryBlack,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
