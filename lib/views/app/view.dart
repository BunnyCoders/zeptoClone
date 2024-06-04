
import 'package:zepto_clone/core/router.dart';
import 'package:zepto_clone/global_blocs/internet_connectivity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepto_clone/views/splash/view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetConnectivityBloc(),
      child: ScreenUtilInit(
        designSize: const Size(410, 889),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashView(),
          onGenerateRoute: AppRouter.generateRoute,
          title: 'Zepto Clone',
          theme: ThemeData(),
        ),
      ),
    );
  }
}
