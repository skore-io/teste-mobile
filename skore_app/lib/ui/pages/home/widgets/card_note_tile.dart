import 'package:flutter/material.dart';
import 'package:skore_app/models/subjects_data.dart';
import 'package:date_format/date_format.dart' as da;

class CardNoteTile extends StatelessWidget {
  final SubjectsData data;
  const CardNoteTile({ Key? key,required this.data }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height * 0.5;
    double width = MediaQuery.of(context).size.width * 0.6;
    
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)
                  ),
            elevation: 20,
            child: SizedBox(
              height: height,
              width: width,
              child: Padding(padding: const EdgeInsets.all(10),
              child: Column(children:  [
                Text(
                  data.name, style: const TextStyle(fontFamily: "quicksand", color: Colors.black45, fontSize: 20),
                  
                  ),
                  Text(
                  makeFormatDate(1574361972593), style: const TextStyle(fontFamily: "quicksand", color: Colors.black26, fontSize: 12),
                  
                  )
              ],),),
              ),

            
          ),
        ),
      ],
    );
  }

  String makeFormatDate(int timestamp){
    String date =  da.formatDate(DateTime.fromMillisecondsSinceEpoch(timestamp), [ da.dd,
                                                                              '/',
                                                                              da.mm,
                                                                              '/',
                                                                              da.yyyy]);
  return date;
                                                                        

  }
}