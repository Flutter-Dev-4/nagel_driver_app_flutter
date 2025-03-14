import 'package:driver_app/presentation/widget/auth/login/controller/login_cubit.dart';
import 'package:driver_app/presentation/widget/order_detail/controller/order_detail_cubit.dart';
import 'package:driver_app/presentation/widget/profile/change_language/controller/change_language_cubit.dart';
import 'package:driver_app/presentation/widget/profile/controller/get_profile_cubit.dart';
import 'package:driver_app/presentation/widget/profile/edit_profile/controller/update_profile_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> appProviders = [
  BlocProvider<LanguageCubit>(create: (context) => LanguageCubit()),
  BlocProvider<OrderDetailCubit>(create: (context) => OrderDetailCubit()),
  BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
  BlocProvider<GetProfileCubit>(create: (context) => GetProfileCubit()),
  BlocProvider<UpdateProfileCubit>(create: (context) => UpdateProfileCubit()),
];