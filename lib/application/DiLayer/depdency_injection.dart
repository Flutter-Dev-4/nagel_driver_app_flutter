import 'package:driver_app/application/services/ApiServices/api_services.dart';
import 'package:driver_app/presentation/widget/auth/login/controller/login_cubit.dart';
import 'package:driver_app/presentation/widget/home/controller/my_orders_cubit.dart';
import 'package:driver_app/presentation/widget/profile/change_password/controller/change_password_cubit.dart';
import 'package:driver_app/presentation/widget/profile/controller/get_profile_cubit.dart';
import 'package:driver_app/presentation/widget/profile/edit_profile/controller/update_profile_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

class Dependencies {
  void initDependency() {

    locator.registerLazySingleton<ApiServices>(() => ApiServices());

    locator.registerLazySingleton<LoginCubit>(() => LoginCubit());

    locator.registerLazySingleton<GetProfileCubit>(() => GetProfileCubit());

    locator.registerLazySingleton<UpdateProfileCubit>(() => UpdateProfileCubit());

    locator.registerLazySingleton<ChangePasswordCubit>(() => ChangePasswordCubit());

    locator.registerLazySingleton<MyOrdersCubit>(() => MyOrdersCubit());


  }

}
