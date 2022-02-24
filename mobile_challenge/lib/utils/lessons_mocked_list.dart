import '../models/lesson_model.dart';
import 'lesson_status.dart';

final lessonsList = [
  LessonModel(
    companyId: "114",
    createdAt: 1571323199864,
    name: "Aula Álgebra",
    id: "114_0v62DokeArxPA9oDSBst_349785",
    status: LessonStatus.inProgress,
    summary: Summary(percentage: 20),
  ),
  LessonModel(
    companyId: "114",
    createdAt: 1578343188529,
    name: "Aula Trigonometria",
    id: "114_3Lj7okST2yBSYXUUByg2_349798",
    status: LessonStatus.notStarted,
    summary: Summary(percentage: 0),
  ),
  LessonModel(
    companyId: "114",
    createdAt: 1568918240759,
    name: "Aula Filosofia",
    id: "114_3O81FOuWLZIlSDnRJHm1_349798",
    status: LessonStatus.completed,
    summary: Summary(percentage: 100),
  ),
  LessonModel(
    companyId: "114",
    createdAt: 1574361972593,
    name: "Aula Geografia",
    id: "114_46keopvfEUvlNP7bd049_349798",
    status: LessonStatus.inProgress,
    summary: Summary(percentage: 75),
  ),
  LessonModel(
    companyId: "114",
    createdAt: 1571946887159,
    name: "Aula História",
    id: "114_5FK4ExJCz3vW4XmS0KVr_349798",
    status: LessonStatus.notStarted,
    summary: Summary(percentage: 0),
  ),
];
