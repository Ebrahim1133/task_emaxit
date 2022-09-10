import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/colors.dart';
import '../widgets/custom_appbar_widget.dart';
import '../widgets/rec_item.dart';
import '../widgets/search_form_field.dart';
import 'create_new_rec_screen.dart';
import 'cubit/rec_list_cubit.dart';

class RecListScreen extends StatefulWidget {
  RecListScreen({Key? key}) : super(key: key);

  @override
  State<RecListScreen> createState() => _RecListScreenState();
}

class _RecListScreenState extends State<RecListScreen> {
  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecListCubit()
        ..getData()
        ..postData(),
      child: BlocConsumer<RecListCubit, RecListState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'سندات الصرف',
              onPressed: () {
                RecListCubit.get(context).postData();
              },
              isIcon: false,
            ),
            body: Column(
              children: [
                SearchFormField(
                  searchTextController: searchTextController,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    width: 380,
                    height: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: secondaryBackgroundColor),
                    child: ListView.builder(
                        itemCount:
                            RecListCubit.get(context).dataModel.Data?.length,
                        itemBuilder: (context, index) => RecItem(
                            dataModel: RecListCubit.get(context)
                                .dataModel
                                .Data![index])),
                  ),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => CreateNewRecScreen()));
              },
              backgroundColor: floatButtomColor,
              child: const Icon(
                Icons.add,
                color: secondaryBackgroundColor,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
