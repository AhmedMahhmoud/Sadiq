import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtensions on DateTime {
  String toYMD({String locale = 'ar'}) {
    return DateFormat.yMd(locale).format(this);
  }

  String toArabicTime() {
    return DateFormat('EEEE، d MMMM hh:mm a', 'ar')
        .format(this)
        .replaceAll("AM", "ص")
        .replaceAll("PM", "م");
  }
}
