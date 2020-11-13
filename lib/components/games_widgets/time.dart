DateTime time(String utcTime) {
  //String name = "2019-09-04T15:00:00.000Z";
  int year = int.parse(utcTime.substring(2, 4));
  int month = int.parse(utcTime.substring(5, 7));
  int day = int.parse(utcTime.substring(8, 10));
  int hour = int.parse(utcTime.substring(11, 13));
  int minute = int.parse(utcTime.substring(14, 16));
  return DateTime(
    year,
    month,
    day,
    hour,
    minute,
  );
}

List<String> timeString(String utcTime) {
  //String name = "2019-09-04T15:00:00.000Z";

  String year = utcTime.substring(2, 4);
  String month = utcTime.substring(5, 7);
  String day = utcTime.substring(8, 10);
  String hour = utcTime.substring(11, 13);
  String minute = utcTime.substring(14, 16);
  return [
    year,
    month,
    day,
    hour,
    minute,
  ];
}
