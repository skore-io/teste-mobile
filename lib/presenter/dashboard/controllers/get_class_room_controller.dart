import 'package:flutter/material.dart';
import 'package:teste_mobile/features/dashboard/domain/entities/list_class_room_entity.dart';
import 'package:teste_mobile/features/dashboard/domain/usecase/class_room_usecase.dart';

class GetClassRoomController extends ChangeNotifier {
  final ClassRoomUseCase classRoomUseCase;

  final classRoomListenable = ValueNotifier<ListClassRoomEntity?>(null);

  GetClassRoomController(
    this.classRoomUseCase,
  );

  Future<void> call() async {
    try {
      final useCase = await classRoomUseCase();

      classRoomListenable.value = useCase;
      classRoomListenable.notifyListeners();
    } catch (error) {
      Exception("Error");
    }
  }

  void removeRoom(int index) {
    if (classRoomListenable.value != null && index >= 0 && index < classRoomListenable.value!.listClassRoom.length) {
      classRoomListenable.value!.listClassRoom.removeAt(index);
      classRoomListenable.notifyListeners();
    }
  }
}
