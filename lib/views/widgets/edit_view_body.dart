import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar_edit.dart';
import 'custom_text_field_edit_note.dart';
import 'edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBarEditNote(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTitle ?? widget.note.subTitle;
                BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
                widget.note.save();
                Navigator.pop(context);
              },
              title: 'Edit Note',
              icon: Icons.check,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextFieldEditNote(
              onChange: (value) {
                title = value;
              },
              hint: widget.note.title,
              label: 'Title',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFieldEditNote(
              onChange: (value) {
                subTitle = value;
              },
              hint: widget.note.subTitle,
              label: 'Content',
              maxLines: 6,
            ),
            const SizedBox(
              height: 20,
            ),
            EditNoteColorsList(note : widget.note,),
          ],
        ),
      ),
    );
  }
}




