import 'package:flutter/material.dart';
import './widgets/bannertest.dart';
import './widgets/sheetbotom.dart';
import './widgets/Widget3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Widgets Tuto'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Colors.orange, Colors.blue])),
            child: SafeArea(
                child: Center(
              child: ListTile(
                title: const Text('Prefered Size with SafeArea'),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: Colors.white, size: 20),
                  color: Colors.white,
                ),
              ),
            )),
          ),
        ),
        //const BannerTest(),1//const SheetBotom(),2/const DraggerImage(),3/const ZoomInteractive(),4/
        body: Stack(
          children: const [SliceVisuals1()],
        )
        // const MySuggestionValue(), //auto-completed_input//MyFadeImages(), =>AnimatedCrossFade == replacer widget by widget
        //MyPopUpMenu(), 3 point
        /* BannerTest(),
            SheetBotom(),
            DraggerImage(),
            ZoomInteractive(),
            MyAspectRatio(),
            MySuggestionValue(),
            MyFadeImages(),
            MyPopUpMenu(),
            Alerting(),
            MyFlexible(),
            MyEcpanded(),
            MyAutoSizeTextAnimated(),
            Mydrawer(),
            MyScroldragsheet(),
            MyDismiss(),
            MyDateRange(),
            MyTimePicker(),
            MyDatePicker(),
            MyCard(),
            WidgetAnimatedContainer(),
            Alerting(),
            MyTable(),
            ImageAvatar(),
            CheckIt(),
            SliceVisuals1(),*/
        );
  }
}
