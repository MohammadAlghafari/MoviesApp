import 'package:flutter/material.dart';
import 'package:movies_app/core/data/network/api_constants.dart';
import 'package:movies_app/core/resources/app_colors.dart';
import 'package:movies_app/core/resources/app_values.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Mohammad',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                'Bring popcorn, it\'s a movie time',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Scaffold.of(context).openEndDrawer(),
            child: const CircleAvatar(
              backgroundColor: AppColors.primary,
              foregroundImage: NetworkImage(ApiConstants.castPlaceHolder),
            ),
          ),
        ],
      ),
    );
  }
}
