/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class ApiException extends _i1.SerializableEntity
    implements _i1.SerializableException {
  ApiException({
    required this.message,
    required this.status,
    required this.type,
    this.stacktrace,
    this.exception,
  });

  factory ApiException.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ApiException(
      message: serializationManager
          .deserialize<String>(jsonSerialization['message']),
      status:
          serializationManager.deserialize<int>(jsonSerialization['status']),
      type: serializationManager
          .deserialize<_i2.ErrorType>(jsonSerialization['type']),
      stacktrace: serializationManager
          .deserialize<String?>(jsonSerialization['stacktrace']),
      exception: serializationManager
          .deserialize<String?>(jsonSerialization['exception']),
    );
  }

  String message;

  int status;

  _i2.ErrorType type;

  String? stacktrace;

  String? exception;

  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'type': type,
      'stacktrace': stacktrace,
      'exception': exception,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'message': message,
      'status': status,
      'type': type,
      'stacktrace': stacktrace,
      'exception': exception,
    };
  }
}
