abstract class NoteRepository {

  Future<List<String>?> getNotes();
  Future<List<String>?> saveNote({required String note});
  Future<List<String>?> deleteNote({required int index});
  Future<List<String>?> editNote({required int index, required String note});

}