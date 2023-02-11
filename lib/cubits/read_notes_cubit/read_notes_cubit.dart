import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../constants/constants.dart';
import '../../models/note_model.dart';

part 'read_notes_state.dart';

class ReadNotesCubit extends Cubit<ReadNotesState> {
  ReadNotesCubit() : super(ReadNotesInitial());

  List<NoteModel>? notes;
  fetchAllNotes() {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      notes = notesBox.values.toList();
      emit(ReadNotesSuccess());
  }

  List<dynamic> search = [];
  void getSearch(String value)
  {
    emit(ReadNotesGetSearchLoadingState());
    try{
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      notes = notesBox.values.toList();
      var sr = value.compareTo(notes.toString());
      emit(ReadNotesGetSearchSuccessState());
    }catch(error){
      emit(ReadNotesGetSearchErrorState(error.toString()));
    }
  }
}
