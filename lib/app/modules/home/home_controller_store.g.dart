// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeControllerStore on HomeControllerStoreBase, Store {
  late final _$_notesAtom =
      Atom(name: 'HomeControllerStoreBase._notes', context: context);

  @override
  List<String> get _notes {
    _$_notesAtom.reportRead();
    return super._notes;
  }

  @override
  set _notes(List<String> value) {
    _$_notesAtom.reportWrite(value, super._notes, () {
      super._notes = value;
    });
  }

  late final _$_indexSelectedAtom =
      Atom(name: 'HomeControllerStoreBase._indexSelected', context: context);

  @override
  int? get _indexSelected {
    _$_indexSelectedAtom.reportRead();
    return super._indexSelected;
  }

  @override
  set _indexSelected(int? value) {
    _$_indexSelectedAtom.reportWrite(value, super._indexSelected, () {
      super._indexSelected = value;
    });
  }

  late final _$getAllNotesAsyncAction =
      AsyncAction('HomeControllerStoreBase.getAllNotes', context: context);

  @override
  Future<void> getAllNotes() {
    return _$getAllNotesAsyncAction.run(() => super.getAllNotes());
  }

  late final _$saveNoteAsyncAction =
      AsyncAction('HomeControllerStoreBase.saveNote', context: context);

  @override
  Future<void> saveNote({required String note}) {
    return _$saveNoteAsyncAction.run(() => super.saveNote(note: note));
  }

  late final _$deleteNoteAsyncAction =
      AsyncAction('HomeControllerStoreBase.deleteNote', context: context);

  @override
  Future<void> deleteNote({required int index}) {
    return _$deleteNoteAsyncAction.run(() => super.deleteNote(index: index));
  }

  late final _$editNoteAsyncAction =
      AsyncAction('HomeControllerStoreBase.editNote', context: context);

  @override
  Future<void> editNote({required int index, required String note}) {
    return _$editNoteAsyncAction
        .run(() => super.editNote(index: index, note: note));
  }

  late final _$HomeControllerStoreBaseActionController =
      ActionController(name: 'HomeControllerStoreBase', context: context);

  @override
  void clearIndexSelected() {
    final _$actionInfo = _$HomeControllerStoreBaseActionController.startAction(
        name: 'HomeControllerStoreBase.clearIndexSelected');
    try {
      return super.clearIndexSelected();
    } finally {
      _$HomeControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIndexSelected(int index) {
    final _$actionInfo = _$HomeControllerStoreBaseActionController.startAction(
        name: 'HomeControllerStoreBase.setIndexSelected');
    try {
      return super.setIndexSelected(index);
    } finally {
      _$HomeControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
