typedef FromJson<T> = T Function(Map<String, dynamic> json);

abstract class DataSource<T> {
  Future<T?> call({Map<String, dynamic> param, FromJson<T> fromJson});
}
