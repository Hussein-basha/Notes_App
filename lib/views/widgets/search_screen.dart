import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import '../../components/components.dart';

class NoteSearchScreen extends StatefulWidget {
  NoteSearchScreen({super.key, this.note});

  NoteModel? note;

  @override
  State<NoteSearchScreen> createState() => _NoteSearchScreenState();
}

class _NoteSearchScreenState extends State<NoteSearchScreen> {
  @override
  void initState() {
    BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReadNotesCubit, ReadNotesState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var searchController = TextEditingController();
        var list = BlocProvider.of<ReadNotesCubit>(context).search;
        List<NoteModel> notes = BlocProvider.of<ReadNotesCubit>(context).notes!;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value) {
                    if (value == widget.note?.title ||
                        value == widget.note?.subTitle) {}
                  },
                  onSubmit: (value) {
                    print(value);
                  },
                  onTap: () {},
                  label: 'Search',
                  hint: 'Search',
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Search Must Not Be Empty';
                    }
                    return null;
                  },
                  prefix: Icons.search,
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}
