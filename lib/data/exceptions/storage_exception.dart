class StorageException implements Exception {
  final String message;

  StorageException({
    required this.message,
  });

  @override
  String toString() {
    return 'StorageException{message=$message}';
  }
}
