import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';

class BannerTest extends StatelessWidget {
  const BannerTest({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                padding: const EdgeInsets.all(20),
                content: const Text('Subsribe'),
                leading: const Icon(Icons.notifications),
                elevation: 4,
                backgroundColor: Colors.black12,
                actions: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .hideCurrentMaterialBanner();
                      },
                      child: const Text('Dismiss'))
                ]));
          },
          child: const Text("Press me")),
    );
  }
}
