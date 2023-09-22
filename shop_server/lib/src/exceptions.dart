import 'package:shop_server/src/generated/protocol.dart';

class UnAuthorizedException extends ApiException {
  UnAuthorizedException([Exception? e, StackTrace? stackTrace])
      : super(
          message: 'User needs to be logged in first',
          type: ErrorType.client,
          status: 401,
          exception: e?.toString(),
          stacktrace: stackTrace?.toString(),
        );
}

class AccessDeniedException extends ApiException {
  AccessDeniedException([Exception? e, StackTrace? stackTrace])
      : super(
          message: 'User does not have access',
          type: ErrorType.client,
          status: 403,
          exception: e?.toString(),
          stacktrace: stackTrace?.toString(),
        );
}
