import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:score_cursos/app/common/entities/user.entity.dart';
import 'package:score_cursos/app/common/utils/constants.dart';
import 'package:score_cursos/app/modules/home/ui/components/course_tile.dart';
import 'package:score_cursos/app/modules/home/ui/components/top_background_appbar.dart';
import 'package:score_cursos/app/modules/home/ui/home_store.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeStore store = Modular.get();
  final UserEntity user = Modular.args.data;

  @override
  void initState() {
    super.initState();
    store.initialize(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 340,
              floating: false,
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: primaryColor,
              centerTitle: true,
              leading: Container(margin: const EdgeInsets.only(left: 10), child: Image.asset("assets/images/logo_colored.png")),
              title: const Text("Meus Cursos", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
              flexibleSpace: FlexibleSpaceBar(
                background: Observer(
                  builder:(_)=>Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: SummaryUser(
                      userEntity: store.loggedUser,
                      courses: store.myCourses.length,
                      completedCourses: store.completeds,
                    ),
                  ),
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Observer(
            builder:(_)=>Column(
              children: [
                !store.loadingCourses?Container():LinearProgressIndicator(
                  minHeight: 5,
                  color: accentColor,
                  backgroundColor: primaryColor,
                ),
                store.loadingCourses?Container():AnimationLimiter(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: store.myCourses.length,
                    itemBuilder: (BuildContext context, int item) {
                      return AnimationConfiguration.staggeredList(
                        position: item,
                        duration: const Duration(seconds: 1),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: CourseTile(
                                onRemove: ()=>store.removeCourse(store.myCourses[item]),
                                course: store.myCourses[item])
                          ),
                          ),
                        );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
