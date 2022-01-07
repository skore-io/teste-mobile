import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:score_cursos/app/common/entities/user.entity.dart';
import 'package:score_cursos/app/common/utils/constants.dart';

class SummaryUser extends StatelessWidget {

  UserEntity? userEntity;
  int? courses;
  int? completedCourses;

  SummaryUser({Key? key, this.userEntity, this.courses, this.completedCourses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/overlay.png")
          )
      ),
      child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 110,
                      height: 110,
                      child: Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    image: AssetImage(userEntity?.imageSrc??"")
                                )
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: null,
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                                  backgroundColor: MaterialStateProperty.all(Colors.white),
                                ),
                                child: const Icon(LineAwesomeIcons.camera),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(userEntity?.name??"", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    Text(userEntity?.email??""),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(courses.toString(), style: const TextStyle(color: Colors.yellow, fontSize: 40, fontWeight: FontWeight.bold),),
                      const Text("Cursos", style: TextStyle(color: Colors.yellow, fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Column(
                    children: [
                      Text(completedCourses.toString(), style: const TextStyle(color: Colors.yellow, fontSize: 40, fontWeight: FontWeight.bold),),
                      Text(completedCourses!>1?"Concluídos":"Concluído", style: const TextStyle(color: Colors.yellow, fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
}
