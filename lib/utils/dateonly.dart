class DateOnly {
  final int year;
  final int month;
  final int day;

  DateOnly(this.year, this.month, this.day);

  /// String'den DateOnly oluşturma
  factory DateOnly.parse(String dateString) {
    final parts = dateString.split('-');
    if (parts.length != 3) {
      throw const FormatException("Invalid date format, expected MM-DD-YYYY");
    }

    final month = int.parse(parts[0]);
    final day = int.parse(parts[1]);
    final year = int.parse(parts[2]);

    return DateOnly(year, month, day);
  }

  @override
  String toString() {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }

  DateTime toDateTime() {
    return DateTime(year, month, day);
  }

  static DateOnly now() {
    final now = DateTime.now();
    return DateOnly(now.year, now.month, now.day);
  }
}