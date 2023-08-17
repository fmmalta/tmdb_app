// ignore_for_file: annotate_overrides, overridden_fields

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final Map<String, dynamic>? details;

  const Failure({this.details});

  String? message() {
    if (details != null) {
      switch (details!['status_code']) {
        case 30:
          return 'Erro de autenticação. Revise seus dados';
        default:
          return null;
      }
    } else {
      return null;
    }
  }

  @override
  List<Object?> get props => [details];
}

class APIFailure extends Failure {
  final Map<String, dynamic> details;

  const APIFailure(this.details) : super(details: details);

  const factory APIFailure.invalidUser(Map<String, dynamic> details) =
      InvalidUserFailure;
}

class InvalidUserFailure extends APIFailure {
  final Map<String, dynamic> details;

  const InvalidUserFailure(this.details) : super(details);
}

class NoConnectionFailure extends Failure {
  const NoConnectionFailure();
}

class StoreContentFailure extends Failure {
  const StoreContentFailure();
}
