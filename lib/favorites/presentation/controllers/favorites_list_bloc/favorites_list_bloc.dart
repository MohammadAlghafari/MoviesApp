import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/domain/entities/media.dart';
import 'package:movies_app/core/domain/usecase/base_use_case.dart';
import 'package:movies_app/favorites/domain/usecases/add_favorite_item_usecase.dart';
import 'package:movies_app/favorites/domain/usecases/check_if_item_added_usecase.dart';
import 'package:movies_app/favorites/domain/usecases/get_favorites_list_items_usecase.dart';
import 'package:movies_app/favorites/domain/usecases/remove_watchlist_item_usecase.dart';

part 'favorites_list_state.dart';
part 'favorites_list_event.dart';

class FavoritesListBloc extends Bloc<FavoritesListEvent, FavoritesListState> {
  FavoritesListBloc(
    this._getFavoritesListItemsUseCase,
    this._addFavoriteListItemUseCase,
    this._removeFavoriteListItemUseCase,
    this._checkIfItemAddedUseCase,
  ) : super(const FavoritesListState()) {
    on<GetFavoritesListItemsEvent>(_getFavoritesListItems);
    on<AddFavoriteListItemEvent>(_addFavoriteListItem);
    on<RemoveFavoriteListItemEvent>(_removeFavoriteListItem);
    on<CheckItemAddedEvent>(_checkItemAdded);
  }

  final GetFavoritesListItemsUseCase _getFavoritesListItemsUseCase;
  final AddFavoriteListItemUseCase _addFavoriteListItemUseCase;
  final RemoveFavoriteListItemUseCase _removeFavoriteListItemUseCase;
  final CheckIfItemAddedUseCase _checkIfItemAddedUseCase;

  Future<void> _getFavoritesListItems(
      FavoritesListEvent event, Emitter<FavoritesListState> emit) async {
    emit(
      const FavoritesListState(
        status: FavoritesListRequestStatus.loading,
      ),
    );
    final result = await _getFavoritesListItemsUseCase.call(const NoParameters());
    result.fold(
      (l) => emit(
        FavoritesListState(
          status: FavoritesListRequestStatus.error,
          message: l.message,
        ),
      ),
      (r) {
        if (r.isEmpty) {
          emit(
            const FavoritesListState(
              status: FavoritesListRequestStatus.empty,
            ),
          );
        } else {
          emit(
            FavoritesListState(
              status: FavoritesListRequestStatus.loaded,
              items: r,
            ),
          );
        }
      },
    );
  }

  Future<void> _addFavoriteListItem(
      AddFavoriteListItemEvent event, Emitter<FavoritesListState> emit) async {
    emit(
      const FavoritesListState(
        status: FavoritesListRequestStatus.loading,
      ),
    );
    final result = await _addFavoriteListItemUseCase.call(event.media);
    result.fold(
      (l) => emit(
        FavoritesListState(
          status: FavoritesListRequestStatus.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        FavoritesListState(
          status: FavoritesListRequestStatus.itemAdded,
          id: r,
        ),
      ),
    );
  }

  Future<void> _removeFavoriteListItem(
      RemoveFavoriteListItemEvent event, Emitter<FavoritesListState> emit) async {
    emit(
      const FavoritesListState(
        status: FavoritesListRequestStatus.loading,
      ),
    );
    final result = await _removeFavoriteListItemUseCase.call(event.index);
    result.fold(
      (l) => emit(
        FavoritesListState(
          status: FavoritesListRequestStatus.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        const FavoritesListState(
          status: FavoritesListRequestStatus.itemRemoved,
        ),
      ),
    );
  }

  FutureOr<void> _checkItemAdded(
      CheckItemAddedEvent event, Emitter<FavoritesListState> emit) async {
    emit(
      const FavoritesListState(
        status: FavoritesListRequestStatus.loading,
      ),
    );
    final result = await _checkIfItemAddedUseCase.call(event.tmdbId);
    result.fold(
      (l) => emit(
        FavoritesListState(
          status: FavoritesListRequestStatus.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        FavoritesListState(
          status: FavoritesListRequestStatus.isItemAdded,
          id: r,
        ),
      ),
    );
  }
}
