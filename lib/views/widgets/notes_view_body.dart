import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/views/widgets/search_screen.dart';
import 'custom_app_bar_note.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBarNote(
            title: 'Notes',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteSearchScreen(),
                ),
              );
            },
            icon: Icons.search,
          ),
          const Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
