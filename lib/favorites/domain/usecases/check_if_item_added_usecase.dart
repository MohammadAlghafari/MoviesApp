import 'package:movies_app/core/data/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/domain/usecase/base_use_case.dart';
import 'package:movies_app/favorites/domain/repository/favorites_repository.dart';

class CheckIfItemAddedUseCase extends BaseUseCase<int, int> {
  final FavoritesListRepository _favoriteslistRepository;

  CheckIfItemAddedUseCase(this._favoriteslistRepository);
  @override
  Future<Either<Failure, int>> call(int p) async {
    return await _favoriteslistRepository.checkIfItemAdded(p);
  }
}
