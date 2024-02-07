abstract class Model {
  Model.fromJson(Map json);

  Model.copy(dynamic entity);

  Map<String, dynamic> toMap();
}