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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.gradientBlue,
      ),
      body: Stack(
        children: [
          const ContainerBackgroundLinearGradiente(),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .7,
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
                  HomeTextFormField(
                    controller: _noteEC,
                    focus: _focus,
                    validator: Validatorless.multiple([
                      Validatorless.min(
                          5, 'O texto precisa de pelo menos 5 caracteres!'),
                      Validatorless.required('Campo obrigatório!')
                    ]),
                    
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: PrivacyPoliceButton(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
