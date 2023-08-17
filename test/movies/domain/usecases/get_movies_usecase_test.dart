import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_app/core/data/error/failure.dart';
import 'package:movies_app/core/domain/usecase/base_use_case.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/domain/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movies_usecase.dart';

class MockMoviesRepository extends Mock implements MoviesRepository {}

void main() {
  late MockMoviesRepository? mockMoviesRepositoryImpl;
  late GetMoviesUseCase? getMoviesUseCase;

  setUp(() {
    mockMoviesRepositoryImpl = MockMoviesRepository();
    getMoviesUseCase = GetMoviesUseCase(mockMoviesRepositoryImpl!);
  });

  final tMoviesResponse = [
    const [
      MovieModel(
          tmdbID: 1,
          title: 'movie 1',
          posterUrl: 'posterUrl',
          backdropUrl: 'backdropUrl',
          voteAverage: 3.4,
          releaseDate: '2022/10/5',
          overview: 'new movie with great actors',
          isMovie: true),
      MovieModel(
          tmdbID: 2,
          title: 'movie 2',
          posterUrl: 'posterUrl',
          backdropUrl: 'backdropUrl',
          voteAverage: 3.4,
          releaseDate: '2022/10/5',
          overview: 'new movie with great actors',
          isMovie: true),
    ],
    const [
      MovieModel(
          tmdbID: 3,
          title: 'movie 3',
          posterUrl: 'posterUrl',
          backdropUrl: 'backdropUrl',
          voteAverage: 3.4,
          releaseDate: '2022/10/5',
          overview: 'new movie with great actors',
          isMovie: true),
      MovieModel(
          tmdbID: 4,
          title: 'movie 4',
          posterUrl: 'posterUrl',
          backdropUrl: 'backdropUrl',
          voteAverage: 3.4,
          releaseDate: '2022/10/5',
          overview: 'new movie with great actors',
          isMovie: true),
    ],
    const [
      MovieModel(
          tmdbID: 5,
          title: 'movie 5',
          posterUrl: 'posterUrl',
          backdropUrl: 'backdropUrl',
          voteAverage: 3.4,
          releaseDate: '2022/10/5',
          overview: 'new movie with great actors',
          isMovie: true),
      MovieModel(
          tmdbID: 6,
          title: 'movie 6',
          posterUrl: 'posterUrl',
          backdropUrl: 'backdropUrl',
          voteAverage: 3.4,
          releaseDate: '2022/10/5',
          overview: 'new movie with great actors',
          isMovie: true),
    ]
  ];

  const ServerFailure tErrorResponse = ServerFailure('Something went wrong');

  test(
    'should return List of List of Media model response when calling get movies',
    () async {
      // Arrange
      when(
        () => mockMoviesRepositoryImpl!.getMovies(),
      ).thenAnswer((invocation) async => Right(tMoviesResponse));
      // Act
      final result = await getMoviesUseCase!(const NoParameters());
      // Assert
      expect(result, Right(tMoviesResponse));
      verify(
        () => mockMoviesRepositoryImpl!.getMovies(),
      );
      verifyNoMoreInteractions(mockMoviesRepositoryImpl);
    },
  );
  test(
    'should return error calling get Movies',
    () async {
      // Arrange
      when(
        () => mockMoviesRepositoryImpl!.getMovies(),
      ).thenAnswer(((invocation) async => const Left(tErrorResponse)));
      // Act
      final result = await getMoviesUseCase!(const NoParameters());
      // Assert
      expect(result, const Left(tErrorResponse));
      verify(
        () => mockMoviesRepositoryImpl!.getMovies(),
      );
      verifyNoMoreInteractions(mockMoviesRepositoryImpl);
    },
  );
}
