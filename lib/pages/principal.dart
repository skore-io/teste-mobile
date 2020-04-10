import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:testemobileskore/bloc/aula.dart';
import 'package:testemobileskore/model/aula.dart';
import 'package:testemobileskore/model/status.dart';
import 'package:testemobileskore/model/status_helper.dart';
import 'package:testemobileskore/repository/aula.dart';

class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  AulaBloc _aulasBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _aulasBloc = Provider.of<AulaBloc>(context);
    AulaRepository.getAulas().then((value) => _aulasBloc.setAulas(value));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: size.height * 0.15,
              floating: false,
              pinned: true,
              centerTitle: true,
              backgroundColor: Theme.of(context).canvasColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(color: Theme.of(context).canvasColor,),
                centerTitle: true,
                title:Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Image.asset(
                    "assets/images/logo_skore.png",
                    height: size.height * 0.05,
                  ),
                ), ),
            ),
          ];
        },
        body: Center(
          child: StreamBuilder<List<Aula>>(
              stream: _aulasBloc.getAulas,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                  case ConnectionState.active:
                    return buildListView(snapshot.data, context);
                  default:
                    return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }

  Widget buildListView(List<Aula> data, BuildContext context) {
    if (data.length > 0) {
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext ctx, int index) {
          Aula _aula = data[index];
          if (_aula.deleted) return Container();
          return buildItem(context, _aula);
        },
      );
    } else {
      return Center(child: Text("Nenhuma aula cadastrada."));
    }
  }

  void confirmDelete(BuildContext context, Aula _aula) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Row(
            children: <Widget>[
              Icon(
                Icons.warning,
                color: Colors.redAccent,
              ),
              SizedBox(
                width: 10,
              ),
              Text("Excluir Aula"),
            ],
          ),
          content: Text(
              "Tem certeza que deseja excluir a aula \"${_aula.name}\" de ${DateFormat('dd/MM/yyyy').format(_aula.getCreatedDate())}?"),
          actions: [
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("Sim, excluir!"),
              onPressed: () {
                Navigator.of(context).pop();
                deleteAula(context, _aula);
              },
            ),
          ],
        );
      },
    );
  }

  void deleteAula(BuildContext context, Aula _aula) {
    _aulasBloc.delete(_aula);
    Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text("Aula removida!"),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'Desfazer',
          onPressed: () {
            _aulasBloc.undelete(_aula);
          },
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, Aula _aula) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.check_box_outline_blank,
                          color: Colors.white,
                        ),
                        Text(
                          _aula.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.code,
                          color: Colors.blue,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(_aula.id,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12)),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.date_range,
                          color: Colors.blue,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy')
                              .format(_aula.getCreatedDate()),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Visibility(
                    visible: StatusHelper.getStatus(_aula.status) == Status.COMPLETED,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  Visibility(
                    visible: StatusHelper.getStatus(_aula.status) == Status.IN_PROGRESS,
                    child: CircularPercentIndicator(
                      radius: 48,
                      lineWidth: 4,
                      percent: (_aula.summary.percentage ?? 0) / 100,
                      center: Text(
                        "${_aula.summary.percentage}%",
                        style:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                      progressColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              InkWell(
                onTap: () => confirmDelete(context, _aula),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Remover aula",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 14),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.remove_circle,
                      color: Colors.blueAccent,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
