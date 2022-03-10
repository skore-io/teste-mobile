import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testemobile/app/widgets/custom_expandable.dart';

// ignore: must_be_immutable
class ClassromList extends StatelessWidget {
  RxList classroms;
  ClassromList({
    Key? key,
    required this.classroms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (classroms.isEmpty) {
            return const CustomExpandableShimmer();
          } else {
            return CustomExpandable(
              classrom: classroms[index],
              deleteItem: () {
                classroms.removeAt(index);
                Get.forceAppUpdate();
              },
            );
          }
        },
        itemCount: classroms.isEmpty ? 10 : classroms.length,
      ),
    );
  }
}
