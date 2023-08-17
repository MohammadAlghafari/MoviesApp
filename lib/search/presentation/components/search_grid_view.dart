import 'package:flutter/material.dart';
import 'package:movies_app/core/presentation/components/animation_list.dart';
import 'package:movies_app/core/resources/app_values.dart';
import 'package:movies_app/search/domain/entities/search_result_item.dart';
import 'package:movies_app/search/presentation/components/grid_view_card.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({
    super.key,
    required this.results,
  });

  final List<SearchResultItem> results;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
        itemCount: results.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          childAspectRatio: 0.55,
        ),
        itemBuilder: (context, index) {
          return AnimationListWidget(
              isVertical: true,
              index: index,
              child: GridViewCard(item: results[index]));
        },
      ),
    );
  }
}
