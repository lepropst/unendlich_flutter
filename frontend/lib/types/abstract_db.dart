abstract class AbstractDB<T> {
  Future<String> delete(String t, String table);
  Future<String> create(T t, String table);
  Future<List<T>> get(String t, String table);
  Future<List<T>> getAll(String table);
  Future<List<T>> getAllItems(List<String> itemIds, String table);
  Future<void> update(T t, String table);
  Future<void> updateAll(List<T> updates, String table);
  Future<bool> exists(String label, String id);
}
