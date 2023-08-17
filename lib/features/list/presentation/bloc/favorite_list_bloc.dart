import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/detail/domain/entities/content_interface.dart';
import 'package:movie_app/features/list/domain/entities/favorite_list_entity.dart';
import 'package:movie_app/features/list/domain/usecases/add_content_to_list_use_case.dart';
import 'package:movie_app/features/list/domain/usecases/create_favorite_list_use_case.dart';
import 'package:movie_app/features/list/domain/usecases/delete_favorite_list_use_case.dart';
import 'package:movie_app/features/list/domain/usecases/edit_list_name_use_case.dart';
import 'package:movie_app/features/list/domain/usecases/get_favorites_list_use_case.dart';
import 'package:movie_app/features/list/domain/usecases/remove_content_from_list_use_case.dart';
import 'package:movie_app/service_locator.dart';

part 'favorite_list_event.dart';
part 'favorite_list_state.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvent, FavoriteListState> {
  final _createFavoriteList = sl.get<CreateFavoriteListUseCase>();
  final _getFavoritesList = sl.get<GetFavoritesListUseCase>();
  final _deleteFavoritList = sl.get<DeleteFavoriteListUseCase>();
  final _addContentToListUseCase = sl.get<AddContentToListUseCase>();
  final _removeContentFromListUseCase = sl.get<RemoveContentFromListUseCase>();
  final _editListNameUseCase = sl.get<EditListNameUseCase>();

  FavoriteListBloc() : super(FavoriteListInitial()) {
    on<CreateListEvent>(_createList);
    on<DeleteListEvent>(_deleteList);
    on<GetListsEvent>(_getList);
    on<AddContentToListEvent>(_addContentToList);
    on<RemoveContentFromListEvent>(_removeContentFromList);
    on<EditListNameEvent>((event, emit) async {
      _editListName(event, emit);
    });
    on<UpdateCurrentListEvent>(_getOneList);
  }

  Future<void> _createList(CreateListEvent event, Emitter emit) async {
    emit(FavoriteListLoading());
    final newList = await _createFavoriteList(event.title);
    newList.fold((l) {}, (r) async {
      add(GetListsEvent());
    });
  }

  Future<void> _deleteList(DeleteListEvent event, Emitter emit) async {
    emit(FavoriteListLoading());
    await _deleteFavoritList(event.id);
    add(GetListsEvent());
  }

  Future<void> _getList(GetListsEvent event, Emitter emit) async {
    emit(FavoriteListLoading());
    final list = await _getFavoritesList();
    list.fold((l) {}, (r) => emit(FavoriteListLoaded(r)));
  }

  Future<void> _addContentToList(
    AddContentToListEvent event,
    Emitter<FavoriteListState> emit,
  ) async {
    await _addContentToListUseCase(event.id, event.content);
  }

  Future<void> _removeContentFromList(
    RemoveContentFromListEvent event,
    Emitter<FavoriteListState> emit,
  ) async {
    final removed = await _removeContentFromListUseCase(
      event.id,
      event.content,
    );
    removed.fold((l) {}, (r) => add(GetListsEvent()));
  }

  Future<void> _editListName(
    EditListNameEvent event,
    Emitter<FavoriteListState> emit,
  ) async {
    final result = await _editListNameUseCase(
      id: event.id,
      newTitle: event.newTitle,
    );
    result.fold((l) => null, (r) async {
      add(UpdateCurrentListEvent(event.id));
    });
  }

  Future<void> _getOneList(
    UpdateCurrentListEvent event,
    Emitter emit,
  ) async {
    final list = await _getFavoritesList();
    late FavoriteListItemEntity item;
    list.fold((l) {}, (contents) {
      item = contents.listContent.firstWhere(
        (content) => content.uuid == event.id,
      );
    });
    emit(UpdateCurrentList(FavoriteListEntity(listContent: [item])));
  }
}
