class DateUtil {
  static String formatDateToIntFromDateTime(DateTime dateTime) {
    String date =
        "${dateTime.year}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')}";

    return date;
  }

  static String formatDateFromNumber(int no) {
    switch (no) {
      case 1:
        return "월";
      case 2:
        return "화";
      case 3:
        return "수";
      case 4:
        return "목";
      case 5:
        return "금";
      case 6:
        return "토";
      case 7:
        return "일";
      default:
        return '';
    }
  }

  static String formatTwoDigitTimeFromDateTime(DateTime dateTime) {
    final String time =
        '${dateTime.hour.toString().padLeft(2, '0')} : ${dateTime.minute.toString().padLeft(2, '0')}';

    return time;
  }

  static String formatYMDFromDateTime(DateTime dateTime) {
    return "${dateTime.year}년 ${dateTime.month}월 ${dateTime.day}일";
  }
}
