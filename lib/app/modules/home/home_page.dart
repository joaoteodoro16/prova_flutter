import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:prova_flutter/app/core/ui/app_colors.dart';
import 'package:prova_flutter/app/core/widgets/privacy_police_button.dart';
import 'package:prova_flutter/app/modules/home/widgets/home_list_card.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/app/modules/home/widgets/home_text_form_field.dart';
import 'package:validatorless/validatorless.dart';
import '../../core/widgets/container_background_linear_gradiente.dart';
import 'home_controller_store.dart';

class HomePage extends StatefulWidget {
  final HomeControllerStore controller;
  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _noteEC = TextEditingController();
  final _focus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    reaction<List<String>?>((p0) => widget.controller.notes, (p0) {});
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.controller.getAllNotes();
    });
    super.initState();
  }

  @override
  void dispose() {
    _noteEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ContainerBackgroundLinearGradiente(),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .6,
                      child: Card(child: Observer(
                        builder: (context) {
                          return ListView.builder(
                            itemCount: widget.controller.notes.length,
                            itemBuilder: (context, index) {
                              final note = widget.controller.notes[index];
                              return HomeListCard(
                                note: note,
                                index: index,
                                noteController: _noteEC,
                              );
                            },
                          );
                        },
                      )),
                    ),
                    const SizedBox(height: 30,),
                    HomeTextFormField(
                      form: _formKey,
                      controller: _noteEC,
                      focus: _focus,
                      validator: Validatorless.multiple(
                        [
                          Validatorless.min(5, 'O texto precisa de pelo menos 5 caracteres!'),
                          Validatorless.required('Campo obrigatório!')
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const PrivacyPoliceButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
