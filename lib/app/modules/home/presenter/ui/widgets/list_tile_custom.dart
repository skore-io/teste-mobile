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
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            leading: IconButton(
              onPressed: () {
                controllerHome.removeItemList(index);
              },
              icon: const Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
            ),
            title: Text(
              controllerHome.listTodoClass[index].name,
              style: Theme.of(context).textTheme.headline4,
            ),
            trailing: controllerHome.listTodoClass[index].status == 'COMPLETED'
                ? const Icon(
                    Icons.done,
                    color: Colors.green,
                  )
                : controllerHome.listTodoClass[index].status == 'IN_PROGRESS'
                    ? Text(
                        '${controllerHome.listTodoClass[index].summary.percentage}%',
                        style: Theme.of(context).textTheme.headline2,
                      )
                    : const SizedBox(
                        width: 10,
                      ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controllerHome.listTodoClass[index].id,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                Text(
                  Functions().convertDateTimeinString(
                      controllerHome.listTodoClass[index].createdAt),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
