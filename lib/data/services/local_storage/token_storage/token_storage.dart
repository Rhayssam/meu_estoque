import 'package:result_dart/result_dart.dart';

abstract interface class TokenStorage {
  AsyncResult<void> store(String token);
  AsyncResult<String> get();
  AsyncResult<void> clear();
}
