part of 'favorite_list_bloc.dart';

sealed class FavoriteListEvent extends Equatable {
  const FavoriteListEvent();

  @override
  List<Object> get props => [];
}

class GetListsEvent extends FavoriteListEvent {}

class DeleteListEvent extends FavoriteListEvent {
  final String id;

  const DeleteListEvent(this.id);

  @override
  List<Object> get props => [id];
}

class CreateListEvent extends FavoriteListEvent {
  final String title;

  const CreateListEvent(this.title);

  @override
  List<Object> get props => [title];
}

class AddContentToListEvent extends FavoriteListEvent {
  final String id;
  final Content content;

  const AddContentToListEvent({required this.id, required this.content});

  @override
  List<Object> get props => [id, content];
}

class RemoveContentFromListEvent extends FavoriteListEvent {
  final String id;
  final Content content;

  const RemoveContentFromListEvent({required this.id, required this.content});

  @override
  List<Object> get props => [id, content];
}

class EditListNameEvent extends FavoriteListEvent {
  final String id;
  final String newTitle;

  const EditListNameEvent({required this.id, required this.newTitle});

  @override
  List<Object> get props => [id, newTitle];
}

class UpdateCurrentListEvent extends FavoriteListEvent {
  final String id;

  const UpdateCurrentListEvent(this.id);

  @override
  List<Object> get props => [id];
}
