part of 'favorites_list_bloc.dart';

enum FavoritesListRequestStatus {
  empty,
  loading,
  loaded,
  error,
  itemAdded,
  itemRemoved,
  isItemAdded,
}

class FavoritesListState extends Equatable {
  const FavoritesListState({
    this.id,
    this.items = const [],
    this.status = FavoritesListRequestStatus.loading,
    this.message = '',
  });

  final int? id;
  final List<Media> items;
  final FavoritesListRequestStatus status;
  final String message;

  FavoritesListState copyWith({
    int? id,
    List<Media>? items,
    FavoritesListRequestStatus? status,
    String? message,
  }) {
    return FavoritesListState(
      id: id ?? this.id,
      items: items ?? this.items,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        id,
        items,
        status,
        message,
      ];
}
