import 'package:flutter/material.dart';

import 'package:synapsis_test/core/theme.dart';

class BottomSheetWidget {
  static getBottomSheetWidget(BuildContext context, List<Widget> children,
      {Function()? onClose}) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.black.withOpacity(0.8),
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              if (onClose != null) {
                onClose();
              }
              return true;
            },
            child: SafeArea(
              bottom: false,
              child: Container(
                padding: const EdgeInsets.only(top: paddingL),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: paddingS,
                      width: paddingXXXL,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(paddingXXL),
                        color: backgroundColor2,
                      ),
                    ),
                    const SizedBox(
                      height: paddingM,
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: paddingXL,
                        ),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(paddingL),
                              topRight: Radius.circular(paddingL)),
                          color: backgroundColor2,
                        ),
                        child: SafeArea(
                          child: ListView(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            padding: EdgeInsets.only(
                                left: paddingXL,
                                right: paddingXL,
                                bottom: paddingXL +
                                    MediaQuery.of(context).viewInsets.bottom),
                            children: children,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
