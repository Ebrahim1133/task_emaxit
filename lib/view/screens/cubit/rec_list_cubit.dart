import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_emaxit/network/dio_services.dart';

import '../../../model/data_model.dart';

part 'rec_list_state.dart';

class RecListCubit extends Cubit<RecListState> {
  RecListCubit() : super(RecListInitial());

  static RecListCubit get(context) => BlocProvider.of(context);
  late DataModel dataModel;
  void getData() {
    emit(RecListLoading());
    DioHelper.getData(
            url:
                'rec/GetrecData?user_id=5fa9a1f9-629a-4c40-9826-fc27d7c1b131&searchval')
        .then((value) {
      // print(value.data);
      dataModel = DataModel.fromMap(value.data);

      emit(RecListSuccess(dataModel));
    }).catchError((error) {
      emit(RecListError(error.toString()));
    });
  }

  void postData() {
    emit(RecListLoading());
    DioHelper.postData(url: 'rec/addnewrecdoc', data: {
      'recdocno': 1,
      'recdate': '01/01/2022',
      'recvalue': 500,
      'recuser': 'admin',
      'paytypeid': 1,
      'paytypename': 'نقدي',
      'paychartid': 1,
      'recbranchid': 1,
      'branchname': 'الفرع الرئيسي',
      'recman': 'ahmed atef',
      'recnotes': 'test',
      'payref': 'test',
      'fromchartid': 1,
      'paynotes': 'a',
      'rectype': 1,
      'rectypename': 'مصاريف',
    }).then((value) {
      print(value.data);

      emit(RecListSuccess(dataModel));
    }).catchError((error) {
      emit(RecListError(error.toString()));
    });
  }
}
