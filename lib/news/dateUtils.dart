import 'package:intl/intl.dart';

class MyDateUtils{
  static String FormatNewsDate(String inputDateString)
  {
    var inputDateFormatter=DateFormat('yyyy-MM-ddThh:mm:ssZ');
    var outputDAteFormatter=DateFormat('yyyy/MMM/dd hh:mm a');
    var inputDate=inputDateFormatter.parse(inputDateString);
    var outputDate=outputDAteFormatter.format(inputDate);
    return outputDate;
  }
}