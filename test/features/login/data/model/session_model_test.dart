import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/features/login/data/models/session_model.dart';

import 'package:movie_app/features/login/domain/entities/session_entity.dart';

void main() {
  group('SessionModel', () {
    const tRequestToken = 'a0d41e219eb24e63f14a2ba65d87331d61dcfeec';
    final tExpiresAt = DateTime.now();

    test('should be a subclass of SessionEntity', () {
      // assert
      expect(
          SessionModel(
            requestToken: tRequestToken,
            expiresAt: tExpiresAt,
          ),
          isA<SessionEntity>());
    });

    test('should convert to and from a JSON map', () {
      // act
      final sessionModel = SessionModel(
        requestToken: tRequestToken,
        expiresAt: tExpiresAt,
      );
      final json = sessionModel.toJson();
      final sessionModelFromJson = SessionModel.fromJson(json);

      // assert
      expect(sessionModelFromJson, equals(sessionModel));
    });
  });
}
