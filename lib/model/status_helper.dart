import 'package:testemobileskore/model/status.dart';

class StatusHelper{
  static Status getStatus(String status) {
    switch (status) {
      case 'NOT_STARTED':
        return Status.NOT_STARTED;
      case 'IN_PROGRESS':
        return Status.IN_PROGRESS;
      case 'COMPLETED':
        return Status.COMPLETED;
      default:
        return Status.NOT_STARTED;
    }
  }
}