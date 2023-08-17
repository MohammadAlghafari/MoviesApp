import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/resources/app_theme.dart';
import 'package:movies_app/core/resources/app_values.dart';

import 'package:movies_app/core/data/network/api_constants.dart';
import 'package:movies_app/core/resources/app_colors.dart';
import 'package:movies_app/movies/presentation/controllers/theme_bloc/theme_bloc.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(
                height: AppSize.s100,
              ),
              const CircleAvatar(
                radius: AppSize.s45,
                backgroundColor: AppColors.primary,
                foregroundImage: NetworkImage(ApiConstants.castPlaceHolder),
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Text(
                'Mohammad',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: AppSize.s50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.appTheme == AppTheme.darkTheme
                        ? 'Dark Theme'
                        : 'Light Theme',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    width: AppSize.s10,
                  ),
                  Switch(
                    activeColor: AppColors.primary,
                      value: state.appTheme == AppTheme.darkTheme,
                      onChanged: (value) {
                       context.read<ThemeBloc>().add(ThemeChanged(
                          theme:
                              value ? AppTheme.darkTheme : AppTheme.lightTheme,
                        ));
                      }),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
