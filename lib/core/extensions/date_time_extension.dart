import 'package:intl/intl.dart';

extension StringDateTimeExtension on String {
  String formatDate() {
    return DateFormat('dd-MM-yyyy').format(DateTime.parse(this));
  }

  String formatDateTimeDMH() {
    return DateFormat('d MMM hh:mm a').format(DateTime.parse(this));
  }

  String formatDoubleToHours() {
    double totalHours = double.parse(this);
    int hours = totalHours.floor();
    int minutes = ((totalHours - hours) * 60).round();
    return '$hours h $minutes m';
  }
}

extension DateTimeExtension on DateTime {
  String formatDate() {
    return DateFormat('dd-MM-yyyy').format(this);
  }

  String formatDateYMD() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String formatTimeHM() {
    return DateFormat('HH:mm').format(this);
  }

  String formatDateTime() {
    return DateFormat('yyyy-MM-dd HH:mm:ss.mmm').format(this);
  }
}

extension FormattedDateTimeFromString on String {
  /// We Use this to convert the coming Date time to a new more readable formate.
  String formateToReadableDateTime() {
    if (isEmpty) return '';
    final DateTime convertedToDateTime = DateTime.parse(this);
    final String convertedToHumanReadable =
        DateFormat('dd MMM yyyy - hh:mm aaa').format(convertedToDateTime);

    return convertedToHumanReadable;
  }

  String formateToReadableDate() {
    if (isEmpty) return '';
    final DateTime convertedToDateTime = DateTime.parse(this);
    final String convertedToHumanReadable =
        DateFormat('dd MMM yyyy').format(convertedToDateTime);

    return convertedToHumanReadable;
  }

  String formateToReadableTime() {
    if (isEmpty) return '';
    final DateTime convertedToDateTime = DateTime.parse(this);
    final String convertedToHumanReadable =
        DateFormat('hh:mm aaa').format(convertedToDateTime);

    return convertedToHumanReadable;
  }
}
