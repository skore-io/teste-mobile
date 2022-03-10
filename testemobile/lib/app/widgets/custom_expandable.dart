import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:testemobile/data/constants/app_colors.dart';
import 'package:testemobile/domain/entities/classrom_entity.dart';

// ignore: must_be_immutable
class CustomExpandable extends StatefulWidget {
  ClassRomEntity classrom;
  Function deleteItem;
  CustomExpandable({
    Key? key,
    required this.classrom,
    required this.deleteItem,
  }) : super(key: key);

  @override
  State<CustomExpandable> createState() => _CustomExpandableState();
}

class _CustomExpandableState extends State<CustomExpandable> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isExpanded = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    );
  }

  _toggleContainer() {
    if (_animation.status != AnimationStatus.completed) {
      setState(() {
        isExpanded = true;
      });
      _controller.forward();
    } else {
      setState(() {
        isExpanded = false;
      });
      _controller.animateBack(0, duration: const Duration(milliseconds: 300));
    }
  }

  // perdão pelo boilerplate ~~
  _checkClassromStatus() {
    if (widget.classrom.status == 'COMPLETED') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Status:',
            style: TextStyle(color: AppColors.yellow, fontWeight: FontWeight.bold),
          ),
          Text(
            'Completa',
            style: TextStyle(color: AppColors.yellow, fontWeight: FontWeight.bold),
          )
        ],
      );
    } else if (widget.classrom.status == 'IN_PROGRESS') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Status:',
            style: TextStyle(color: AppColors.yellow, fontWeight: FontWeight.bold),
          ),
          Text(
            '${widget.classrom.percent}%',
            style: TextStyle(color: AppColors.yellow, fontWeight: FontWeight.bold),
          )
        ],
      );
    } else if (widget.classrom.status == 'NOT_STARTED') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Status:',
            style: TextStyle(color: AppColors.yellow, fontWeight: FontWeight.bold),
          ),
          Text(
            'Pendente',
            style: TextStyle(color: AppColors.yellow, fontWeight: FontWeight.bold),
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.5, color: AppColors.yellow),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray,
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(-2, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.classrom.name,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    widget.classrom.status == 'COMPLETED'
                        ? Icon(Icons.check, color: AppColors.lightgreen)
                        : widget.classrom.status == 'IN_PROGRESS'
                            ? const Icon(Icons.timer, color: Colors.white)
                            : Container(),
                    Text(
                      widget.classrom.createdAt,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: AppColors.yellow))),
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: _checkClassromStatus()),
            ),
            SizeTransition(
              sizeFactor: _animation,
              axis: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: AppColors.yellow))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ID:', style: TextStyle(color: AppColors.yellow, fontWeight: FontWeight.bold)),
                          Text(widget.classrom.id, style: TextStyle(color: AppColors.yellow)),
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.red[500]!,
                    shape: const StadiumBorder(),
                    onPressed: () {
                      widget.deleteItem();
                    },
                    child: const Text(
                      'Apagar Aula',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              color: AppColors.yellow,
              shape: const StadiumBorder(),
              onPressed: () {
                _toggleContainer();
              },
              child: Text(
                isExpanded ? 'Fechar' : 'Ver detalhes',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomExpandableShimmer extends StatelessWidget {
  const CustomExpandableShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(-2, 2),
            ),
          ],
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.white.withOpacity(0.1),
          highlightColor: AppColors.gray,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
