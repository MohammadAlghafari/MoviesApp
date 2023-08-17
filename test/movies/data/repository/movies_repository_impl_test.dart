import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_app/core/data/error/exceptions.dart';
import 'package:movies_app/core/data/error/failure.dart';
import 'package:movies_app/core/data/network/error_message_model.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/repository/movies_repository_impl.dart';

class MockMoviesRemoteDataSource extends Mock
    implements MoviesRemoteDataSource {}

void main() {
  late MockMoviesRemoteDataSource? mockMoviesRemoteDataSource;
  late MoviesRepositoryImpl? moviesRepositoryImpl;

  setUp(() {
    mockMoviesRemoteDataSource = MockMoviesRemoteDataSource();
    moviesRepositoryImpl = MoviesRepositoryImpl(mockMoviesRemoteDataSource!);
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

  const ServerException tErrorResponse = ServerException(
      errorMessageModel: ErrorMessageModel(
          statusCode: 500,
          statusMessage: 'Something went wrong',
          success: false));

  test(
    'get movies should return list of list of movies',
    () async {
      // Arrange
      when(() => mockMoviesRemoteDataSource!.getMovies())
          .thenAnswer((_) async => tMoviesResponse);
      // Act
      final result = await moviesRepositoryImpl!.getMovies();
      // Assert
      expect(result, Right(tMoviesResponse));
      verify(() => mockMoviesRemoteDataSource!.getMovies());
      verifyNoMoreInteractions(mockMoviesRemoteDataSource);
    },
  );
  test(
    'get movies should return error form get movies api',
    () async {
      // Arrange
      when(() => mockMoviesRemoteDataSource!.getMovies())
          .thenThrow(tErrorResponse);
      // Act
      final result = await moviesRepositoryImpl!.getMovies();
      // Assert
      expect(result, Left(ServerFailure(tErrorResponse.errorMessageModel.statusMessage)));
      verify(() => mockMoviesRemoteDataSource!.getMovies());
      verifyNoMoreInteractions(mockMoviesRemoteDataSource);
    },
  );
}
