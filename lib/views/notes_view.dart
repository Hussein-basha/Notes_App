import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'widgets/add_note_bottom_sheet.dart';
import 'widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // when open keyboard prevent screen from stretch all the app
      resizeToAvoidBottomInset: false,
      body: const NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  24,
                ),
                topRight: Radius.circular(
                  24,
                ),
              ),
            ),
            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
