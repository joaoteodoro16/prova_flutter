import 'package:mobx/mobx.dart';
import 'package:prova_flutter/app/core/ui/loader.dart';
import 'package:prova_flutter/app/core/ui/messages.dart';
import 'package:prova_flutter/app/services/note/note_service.dart';

part 'home_controller_store.g.dart';

class HomeControllerStore = HomeControllerStoreBase with _$HomeControllerStore;

abstract class HomeControllerStoreBase with Store {
  final NoteService _service;

  HomeControllerStoreBase({required NoteService noteService})
      : _service = noteService;

  @observable
  List<String> _notes = [];
  List<String> get notes => _notes;

  @observable
  int? _indexSelected;
  int? get indexSelectec => _indexSelected;

  @action
  Future<void> getAllNotes() async {
    try {
      Loader.show();
      _notes = await _service.getNotes() ?? [];
      Loader.hide();
    } on Exception catch (e) {
      Messages.alert(e.toString());
    }
  }

  @action
  Future<void> saveNote({required String note}) async {
    try {
      Loader.show();
      _notes = await _service.saveNote(note: note) ?? [];
      Loader.hide();
    } on Exception catch (e) {
      Messages.alert(e.toString());
    }
  }

  @action
  Future<void> deleteNote({required int index}) async {
    try {
      Loader.show();
      _notes = await _service.deleteNote(index: index) ?? [];
      Loader.hide();
    } on Exception catch (e) {
      Messages.alert(e.toString());
    }
  }

  @action
  Future<void> editNote({required int index, required String note}) async {
    try {
      Loader.show();
      _notes = await _service.editNote(index: index, note: note) ?? [];
      Loader.hide();
    } on Exception catch (e) {
      Messages.alert(e.toString());
    }
  }

  @action
  void clearIndexSelected() {
    _indexSelected = null;
  }

  @action
  void setIndexSelected(int index) {
    _indexSelected = index;
  }
}
