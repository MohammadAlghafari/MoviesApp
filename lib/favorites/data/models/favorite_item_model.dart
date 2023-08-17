import 'package:movies_app/core/domain/entities/media.dart';

class FavoritelistItemModel extends Media {
  const FavoritelistItemModel({
    required super.tmdbID,
    required super.title,
    required super.releaseDate,
    required super.voteAverage,
    required super.posterUrl,
    required super.backdropUrl,
    required super.overview,
    required super.isMovie,
  });

  factory FavoritelistItemModel.fromEntity(Media media) {
    return FavoritelistItemModel(
      tmdbID: media.tmdbID,
      title: media.title,
      releaseDate: media.releaseDate,
      voteAverage: media.voteAverage,
      posterUrl: media.posterUrl,
      backdropUrl: media.backdropUrl,
      overview: media.overview,
      isMovie: media.isMovie,
    );
  }
}
