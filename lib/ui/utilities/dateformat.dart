// ignore_for_file: depend_on_referenced_packages

import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

formatDate(String? date) {
  var timestamp = DateTime.parse(date!);
  var timeAgo = timeago.format(timestamp, locale: 'en');
  return timeAgo;
}

formatDateTO(String? dateTime) {
  var timestamp = DateTime.parse(dateTime!);
  var formatter = DateFormat('EEEE, d, yyyy');
  return formatter.format(timestamp);
}
