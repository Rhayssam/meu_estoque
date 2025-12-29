enum EnvType {
  local('LOCAL')
  ;

  const EnvType(this.label);

  final String label;

  factory EnvType.fromString(String value) {
    return EnvType.values.firstWhere(
      (e) => e.label == value,
      orElse: () => EnvType.local,
    );
  }
}
