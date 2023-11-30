import 'package:prova_flutter/app/repositories/note/note_repository.dart';

import './note_service.dart';

class NoteServiceImpl extends NoteService {

  final NoteRepository _repository;

  NoteServiceImpl({required NoteRepository noteRepository}): _repository = noteRepository;
  
  @override
  Future<List<String>?> getNotes() => _repository.getNotes();
  
  @override
  Future<List<String>?> saveNote({required String note}) => _repository.saveNote(note: note);
  
  @override
  Future<List<String>?> deleteNote({required int index}) => _repository.deleteNote(index: index);
  
  @override
  Future<List<String>?> editNote({required int index, required String note}) => _repository.editNote(index: index, note: note);

  
}