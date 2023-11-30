
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova_flutter/app/modules/home/home_controller_store.dart';
import 'package:prova_flutter/app/modules/home/home_page.dart';
import 'package:prova_flutter/app/repositories/note/note_repository.dart';
import 'package:prova_flutter/app/repositories/note/note_repository_impl.dart';
import 'package:prova_flutter/app/services/note/note_service.dart';
import 'package:prova_flutter/app/services/note/note_service_impl.dart';

class HomeModule extends Module{
  
  @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton<NoteRepository>((i) => NoteRepositoryImpl()),
    Bind.lazySingleton<NoteService>((i) => NoteServiceImpl(noteRepository: i())),
    Bind.lazySingleton((i) => HomeControllerStore(noteService: i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) =>  HomePage(controller: Modular.get()),)
  ];


}