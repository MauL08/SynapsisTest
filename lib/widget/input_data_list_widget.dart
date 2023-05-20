import 'package:flutter/material.dart';
import 'package:synapsis_test/core/theme.dart';

class InputDataListWidget extends StatelessWidget {
  const InputDataListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 42),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('HUHU'),
              subtitle: Text('HUHUHUUHU'),
              trailing: Row(
                children: [
                  Icon(
                    Icons.qr_code,
                    color: backgroundColor,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.green.shade700,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ],
                mainAxisSize: MainAxisSize.min,
              ),
            ),
          );
        },
      ),
    );
  }
}
