import 'package:intl/intl.dart';

enum DFormat {
  simple, moderate, detail,
  noDateSimple, noDateModerate, noDateDetail,
  onlyDate, onlyMonth, onlyYear,
  withDay,
}

enum TFormat {
  complete, noSecond, onlyHour,
}

enum NowFormat {
  all, date, time,
}

DateFormat dateFormat(DFormat? format, String sep) {
  switch (format) {
    case DFormat.simple: //NOTE: 12 01 21
      return DateFormat('dd${sep}MM${sep}yy', "id");
    case DFormat.moderate: //NOTE: 12 Jan 2021
      return DateFormat('dd${sep}MMM${sep}yyyy', "id");
    case DFormat.detail: //NOTE:  12 Januari 2021
      return DateFormat('dd${sep}MMMM${sep}yyyy', "id");
    case DFormat.noDateSimple: //NOTE: 01 21
      return DateFormat('MM${sep}yy', "id");
    case DFormat.noDateModerate: //NOTE: Jan 2021
      return DateFormat('MMM${sep}yyyy', "id");
    case DFormat.noDateDetail: //Note: Januari 2021
      return DateFormat('MMMM${sep}yyyy', "id");
    case DFormat.onlyDate: //NOTE: 12
      return DateFormat('dd');
    case DFormat.onlyMonth: // Note: 01
      return DateFormat('MM');
    case DFormat.onlyYear: //Note: 2021
      return DateFormat('yyyy');
    case DFormat.withDay: //Note: Selasa, 12 Januari 2021
      return DateFormat("EEEE, d${sep}MMMM${sep}yyyy", "id");
    default:
      return DateFormat('dd${sep}MM${sep}yyyy');
  }
}

DateFormat timeFormat(TFormat? format, String sep) {
  switch (format) {
    case TFormat.complete:
      return DateFormat('HH${sep}mm${sep}ss');
    case TFormat.noSecond:
      return DateFormat('HH${sep}mm');
    case TFormat.onlyHour:
      return DateFormat('HH');
    default:
      return DateFormat('HH${sep}mm${sep}ss');
  }
}