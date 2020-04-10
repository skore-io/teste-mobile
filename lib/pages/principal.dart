import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:testemobileskore/bloc/aula.dart';
import 'package:testemobileskore/model/aula.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo_skore.png",
          height: 80,
        ),
      ),
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
    );
  }

  Widget buildListView(data, context) {
    if (data.length > 0) {
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext ctx, int index) {
          Aula _aula = data[index];
          return ListTile(
            title: Text(_aula.name),
            subtitle: Column(children: [
              Text(_aula.id),
              Text(
                DateFormat('dd/MM/yyyy').format(_aula.getCreatedDate()),
              ),
            ]),
          );
        },
      );
    } else {
      return Center(child: Text("Nenhuma aula cadastrada."));
    }
  }
}
