import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/domain/entities/media.dart';
import 'package:movies_app/core/presentation/components/animation_list.dart';
import 'package:movies_app/core/presentation/components/custom_app_bar.dart';
import 'package:movies_app/core/presentation/components/error_screen.dart';
import 'package:movies_app/core/presentation/components/loading_indicator.dart';
import 'package:movies_app/core/presentation/components/vertical_listview_card.dart';
import 'package:movies_app/core/resources/app_strings.dart';
import 'package:movies_app/core/resources/app_values.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/favorites/presentation/components/empty_favorites_list_text.dart';
import 'package:movies_app/favorites/presentation/controllers/favorites_list_bloc/favorites_list_bloc.dart';

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<FavoritesListBloc>()..add(GetFavoritesListItemsEvent()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.favorites,
        ),
        body: BlocBuilder<FavoritesListBloc, FavoritesListState>(
          builder: (context, state) {
            if (state.status == FavoritesListRequestStatus.loading) {
              return const LoadingIndicator();
            } else if (state.status == FavoritesListRequestStatus.loaded) {
              return FavoriteListWidget(items: state.items);
            } else if (state.status == FavoritesListRequestStatus.empty) {
              return const EmptyFavoritesListText();
            } else {
              return ErrorScreen(
                onTryAgainPressed: () {
                  context
                      .read<FavoritesListBloc>()
                      .add(GetFavoritesListItemsEvent());
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class FavoriteListWidget extends StatelessWidget {
  const FavoriteListWidget({
    super.key,
    required this.items,
  });

  final List<Media> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p12,
        vertical: AppPadding.p6,
      ),
      itemBuilder: (context, index) {
        return AnimationListWidget(
            isVertical: true,
            index: index,
            child: VerticalListViewCard(media: items[index]));
      },
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSize.s10),
    );
  }
}
