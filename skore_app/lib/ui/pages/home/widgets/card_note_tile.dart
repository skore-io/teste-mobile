import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:skore_app/controllers/subjects_manager.dart';
import 'package:skore_app/models/data/subjects_data.dart';
import 'package:provider/provider.dart';
import 'package:skore_app/ui/pages/home/widgets/progress_status_widget.dart';
import 'package:skore_app/ui/shared/const/c.dart';
import 'package:skore_app/ui/shared/utils/string_extension.dart';

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
              child: Padding(padding: const EdgeInsets.all(6),
              child: Column(
                children:  [
                GestureDetector(
                  onTap: (){
                    context.read<SubjectsManager>().fetchDeleteSubject(data.idDocument);
                  },
                  child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(C.closeIcon, height: 30, width: 30,),
                ),
                ),
                Text(
                  data.name, style: const TextStyle(fontFamily: "quicksand", color: Colors.deepPurple, fontSize: 20,),
                  ),
                Text(
                  C.createIn + StringExtension.makeFormatDate(data.createdAt), style: const TextStyle(fontFamily: "quicksand", color: Colors.black87, fontSize: 12),
                  ),
                Card(
                  elevation: 4,
                  child: QrImage(
                    data: data.id,
                    version: QrVersions.auto,
                    size: 140,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ProgressStatusWidget(data: data,),
                  Text(
                    StringExtension.statusSubject(data.status), style: const TextStyle(fontFamily: "quicksand", color: Colors.black45, fontSize: 10),
                  ),
              ],),),
              ),
          ),
        ),
      ],
    );
  }
}