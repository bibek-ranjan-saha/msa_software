import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/theme/theme_cubit.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: true);
    return IconButton(
      onPressed: () {
        theme.changeTheme();
      },
      icon: Icon(
        Theme.of(context).brightness == Brightness.dark
            ? Icons.light_mode_rounded
            : Icons.dark_mode_rounded,
      ),
    );
  }
}
