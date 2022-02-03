import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skore_app/controllers/subjects_manager.dart';
import 'package:skore_app/models/subjects_data.dart';
import 'package:skore_app/ui/pages/home/widgets/card_note_tile.dart';
import 'package:skore_app/ui/shared/widgets/background_gradient.dart';


class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SubjectsData data;
    double heightList = MediaQuery.of(context).size.height * 01;
    return Consumer<SubjectsManager>(builder: (_, subjectsManager, __){
      return Scaffold(
      body: Stack(
        children: [

          BackgroundGradient(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/logo.png")),
                  SizedBox(
                    height: heightList,
                  
                    
                   
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: subjectsManager.subjects.length,
                      itemBuilder: (_, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardNoteTile(data: subjectsManager.subjects[index],),
                      );
                    }),
                  ),
                ],
              ),
              ],
            ),
          ),

        
        ],
      ),
      
    );
    });
  }
}