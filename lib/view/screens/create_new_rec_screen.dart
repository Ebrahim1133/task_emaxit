import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:task_emaxit/view/screens/rec_list_screen.dart';
import 'package:task_emaxit/view/widgets/custom_appbar_widget.dart';

import '../../dummy/state_servies.dart';
import '../../utils/colors.dart';
import 'cubit/create_rec_cubit.dart';

class CreateNewRecScreen extends StatefulWidget {
  CreateNewRecScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewRecScreen> createState() => _CreateNewRecScreenState();
}

class _CreateNewRecScreenState extends State<CreateNewRecScreen> {
  String selectedValue = "1";
  String selectedValue2 = "1";
  String? userSelected = "";
  Uint8List? _image;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("اشعار خصم"), value: "1"),
      DropdownMenuItem(child: Text("قبض عميل"), value: "2"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> menuItems2 = [
      DropdownMenuItem(child: Text("نقدى"), value: "1"),
      DropdownMenuItem(child: Text("شبكة"), value: "2"),
      DropdownMenuItem(child: Text("فيزا"), value: "3"),
      DropdownMenuItem(child: Text("تحويل بنكى"), value: "4"),
      DropdownMenuItem(child: Text("شيك"), value: "5"),
      DropdownMenuItem(child: Text("دفعات متقدمة"), value: "6"),
    ];
    return menuItems2;
  }

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print('No Image Selected');
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateRecCubit()..getData(),
      child: BlocConsumer<CreateRecCubit, CreateRecState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: "انشاء سند القبض",
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => RecListScreen()));
              },
              isIcon: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.all(12.0),
                    width: 380,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: secondaryBackgroundColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'رقم السند',
                          style: TextStyle(color: hintColor, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.5)),
                          child: Center(
                            child: Text(
                              'تلقائى',
                              style: TextStyle(
                                  color: blackColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'تاريخ السند',
                          style: TextStyle(color: hintColor, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 50, top: 16, bottom: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  color: Colors.grey.withOpacity(0.5)),
                              child: Text(
                                DateFormat("dd/MM/yyyy").format(DateTime.now()),
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 45, right: 20, top: 16, bottom: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topLeft: Radius.circular(10)),
                                  color: Colors.grey.withOpacity(0.5)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat("a").format(DateTime.now()),
                                    style: TextStyle(
                                        color: blackColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    DateFormat("hh:mm ").format(DateTime.now()),
                                    style: TextStyle(
                                        color: blackColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'نوع القبض',
                          style: TextStyle(color: hintColor, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: backgroundColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          value: selectedValue,
                          items: dropdownItems,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.all(12.0),
                    width: 380,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: secondaryBackgroundColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'حساب المسدد',
                          style: TextStyle(color: hintColor, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            cursorColor: blackColor,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.withOpacity(0.5),
                                filled: true,
                                contentPadding: const EdgeInsets.all(20.0),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: hintColor,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'قيمة السند',
                          style: TextStyle(color: hintColor, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: TypeAheadField(
                              noItemsFoundBuilder: (context) => const SizedBox(
                                height: 50,
                                child: Center(
                                  child: Text('لا يوجد اختيار'),
                                ),
                              ),
                              suggestionsBoxDecoration:
                                  const SuggestionsBoxDecoration(
                                      color: Colors.white,
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      )),
                              debounceDuration:
                                  const Duration(milliseconds: 400),
                              textFieldConfiguration: TextFieldConfiguration(
                                  cursorColor: blackColor,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      hintText: "ادخل القيمة....",
                                      contentPadding: const EdgeInsets.only(
                                          top: 14,
                                          left: 5,
                                          bottom: 14,
                                          right: 10),
                                      hintStyle: const TextStyle(
                                          color: hintColor, fontSize: 18),
                                      prefixIcon: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.attach_money,
                                            color: Colors.grey,
                                          )),
                                      fillColor: Colors.grey.withOpacity(0.5),
                                      filled: true)),
                              suggestionsCallback: (value) {
                                return StateService.getSuggestions(value);
                              },
                              itemBuilder: (context, String suggestion) {
                                return Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Text(
                                          suggestion,
                                          maxLines: 1,
                                          // style: TextStyle(color: Colors.red),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                              onSuggestionSelected: (String suggestion) {
                                setState(() {
                                  userSelected = suggestion;
                                });
                              },
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'طرق الدفع',
                          style: TextStyle(color: hintColor, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: backgroundColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          value: selectedValue2,
                          items: dropdownItems2,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue2 = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.all(12.0),
                    width: 380,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: secondaryBackgroundColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            _image != null
                                ? Image(
                                    image: MemoryImage(_image!),
                                  )
                                : TextFormField(
                                    maxLines: 1,
                                    keyboardType: TextInputType.text,
                                    cursorColor: blackColor,
                                    decoration: InputDecoration(
                                        hintText: "لا يوجد صورة مرفقة...",
                                        hintStyle: TextStyle(
                                          color: hintColor,
                                          fontSize: 18,
                                        ),
                                        fillColor: Colors.grey.withOpacity(0.5),
                                        filled: true,
                                        contentPadding:
                                            const EdgeInsets.all(20.0),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 0),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 0),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 0),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.remove_red_eye,
                                          color: backgroundColor,
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            selectImage();
                                          },
                                          icon: Icon(
                                            Icons.camera_alt_outlined,
                                            color: backgroundColor,
                                          ),
                                        )),
                                  ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'ملاحظات',
                          style: TextStyle(color: hintColor, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          maxLines: 10,
                          keyboardType: TextInputType.text,
                          cursorColor: blackColor,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.withOpacity(0.5),
                            filled: true,
                            contentPadding: const EdgeInsets.all(20.0),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
