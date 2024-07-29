import 'package:flutter/material.dart';

class SheetBotom extends StatelessWidget {
  const SheetBotom({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            showBottomSheet(
                backgroundColor: Colors.amberAccent,
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 200,
                    child: Center(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Dismiss')),
                    ),
                  );
                });
          },
          child: const Text('show bottom sheet ')),
    );
  }
}
