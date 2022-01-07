import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:score_cursos/app/common/utils/constants.dart';
import 'package:score_cursos/app/modules/intro/components/slider.component.dart';
import 'package:score_cursos/app/modules/intro/intro_store.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {

  @override
  IntroPageState createState() => IntroPageState();
}
class IntroPageState extends State<IntroPage> {

  final IntroStore store = Modular.get();
  final CarouselController carouselController = CarouselController();

  final List<SliderComponent> sliderItems =  [
    SliderComponent(title: 'Para Empresas', subtitle: "Fornecemos soluções para as maiores empresas do país em seus projetos de educação corporativa e programas de treinamento.",  imageAsset: "assets/images/intro/intro_1.png"),
    SliderComponent(title: 'Para Universidades', subtitle: "Somos o parceiro tecnológico de grandes universidades na ofertas de cursos de especialização 100% online, captando alunos no Brasil e no mundo.",  imageAsset: "assets/images/intro/intro_2.png"),
    SliderComponent(title: 'Para Estudantes', subtitle: "Maior plataforma de estudos online do Brasil. Conheça a Passei Direto!",  imageAsset: "assets/images/intro/intro_3.png")
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 200,
                reverse: false,
                initialPage: 0,
                autoPlay: false,
                enlargeCenterPage: false,
                onPageChanged: (i, x)=>store.setCurrent(i),
                viewportFraction: 1.0,
              ),
              items: sliderItems.map<SliderComponent>((i) {
                return i;
              }).toList()
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: Observer(
              builder: (context)=> Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: sliderItems.map((i) {
                  return Container(
                    width: store.current == sliderItems.indexOf(i) ? 10.0 : 5.0,
                    height: store.current == sliderItems.indexOf(i) ? 10.0 : 5.0,
                    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: store.current == sliderItems.indexOf(i) ? primaryColor : Colors.grey
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Observer(
                  builder: (context)=> Container(
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                        backgroundColor: MaterialStateProperty.all(primaryColor),
                      ),
                      onPressed: _next,
                      child: Text(store.current == sliderItems.length-1 ? "Iniciar" : "Próximo", style: const TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
                Observer(
                  builder: (context)=> Container(
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 30),
                    child: OutlinedButton(
                      onPressed: store.current==sliderItems.length-1 ?_goBack:_jumpToEnd,
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(BorderSide(color: primaryColor)),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                      ),
                      child: Text(store.current==sliderItems.length-1 ?"Voltar":"Pular", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _next(){
    if(store.current == sliderItems.length-1){
      store.unableFirstAcess();
    }else{
      carouselController.nextPage();
    }
  }

  void _jumpToEnd()=>carouselController.jumpToPage(sliderItems.length-1);
  void _goBack()=>carouselController.previousPage();
}