
extension CamelCaseFormatting on String {
  String toCamelCaseString() {
      return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";

  }
}