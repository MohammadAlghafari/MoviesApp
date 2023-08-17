import 'package:dartz/dartz.dart';
import 'package:movies_app/core/data/error/failure.dart';
import 'package:movies_app/core/domain/usecase/base_use_case.dart';

import 'package:movies_app/favorites/domain/repository/favorites_repository.dart';

class RemoveFavoriteListItemUseCase extends BaseUseCase<Unit, int> {
  final FavoritesListRepository _baseFavoritesListRepository;

  RemoveFavoriteListItemUseCase(this._baseFavoritesListRepository);

  @override
  Future<Either<Failure, Unit>> call(int p) async {
    return await _baseFavoritesListRepository.removeFavoriteListItem(p);
  }
}
