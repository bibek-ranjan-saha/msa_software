import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msa_software/utils/msa_router.dart';

import '../blocs/theme/theme_cubit.dart';
import '../constants/app_keys.dart';

class MyApp extends StatelessWidget {
  final String suffix;
  const MyApp({super.key, required this.suffix});

  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: true);
    return MaterialApp.router(
      key: snackBarKey,
      themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'MSA Software test by bibek $suffix',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true)
          .copyWith(primaryColor: Colors.blue),
      routerConfig: MSASoftwareRouter.router,
    );
  }
}
