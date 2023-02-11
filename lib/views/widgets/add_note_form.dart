import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'colors_list_view.dart';
import 'custom_button.dart';
import 'custom_text_field_add_note.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    Key? key,
  }) : super(key: key);


  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> fKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          CustomTextFieldAddNote(
            hint: 'Title',
            onSave: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextFieldAddNote(
            hint: 'Content',
            maxLines: 6,
            onSave: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return buildCustomButton(state, context);
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  CustomButton buildCustomButton(AddNoteState state, BuildContext context) {
    return CustomButton(
      isLoading: state is AddNoteLoading ? true : false,
      onTap: () {
        if (fKey.currentState!.validate()) {
          fKey.currentState!.save();
          var currentDate = DateTime.now();
          var formattedCurrentDate =
              DateFormat.yMMMMEEEEd().format(currentDate);
          var noteModel = NoteModel(
            title: title!,
            subTitle: subTitle!,
            date: formattedCurrentDate,
            color: Colors.yellow.value,
          );
          BlocProvider.of<AddNoteCubit>(context).addNot(noteModel);
        } else {
          autoValidateMode = AutovalidateMode.always;
          setState(() {});
        }
      },
    );
  }
}


