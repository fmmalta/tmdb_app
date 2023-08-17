import 'package:equatable/equatable.dart';

class SessionEntity extends Equatable {
  final String? requestToken;
  final DateTime? expiresAt;

  const SessionEntity({required this.requestToken, required this.expiresAt});

  @override
  List<Object?> get props => [requestToken, expiresAt];
}
