import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:minhas_aulas/features/class/domain/entities/class.dart';
import 'package:minhas_aulas/features/class/presentation/store/class_store.dart';
import 'package:minhas_aulas/injection_container.dart';
import 'package:minhas_aulas/themes/colors_palette.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ClassListPage extends HookWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final themeColors = const DefaultColorsPalette();
  @override
  Widget build(BuildContext context) {
    final classStore = useMemoized(() => serviceLocator<ClassStore>());

    final Size size = MediaQuery.of(context).size;

    useEffect(() {
      classStore.initClasses();
      return;
    }, const []);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: themeColors.background,
      body: Observer(builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              _buildLoadingContainer(classStore, size),
              _buildLoadedContainer(classStore, size),
            ],
          ),
        );
      }),
    );
  }

  AnimatedOpacity _buildLoadedContainer(ClassStore classStore, Size size) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: classStore.state != ClassStoreState.loading ? 1.0 : 0.0,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
                title: Text(
              'Minhas Aulas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: themeColors.text.display,
              ),
            )),
            expandedHeight: 100,
          ),
          classStore.classes.length > 0
              ? _buildList(classStore)
              : _buildEmptyList(size),
        ],
      ),
    );
  }

  AnimatedOpacity _buildLoadingContainer(ClassStore classStore, Size size) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: classStore.state != ClassStoreState.loading ? 0.0 : 1.0,
      child: Container(
        color: themeColors.background,
        width: size.width,
        height: size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(themeColors.primary),
                ),
              ),
              Text(
                'Carregando aulas',
                style: TextStyle(
                  fontSize: 24,
                  color: themeColors.text.subhead,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverList _buildList(ClassStore classStore) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => _buildCardClass(context,
            classData: classStore.classes[index], classStore: classStore),
        childCount: classStore.classes.length,
      ),
    );
  }

  SliverList _buildEmptyList(Size size) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          width: size.width,
          height: size.height * 0.8,
          child: Center(
            child: Text(
              'Sem aulas no momento',
              style: TextStyle(
                fontSize: 24,
                color: themeColors.text.subhead,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Container _buildProgressClass({
    @required int percentage,
  }) {
    assert(percentage != null, 'The percentage should not be null');
    return Container(
      width: 48,
      height: 48,
      child: percentage != 0
          ? SfRadialGauge(
              enableLoadingAnimation: true,
              animationDuration: 300,
              axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    startAngle: 90,
                    endAngle: 90,
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        positionFactor: 0.1,
                        angle: 90,
                        widget: percentage != 0
                            ? RichText(
                                text: TextSpan(
                                    text: percentage.toString(),
                                    style: TextStyle(
                                        color: themeColors.primary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '%',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      )
                                    ]),
                              )
                            : null,
                      ),
                    ],
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.1,
                      cornerStyle: CornerStyle.bothCurve,
                      color: themeColors.dark,
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: percentage.toDouble(),
                        color: themeColors.primary,
                        cornerStyle: CornerStyle.bothCurve,
                        width: 0.1,
                        sizeUnit: GaugeSizeUnit.factor,
                      )
                    ],
                  ),
                ])
          : null,
    );
  }

  Container _buildCardClass(
    BuildContext context, {
    @required Class classData,
    @required ClassStore classStore,
  }) {
    assert(classData != null, 'The classData should not be null');
    assert(classStore != null, 'The classStore should not be null');
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      width: 340,
      height: 130,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
          color: themeColors.light,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(0, 8),
              spreadRadius: -4,
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 14,
            ),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    classData.name,
                    style: TextStyle(
                      color: themeColors.text.subhead,
                      letterSpacing: 0.5,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Início em: ',
                        style: TextStyle(
                            color: themeColors.text.body1,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        children: <TextSpan>[
                          TextSpan(
                            text: classStore.formatDate(classData.createdAt),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                ],
              ),
              Flexible(
                child: Text(
                  'ID ${classData.id}',
                  style: TextStyle(
                    fontSize: 12,
                    color: themeColors.text.body2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              classData.summary.percentage == 100
                  ? _buildFinishedClass()
                  : _buildProgressClass(
                      percentage: classData.summary.percentage),
              InkWell(
                splashColor: themeColors.primary,
                onTap: () => _deleteClass(context, classStore, classData),
                child: Icon(
                  Icons.delete_outline,
                  size: 32,
                  color: themeColors.error,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _deleteClass(
      BuildContext context, ClassStore classStore, Class classData) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Apagar aula"),
          content: RichText(
            text: TextSpan(
                text: 'Você realmente deseja apagar ',
                style: TextStyle(
                    color: themeColors.text.body1,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
                children: <TextSpan>[
                  TextSpan(
                    text: classData.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '?',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  )
                ]),
          ),
          actions: <Widget>[
            FlatButton(
              child:
                  Text("Fechar", style: TextStyle(color: themeColors.primary)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Observer(builder: (context) {
              return classStore.state != ClassStoreState.deleting
                  ? RaisedButton(
                      color: themeColors.primary,
                      child: Text("Confirmar"),
                      onPressed: () async {
                        print('delete it ');
                        await classStore.deleteClass(classData.id);
                        Navigator.of(context).pop();

                        final snackBar =
                            SnackBar(content: Text('Aula apagada com sucesso'));

                        _scaffoldKey.currentState.showSnackBar(snackBar);
                      },
                    )
                  : Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(themeColors.primary),
                      ));
            }),
          ],
        );
      },
    );
  }

  Widget _buildFinishedClass() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: themeColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Icon(Icons.check, color: themeColors.light, size: 32),
    );
  }
}
