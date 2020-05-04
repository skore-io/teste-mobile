import 'package:intl/intl.dart';
import 'package:marcelo_esser_test/model/summary.dart';

class Lesson {
  final String companyId;
  final int createdAt;
  final String name;
  final String id;
  final String status;
  final Summary summary;
  final int summaryKey;

  static const _companyIdMap = 'company_id';
  static const _createdAtMap = 'created_at';
  static const _nameMap = 'name';
  static const _idMap = 'id';
  static const _statusMap = 'status';
  static const _summaryMap = 'summary';

  Lesson(this.companyId, this.createdAt, this.name, this.id, this.status,
      this.summary, this.summaryKey);

  Lesson.fromJson(Map<String, dynamic> json, {this.summaryKey})
      : companyId =
            json.containsKey(_companyIdMap) ? json[_companyIdMap] : null,
        createdAt =
            json.containsKey(_createdAtMap) ? json[_createdAtMap] : null,
        name = json.containsKey(_nameMap) ? json[_nameMap] : null,
        id = json.containsKey(_idMap) ? json[_idMap] : null,
        status = json.containsKey(_statusMap) ? json[_statusMap] : null,
        summary = canMapSummary(json)
            ? Summary.fromJson(json[_summaryMap])
            : new Summary();

  Map<String, dynamic> toJson() => {
        _companyIdMap: companyId,
        _createdAtMap: createdAt,
        _nameMap: name,
        _idMap: id,
        _statusMap: status,
        _summaryMap: summary.toJson(),
      };

  static bool canMapSummary(Map<String, dynamic> json) =>
      json.containsKey(_summaryMap) && json[_summaryMap] != null;

  String getFormatedDate() {
    DateFormat dateFormat = DateFormat();
    dateFormat.addPattern("dd/MM/yyyy");
    return dateFormat.format(DateTime.fromMillisecondsSinceEpoch(createdAt));
  }
}
