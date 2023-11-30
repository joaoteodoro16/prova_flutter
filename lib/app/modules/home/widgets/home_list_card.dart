import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova_flutter/app/core/widgets/confirm_action.dart';
import 'package:prova_flutter/app/modules/home/home_controller_store.dart';

class HomeListCard extends StatelessWidget {
  final String note;
  final int index;
  final TextEditingController noteController;
  const HomeListCard(
      {super.key,
      required this.note,
      required this.index,
      required this.noteController});

  @override
  Widget build(BuildContext context) {
    final _controller = Modular.get<HomeControllerStore>();

    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.grey.withOpacity(0.7)))),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                note,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    noteController.text = note;
                    _controller.setIndexSelected(index);
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    ConfirmAction.showConfirmDelete(
                      context: context,
                      onClickConfirm: () async {
                        await _controller.deleteNote(index: index);
                      },
                      title: 'Atenção!',
                      message: 'Deseja realmente excluir essa nota?'
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 30,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
