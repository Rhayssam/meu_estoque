import 'dart:developer';
import 'package:flutter/foundation.dart';

class Logger {
  void _log(
    String message, {
    String name = 'log',
    Object? error,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    if (kReleaseMode) return;

    log(message, name: name, error: error, stackTrace: stackTrace, time: time);
  }

  void info(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    _log(message, name: 'info', error: error, stackTrace: stackTrace, time: time);
  }

  void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    _log(message, name: 'error', error: error, stackTrace: stackTrace, time: time);
  }

  void warning(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    _log(message, name: 'warning', error: error, stackTrace: stackTrace, time: time);
  }
}
