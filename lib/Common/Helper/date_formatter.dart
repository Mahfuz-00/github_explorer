import 'package:intl/intl.dart';

class DateFormatter {
  static final _dateFormat = DateFormat('dd MMM yyyy');
  static String format(DateTime date) => _dateFormat.format(date);
}