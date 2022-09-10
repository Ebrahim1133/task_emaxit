import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/paymentTypeList_model.dart';
import '../../../network/dio_services.dart';

part 'create_rec_state.dart';

class CreateRecCubit extends Cubit<CreateRecState> {
  CreateRecCubit() : super(CreateRecInitial());

  static CreateRecCubit get(context) => BlocProvider.of(context);
  late PaymentTypeListModel paymentTypeListModel;
  void getData() {
    emit(CreateRecLoading());
    DioHelper.getData(url: 'payment/paytype?model=2').then((value) {
      paymentTypeListModel = PaymentTypeListModel.fromRawJson(value.data);
      print(paymentTypeListModel.Data.toString());

      emit(CreateRecSuccess(paymentTypeListModel));
    }).catchError((error) {
      emit(CreateRecError(error.toString()));
    });
  }
}
