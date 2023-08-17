import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/login/domain/entities/session_entity.dart';
import 'package:movie_app/features/login/domain/usecases/create_session_use_case.dart';
import 'package:movie_app/features/login/domain/usecases/request_token_use_case.dart';
import 'package:movie_app/features/login/domain/usecases/store_token_use_case.dart';
import 'package:movie_app/features/login/presentation/bloc/login_event.dart';
import 'package:movie_app/service_locator.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final requestTokenUseCaseUseCase = sl<RequestTokenUseCase>();
  final createSessionUseCase = sl<CreateSessionUseCase>();
  final storeTokenUseCase = sl<StoreTokenUseCase>();

  String _emailText = "";
  String _passwordText = "";

  set email(String value) => _emailText = value;
  set password(String value) => _passwordText = value;

  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<StoreTokenEvent>(_onStoreTokenEvent);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    final result = await requestTokenUseCaseUseCase();
    await result.fold((failure) {
      emit(LoginFailure(failure));
    }, (token) async {
      final session = await _createSession(_emailText, _passwordText, token);
      session.fold((error) {
        emit(LoginFailure(error));
      }, (session) async {
        add(StoreTokenEvent(session));
      });
    });
  }

  Future<Either<Failure, SessionEntity>> _createSession(
    String username,
    String password,
    String token,
  ) async {
    return await createSessionUseCase(
      username: username,
      password: password,
      requestToken: token,
    );
  }

  Future<void> _onStoreTokenEvent(event, emit) async {
    final stored =
        await storeTokenUseCase.storeToken(event.session.requestToken!);
    await stored.fold((left) {}, (right) async {
      emit(LoginSuccess());
    });
  }
}
