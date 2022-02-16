import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobileteste/app/core/utils/functions/functions.dart';

import 'package:mobileteste/app/modules/home/presenter/controllers/home_controller.dart';

class ListTileCustom extends StatelessWidget {
  final int index;
  ListTileCustom({
    Key? key,
    required this.index,
  }) : super(key: key);
  final controllerHome = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            leading: IconButton(
              onPressed: () {
                controllerHome.removeItemList(index);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.red,
              ),
            ),
            title: Text(
              controllerHome.todoClass[index].name,
              style: Theme.of(context).textTheme.headline4,
            ),
            trailing: controllerHome.todoClass[index].status == 'COMPLETED'
                ? const Icon(
                    Icons.done,
                    color: Colors.green,
                  )
                : controllerHome.todoClass[index].status == 'IN_PROGRESS'
                    ? Text(
                        '${controllerHome.todoClass[index].summary.percentage}%',
                        style: Theme.of(context).textTheme.headline2,
                      )
                    : const SizedBox(
                        width: 10,
                      ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'id: ' + controllerHome.todoClass[index].id,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                Text(
                  Functions().convertDateTimeinString(
                      controllerHome.todoClass[index].createdAt),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
