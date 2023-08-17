part of 'favorites_list_bloc.dart';

abstract class FavoritesListEvent extends Equatable {
  const FavoritesListEvent();
}

class GetFavoritesListItemsEvent extends FavoritesListEvent {
  @override
  List<Object?> get props => [];
}

class AddFavoriteListItemEvent extends FavoritesListEvent {
  final Media media;

  const AddFavoriteListItemEvent({
    required this.media,
  });

  @override
  List<Object?> get props => [media];
}

class RemoveFavoriteListItemEvent extends FavoritesListEvent {
  final int index;

  const RemoveFavoriteListItemEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class CheckItemAddedEvent extends FavoritesListEvent {
  final int tmdbId;

  const CheckItemAddedEvent({
    required this.tmdbId,
  });

  @override
  List<Object?> get props => [tmdbId];
}
