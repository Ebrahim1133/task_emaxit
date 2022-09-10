part of 'rec_list_cubit.dart';

@immutable
abstract class RecListState {}

class RecListInitial extends RecListState {}

class RecListLoading extends RecListState {}

class RecListSuccess extends RecListState {
  final DataModel dataModel;

  RecListSuccess(this.dataModel);
}

class RecListError extends RecListState {
  final String erorr;

  RecListError(this.erorr);
}
