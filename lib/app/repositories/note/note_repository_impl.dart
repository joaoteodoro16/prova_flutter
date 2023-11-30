import 'package:logger/logger.dart';
import 'package:prova_flutter/app/core/helpers/constants.dart';

import './note_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteRepositoryImpl extends NoteRepository {
  @override
  Future<List<String>?> getNotes() async {
    try {
      return await _getNotesList();
    } on Exception catch (e) {
      Logger().e("NoteRepositoryImpl - getNotes ", error: e.toString());
      throw Exception("Erro ao buscar as notas cadastradas");
    }
  }

  @override
  Future<List<String>?> saveNote({required String note}) async {
    try {
      List<String> oldNotes = await _getNotesList();
      oldNotes.add(note);
      await _clearNotesList();
      await _setNotesList(oldNotes);
      return await _getNotesList();
    } on Exception catch (e) {
      Logger().e("NoteRepositoryImpl - saveNote ", error: e.toString());
      throw Exception("Erro ao cadastrar a nota");
    }
  }

  @override
  Future<List<String>?> deleteNote({required int index}) async {
    try {
      List<String> oldNotes = await _getNotesList();
      oldNotes.removeAt(index);
      final newListNotes = [...oldNotes];
      await _setNotesList(newListNotes);
      return await _getNotesList();
    } on Exception catch (e) {
      Logger().e("NoteRepositoryImpl - _clearNotesList ", error: e.toString());
      throw Exception("Erro ao deletar a nota!");
    }
  }

  @override
  Future<List<String>?> editNote(
      {required int index, required String note}) async {
    try {
      List<String> oldNotes = await _getNotesList();
      oldNotes[index] = note;
      final newListNotes = [...oldNotes];
      await _setNotesList(newListNotes);
      return await _getNotesList();
    } on Exception catch (e) {
      Logger().e("NoteRepositoryImpl - editNote ", error: e.toString());
      throw Exception("Erro ao editar a nota!");
    }
  }

  Future<void> _setNotesList(List<String> notes) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(Constants.KEY_LIST_NOTES, notes);
    } on Exception catch (e) {
      Logger().e("NoteRepositoryImpl - _clearNotesList ", error: e.toString());
      throw Exception("Um erro inesperado aconteceu!");
    }
  }

  Future<void> _clearNotesList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove(Constants.KEY_LIST_NOTES);
    } on Exception catch (e) {
      Logger().e("NoteRepositoryImpl - _clearNotesList ", error: e.toString());
      throw Exception("Um erro inesperado aconteceu!");
    }
  }

  Future<List<String>> _getNotesList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getStringList(Constants.KEY_LIST_NOTES) ?? [];
    } on Exception catch (e) {
      Logger().e("NoteRepositoryImpl - _getNotesList ", error: e.toString());
      throw Exception("Um erro inesperado aconteceu!");
    }
  }
}
