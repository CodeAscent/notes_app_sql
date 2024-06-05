import 'package:intl/intl.dart';

customDateFormat({required DateTime date}) =>
    DateFormat("MMM dd, yyyy, hh:mm a").format(date);
