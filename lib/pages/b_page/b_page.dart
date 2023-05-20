import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synapsis_test/core/theme.dart';
import 'package:synapsis_test/pages/b_page/b_state.dart';
import 'package:synapsis_test/widget/bottom_sheet_widget.dart';
import 'package:synapsis_test/widget/input_data_list_widget.dart';
import 'package:synapsis_test/widget/text_field_widget.dart';

class BPage extends StatefulWidget {
  const BPage({super.key});

  @override
  State<BPage> createState() => _BPageState();
}

class _BPageState extends State<BPage> {
  final BState state = Get.put(BState());

  @override
  void initState() {
    super.initState();
    state.initPhoneBuildData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pagePadding,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Obx(
                  () => state.isLoadingPhoneData.value
                      ? Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone_android_rounded,
                              color: secondaryColor,
                              size: 32,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Data SoC',
                              style: heading1Style.copyWith(
                                color: secondaryColor,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Manufacturer :',
                                      style: heading2Style.copyWith(
                                        color: secondaryColor,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '.' * 100,
                                        maxLines: 1,
                                        style: heading2Style.copyWith(
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${state.deviceData['manufacturer']}',
                                      style: heading2Style.copyWith(
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Model :',
                                      style: heading2Style.copyWith(
                                        color: secondaryColor,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '.' * 100,
                                        maxLines: 1,
                                        style: heading2Style.copyWith(
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${state.deviceData['model']}',
                                      style: heading2Style.copyWith(
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Build :',
                                      style: heading2Style.copyWith(
                                        color: secondaryColor,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '.' * 100,
                                        maxLines: 1,
                                        style: heading2Style.copyWith(
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${state.deviceData['device']}',
                                      style: heading2Style.copyWith(
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'SDK :',
                                      style: heading2Style.copyWith(
                                        color: secondaryColor,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '.' * 100,
                                        maxLines: 1,
                                        style: heading2Style.copyWith(
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${state.deviceData['version.sdkInt']}',
                                      style: heading2Style.copyWith(
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Version Code :',
                                      style: heading2Style.copyWith(
                                        color: secondaryColor,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '.' * 100,
                                        maxLines: 1,
                                        style: heading2Style.copyWith(
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${state.deviceData['version.codename']}',
                                      style: heading2Style.copyWith(
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Divider(
                thickness: 2,
                height: 10,
              ),
              const SizedBox(
                height: 8,
              ),
              InputDataListWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: backgroundColor2,
        onPressed: () {
          BottomSheetWidget.getBottomSheetWidget(
            context,
            [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Input Text',
                style: heading1Style.copyWith(
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 28,
              ),
              Text(
                'Text',
                style: heading1Style.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFieldWidget(
                controller: state.inputText,
                hint: 'Input text here',
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Date',
                style: heading1Style.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFieldWidget(
                controller: state.dateText,
                hint: DateTime.now().toString(),
                enabled: false,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: primaryColor,
                ),
                onPressed: () {},
                child: Text('Add Text'),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
