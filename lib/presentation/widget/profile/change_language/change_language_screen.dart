import 'package:driver_app/export.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  @override
  Widget build(BuildContext context) {

    final appLocale = AppLocalizations.of(context)!;

    return BlocProvider<LanguageCubit>(
        create: (context) => LanguageCubit(),
        child: Scaffold(
          appBar: CustomAppBar(title: appLocale.changeLanguage),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: ListTile(
                      onTap: (){
                        context.read<LanguageCubit>().changeLanguage('en');
                      },
                      leading: SvgPicture.asset(AppImages.english),
                      title: AppTextMedium(title: appLocale.english, fontSize: 16.sp, fontWeight: FontWeight.w600,),
                    ),
                  ),
                  10.y,
                  Card(
                    child: ListTile(
                      onTap: (){
                        context.read<LanguageCubit>().changeLanguage('ar');
                      },
                      leading: SvgPicture.asset(AppImages.arabic),
                      title: AppTextMedium(title: appLocale.arabic, fontSize: 16.sp, fontWeight: FontWeight.w600,),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
