import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobileteste/app/modules/home/presenter/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Observer(
          builder: (_) => controller.todoClass.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.todoClass.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: IconButton(
                        onPressed: () {
                          controller.todoClass.removeAt(index);
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      ),
                      title: Text(
                        controller.todoClass[index].name,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      trailing: controller.todoClass[index].status ==
                              'COMPLETED'
                          ? const Icon(
                              Icons.done,
                              color: Colors.green,
                            )
                          : controller.todoClass[index].status == 'IN_PROGRESS'
                              ? Text(
                                  '${controller.todoClass[index].summary.percentage}%',
                                  style: Theme.of(context).textTheme.headline2,
                                )
                              : const SizedBox(
                                  width: 10,
                                ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'id: ' + controller.todoClass[index].id,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            controller.todoClass[index].createdAt.day
                                .toString(),
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
    ));
  }
}
