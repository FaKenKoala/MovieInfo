import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

@sealed
class DateUtil {
  DateUtil._();
  static String? format(DateTime? dateTime, {DateFormat? inputFormat}) {
    DateFormat format = inputFormat ?? DateFormat('yyyy-MM-dd');
    return dateTime != null ? format.format(dateTime) : null;
  }
}
