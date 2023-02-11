import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import '../edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.note}) : super(key: key);

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return EditNoteView(
            note: note,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24,bottom: 24,left: 16),
        decoration: BoxDecoration(
          color: Color(note.color),//0xffFFCC80
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 16,),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(
                      0.6,
                    ),
                    fontSize: 18,
                  ),
                ),
              ),
              trailing: IconButton(
                  onPressed: ()
                  {
                    note.delete();
                    BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 32,
                    color: Colors.black,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24,),
              child: Text(
                note.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(
                    0.5,
                  ),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
