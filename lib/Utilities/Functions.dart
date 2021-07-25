
import 'package:alsignon/Constants/Constants.dart';
import 'package:time_formatter/time_formatter.dart';
import 'package:intl/intl.dart';


getDateAndTime(String givenDateTime, String dateFormat) {
    // dateFormat = 'MM/dd/yy';
    final DateTime docDateTime = DateTime.parse(givenDateTime);
    return DateFormat(dateFormat).format(docDateTime);
}

String timestampToString(timestamp) {
  String formatted = formatTime(int.parse(timestamp));
  return formatted;
}
String getMessageFromBody(body)
{
return publicSelectedLanguage == "en" ? body.data["message"]:body.data["message_ar"];
}





String getEstTimeUnit(status) {
  if (status == 0) {

    return "IMMEDIATELY __offer_label_for_estTime";
  } else if (status == 1) {
    return "HOURS __offer_label_for_estTime";
  } else if (status == 2) {
    return "DAYS __offer_label_for_estTime";
  } else if (status == 3) {
    return "WEEKS __offer_label_for_estTime";
  } else if (status == 4) {
    return "MONTHS __offer_label_for_estTime";
  }
}


String getWarrantyUnit(status) {
  if (status == 0) {
    return "NO WARRANTY";
  } else if (status == 1) {
    return "HOURS";
  } else if (status == 2) {
    return "DAYS";
  } else if (status == 3) {
    return "WEEKS";
  } else if (status == 4) {
    return "MONTHS";
  }




}
