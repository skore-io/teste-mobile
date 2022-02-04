import 'package:date_format/date_format.dart' as da;

class StringExtension {

   static String makeFormatDate(int timestamp){
    String date =  da.formatDate(DateTime.fromMillisecondsSinceEpoch(timestamp), [ da.dd,
      '/',
      da.mm,
      '/',
      da.yyyy]);
    return date;

  }

  static String statusSubject(String status){
     String correctStatus;

     switch(status){
       case "IN_PROGRESS":
         correctStatus = "Em Progresso";
         break;
       case "NOT_STARTED":
         correctStatus = "Não iniciada";
         break;
       case "COMPLETED":
         correctStatus = "Completa";
         break;
       default:
         correctStatus = "";

     }

     return correctStatus;

   }
}