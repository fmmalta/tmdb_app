// ignore_for_file: overridden_fields

import 'package:movie_app/core/exceptions.dart';
import 'package:movie_app/features/login/domain/entities/session_entity.dart';

class SessionModel extends SessionEntity {
  @override
  final String requestToken;
  @override
  final DateTime expiresAt;

  const SessionModel({
    required this.requestToken,
    required this.expiresAt,
  }) : super(
          requestToken: requestToken,
          expiresAt: expiresAt,
        );

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    String? expiresAt;
    if (json['expires_at'] != null) {
      expiresAt = (json['expires_at'] as String)
          .replaceAll(" UTC", "")
          .replaceAll(" ", "T");
    } else {
      throw InvalidParameter("expires_at is null");
    }
    return SessionModel(
      requestToken: json['request_token'],
      expiresAt: DateTime.parse(expiresAt),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'request_token': requestToken,
      'expires_at': expiresAt.toIso8601String(),
    };
  }

  SessionEntity toEntity() {
    return SessionEntity(
      requestToken: requestToken,
      expiresAt: expiresAt,
    );
  }
}
