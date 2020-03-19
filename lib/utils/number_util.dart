class NumberUtils {
  static double doubleParse(dynamic value) {
    if (value == null) return null;
    return double.tryParse(value) ?? null;
  }
}
