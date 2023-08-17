import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/cast.dart';

// ignore: must_be_immutable
class MediaDetails extends Equatable {
  int? id;
  final int tmdbID;
  final String title;
  final String posterUrl;
  final String backdropUrl;
  final String releaseDate;
  final String genres;
  final String? runtime;
  final int? numberOfSeasons;
  final String overview;
  final double voteAverage;
  final String voteCount;
  final String trailerUrl;
  final List<Cast>? cast;
  bool isAdded;

  MediaDetails({
    this.id,
    required this.tmdbID,
    required this.title,
    required this.posterUrl,
    required this.backdropUrl,
    required this.releaseDate,
    required this.genres,
    this.runtime,
    this.numberOfSeasons,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.trailerUrl,
    this.cast,
    this.isAdded = false,
  });

  @override
  List<Object?> get props => [
        id,
        tmdbID,
        title,
        posterUrl,
        backdropUrl,
        releaseDate,
        genres,
        overview,
        voteAverage,
        voteCount,
        trailerUrl,
        isAdded,
      ];
}
