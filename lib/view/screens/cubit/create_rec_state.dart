part of 'create_rec_cubit.dart';

@immutable
abstract class CreateRecState {}

class CreateRecInitial extends CreateRecState {}

class CreateRecLoading extends CreateRecState {}

class CreateRecSuccess extends CreateRecState {
  final PaymentTypeListModel paymentTypeListModel;

  CreateRecSuccess(this.paymentTypeListModel);
}

class CreateRecError extends CreateRecState {
  final String erorr;

  CreateRecError(this.erorr);
}
