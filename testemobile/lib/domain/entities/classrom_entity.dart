import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat("dd/MM/yyyy");

class ClassRomEntity extends Equatable {
  final String id;
  final String companyID;
  final String name;
  final String createdAt;
  final int? percent;
  final String status;

  const ClassRomEntity({
    required this.id,
    required this.companyID,
    required this.name,
    required this.createdAt,
    this.percent,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        createdAt,
        percent,
        status,
      ];

  ClassRomEntity.fromJson(json)
      : id = json['id'],
        companyID = json['company_id'],
        name = json['name'],
        createdAt = dateFormat.format(DateTime.fromMillisecondsSinceEpoch(json['created_at'])),
        status = json['status'],
        percent = json['summary']['percentage'];
}
