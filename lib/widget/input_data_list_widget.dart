import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:synapsis_test/core/theme.dart';
import 'package:synapsis_test/pages/b_page/b_state.dart';
import 'package:synapsis_test/widget/bottom_sheet_widget.dart';
import 'package:synapsis_test/widget/text_field_widget.dart';

class InputDataListWidget extends StatefulWidget {
  const InputDataListWidget({Key? key}) : super(key: key);

  @override
  State<InputDataListWidget> createState() => _InputDataListWidgetState();
}

class _InputDataListWidgetState extends State<InputDataListWidget> {
  final BState state = Get.put(BState());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => state.isLoadingData.value
          ? Center(
              child: CircularProgressIndicator(
                color: backgroundColor,
              ),
            )
          : state.dataList.isEmpty
              ? Text(
                  'No Data',
                  style: heading1Style,
                )
              : Flexible(
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 42),
                    itemCount: state.dataList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text('${state.dataList[index]['title']}'),
                          subtitle: Text('${state.dataList[index]['date']}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.qr_code,
                                color: backgroundColor,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              GestureDetector(
                                onTap: () {
                                  state.getById(state.dataList[index]['id']);
                                  renderBottomSheet(
                                      state.dataList[index]['id']);
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.green.shade700,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              GestureDetector(
                                onTap: () {
                                  state.delete(state.dataList[index]['id']);
                                  state.getAll();
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }

  renderBottomSheet(int id) {
    BottomSheetWidget.getBottomSheetWidget(
      context,
      [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Edit Text',
          style: heading1Style.copyWith(
            fontSize: 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 28,
        ),
        TextFieldWidget(
          controller: state.inputText,
          hint: 'Input text here',
        ),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
            backgroundColor: primaryColor,
          ),
          onPressed: () async {
            state.update(id);
            state.getAll();
            Navigator.pop(context);
          },
          child: Text('Edit Text'),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
