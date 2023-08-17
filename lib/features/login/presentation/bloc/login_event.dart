import 'package:equatable/equatable.dart';
import 'package:movie_app/features/login/domain/entities/session_entity.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LoginButtonPressed extends LoginEvent {}

final class StoreTokenEvent extends LoginEvent {
  final SessionEntity session;

  StoreTokenEvent(this.session);

  @override
  List<Object?> get props => [session];
}
