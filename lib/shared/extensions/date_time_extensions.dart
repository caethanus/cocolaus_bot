extension DateTimeExtensions on DateTime {
  DateTime proximaSexta() {
    const sexta = DateTime.friday;
    final diasAteSexta = (sexta - weekday) % 7;
    final data = add(Duration(days: diasAteSexta));
    return DateTime(data.year, data.month, data.day);
  }
}
