import 'package:movies_app/core/data/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/domain/entities/media.dart';
import 'package:movies_app/core/domain/usecase/base_use_case.dart';
import 'package:movies_app/favorites/domain/repository/favorites_repository.dart';

class GetFavoritesListItemsUseCase extends BaseUseCase<List<Media>, NoParameters> {
  final FavoritesListRepository _baseFaoritesListRepository;

  GetFavoritesListItemsUseCase(this._baseFaoritesListRepository);

  @override
  Future<Either<Failure, List<Media>>> call(NoParameters p) async {
    return await _baseFaoritesListRepository.getFavoritesListItems();
  }
}
