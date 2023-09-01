
extension CamelCaseFormatting on String {
  String toCamelCaseString() {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  }
}