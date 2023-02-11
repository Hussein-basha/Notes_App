part of 'read_notes_cubit.dart';

@immutable
abstract class ReadNotesState {}

class ReadNotesInitial extends ReadNotesState {}
class ReadNotesSuccess extends ReadNotesState {}
class ReadNotesGetSearchLoadingState extends ReadNotesState {}
class ReadNotesGetSearchSuccessState extends ReadNotesState {}
class ReadNotesGetSearchErrorState extends ReadNotesState {
  final String error;

  ReadNotesGetSearchErrorState(this.error);
}
