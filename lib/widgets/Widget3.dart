import 'package:flutter/material.dart';

class DraggerImage extends StatefulWidget {
  const DraggerImage({super.key});

  @override
  State<DraggerImage> createState() => _DraggerImageState();
}

class _DraggerImageState extends State<DraggerImage> {
  Offset _offset = const Offset(50, 50);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(builder: (context, contraints) {
        return Stack(
          children: [
            Positioned(
                left: _offset.dx,
                top: _offset.dy,
                child: LongPressDraggable(
                  feedback: Image.asset(
                    'assets/volvo.png',
                    height: 100,
                    color: Colors.orange,
                    //colorBlendMode: BlendMode.colorBurn,
                  ),
                  child: Image.asset(
                    'assets/volvo.png',
                    height: 50,
                  ),
                  onDragEnd: (details) {
                    setState(() {
                      double adjustement = MediaQuery.of(context).size.height -
                          contraints.maxHeight;
                      _offset = Offset(
                          details.offset.dx, details.offset.dy - adjustement);
                    });
                  },
                ))
          ],
        );
      }),
    );
  }
}

class ZoomInteractive extends StatefulWidget {
  const ZoomInteractive({super.key});

  @override
  State<ZoomInteractive> createState() => _ZoomInteractiveState();
}

class _ZoomInteractiveState extends State<ZoomInteractive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(double.infinity),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('zoomed Widget'),
            ),
          )),
    );
  }
}

class SliceVisuals1 extends StatefulWidget {
  const SliceVisuals1({super.key});

  @override
  State<SliceVisuals1> createState() => _SliceVisuals1State();
}

class _SliceVisuals1State extends State<SliceVisuals1> {
  final List<String> items = List.generate(30, (int index) => 'A $index');

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      children: List.generate(
          items.length,
          (item) => ListTile(
                key: Key('$item'),
                title: Text('Item Number ${items[item]}'),
                trailing: const Icon(Icons.drag_handle_rounded),
                tileColor: item.isOdd ? Colors.orange : Colors.blueAccent,
              )),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final String item = items.removeAt(oldIndex);

          items.insert(newIndex, item);
        });
      },
    );
  }
}

class CheckIt extends StatefulWidget {
  const CheckIt({super.key});

  @override
  State<CheckIt> createState() => _CheckItState();
}

class _CheckItState extends State<CheckIt> {
  bool? checked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CheckboxListTile(
        activeColor: Colors.orangeAccent,
        title: const Text("Check The Value"),
        value: checked,
        onChanged: (bool? newvalue) {
          setState(() {
            checked = newvalue;
          });
        },
        tileColor: Colors.white10,
        subtitle: const Text('SubTitle'),
        checkColor: Colors.black45,
        controlAffinity: ListTileControlAffinity.leading,
        tristate: true,
      ),
    );
  }
}

class ImageAvatar extends StatelessWidget {
  const ImageAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/volvo.png'),
        backgroundColor: Colors.transparent,
        radius: 90,
        child: Text(
          'Hi',
          style: TextStyle(fontSize: 40, color: Colors.red),
        ),
      ),
    );
  }
}

class MyTable extends StatelessWidget {
  const MyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder.all(color: Colors.grey),
            children: [
              const TableRow(
                  decoration: BoxDecoration(color: Colors.red),
                  children: [
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text('HEAD1'),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text('HEAD2'),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text('HEAD3'),
                        )),
                  ]),
              ...List.generate(
                  20,
                  (index) => TableRow(children: [
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text('Cont c $index'),
                            )),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Cont C $index'),
                          ),
                        ),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Cont C $index'),
                            )),
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}

class Alerting extends StatefulWidget {
  const Alerting({super.key});

  @override
  State<Alerting> createState() => _AlertingState();
}

class _AlertingState extends State<Alerting> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Close"))
                      ],
                      contentPadding: const EdgeInsets.all(20.0),
                      content: const Text("Alert Content/Body "),
                      title: const Text("Alert Title "),
                    ));
          },
          child: const Text("SHOW ALERT BOX")),
    );
  }
}

class WidgetAnimatedContainer extends StatefulWidget {
  const WidgetAnimatedContainer({super.key});

  @override
  State<WidgetAnimatedContainer> createState() =>
      _WidgetAnimatedContainerState();
}

class _WidgetAnimatedContainerState extends State<WidgetAnimatedContainer> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          color: Colors.black12,
          height: _selected ? 200 : 100,
          width: _selected ? 100 : 200,
          alignment:
              _selected ? Alignment.center : AlignmentDirectional.topCenter,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(seconds: 1),
          child: const FlutterLogo(size: 75),
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.orangeAccent,
        elevation: 40,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            const Text("Card First Text"),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: const Text('Card ADD'))
          ]),
        ),
      ),
    );
  }
}

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({super.key});

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateTime choicedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              "${choicedDate.year} - ${choicedDate.month} - ${choicedDate.day} "),
          ElevatedButton(
              onPressed: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: choicedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (selectedDate != null) {
                  setState(() {
                    choicedDate = selectedDate;
                  });
                }
              },
              child: const Text('Choice Date'))
        ],
      ),
    );
  }
}

class MyTimePicker extends StatefulWidget {
  const MyTimePicker({super.key});

  @override
  State<MyTimePicker> createState() => _MyTimePickerState();
}

class _MyTimePickerState extends State<MyTimePicker> {
  TimeOfDay time = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("${time.hour} - ${time.minute}"),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () async {
                TimeOfDay? selectedTime =
                    await showTimePicker(context: context, initialTime: time);
                if (selectedTime != null) {
                  setState(() {
                    time = selectedTime;
                  });
                }
              },
              child: const Text("Choice time "))
        ],
      ),
    );
  }
}

class MyDateRange extends StatefulWidget {
  const MyDateRange({super.key});

  @override
  State<MyDateRange> createState() => _MyDateRangeState();
}

class _MyDateRangeState extends State<MyDateRange> {
  DateTimeRange daterange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${daterange.duration.inDays}"),
          ElevatedButton(
              onPressed: () async {
                DateTimeRange? selectedRange = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100));
                if (selectedRange != null) {
                  setState(() {
                    daterange = selectedRange;
                  });
                }
              },
              child: const Text('Choice Date Range'))
        ],
      ),
    );
  }
}

class MyDismiss extends StatefulWidget {
  const MyDismiss({super.key});

  @override
  State<MyDismiss> createState() => _MyDismissState();
}

class _MyDismissState extends State<MyDismiss> {
  List<int> items = List.generate(6, (index) => index);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
            background: Container(
              color: Colors.red,
              child: const Icon(Icons.delete),
            ),
            key: ValueKey<int>(items.length),
            onDismissed: (DismissDirection direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            child: ListTile(
              title: Text("item content ${items[index]} index"),
            ));
      },
    );
  }
}

class MyScroldragsheet extends StatelessWidget {
  const MyScroldragsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(builder: (context, scrollController) {
      return ListView.builder(
          itemCount: 20,
          controller: scrollController,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  tileColor: index.isOdd ? Colors.amberAccent : Colors.white,
                  title: Text("Items $index"),
                ),
              ));
    });
  }
}

class MyFadeImages extends StatefulWidget {
  const MyFadeImages({super.key});

  @override
  State<MyFadeImages> createState() => _MyFadeImagesState();
}

class _MyFadeImagesState extends State<MyFadeImages> {
  bool _fade = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection: VerticalDirection.down,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
          height: 80,
        ),
        TextButton(
            onPressed: () {
              setState(() {
                _fade = !_fade;
              });
            },
            child: const Text("Switch ..")),
        AnimatedCrossFade(
            firstChild: Image.asset('assets/volvo.png',
                height: 120, width: double.infinity),
            secondChild: SizedBox(
              width: double.infinity,
              height: 120,
              child: Container(
                color: Colors.orangeAccent,
                padding: const EdgeInsets.all(9.0),
                child: const Center(child: Text("animated Container")),
              ),
            ),
            crossFadeState:
                _fade ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(seconds: 1)),
        const MyPopUpMenu(),
      ],
    );
  }
}

class Mydrawer extends StatefulWidget {
  const Mydrawer({super.key});

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Drawer")),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width / 3,
        child: ListView(
          children: const <Widget>[
            ListTile(
              title: Text("Item 1"),
            ),
            ListTile(
              title: Text("Item 2"),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const Text("Open Drawer")),
          ),
          const SizedBox(
            height: 80,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Scaffold.of(context).closeDrawer();
                },
                child: const Text("Close Drawer")),
          ),
        ],
      ),
    );
  }
}

class MyPopUpMenu extends StatefulWidget {
  const MyPopUpMenu({super.key});

  @override
  State<MyPopUpMenu> createState() => _MyPopUpMenuState();
}

class _MyPopUpMenuState extends State<MyPopUpMenu> {
  String title = 'title';
  String item1 = 'item1';
  String item2 = 'item2';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ListTile(
        title: Text(title),
        trailing: PopupMenuButton(
          elevation: 90,
          itemBuilder: (context) => [
            PopupMenuItem(
              value: item1,
              child: Text(item1),
            ),
            PopupMenuItem(
              value: item2,
              child: Text(item2),
            )
          ],
          onSelected: (value) {
            setState(() {
              title = value;
            });
          },
        ),
      ),
    );
  }
}

class MyAutoSizeTextAnimated extends StatefulWidget {
  const MyAutoSizeTextAnimated({super.key});

  @override
  State<MyAutoSizeTextAnimated> createState() => _MyAutoSizeTextAnimatedState();
}

class _MyAutoSizeTextAnimatedState extends State<MyAutoSizeTextAnimated> {
  bool _state = true;
  double _size = 30;
  Color _color = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            height: 120,
            child: Center(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                    color: _color,
                    fontSize: _size,
                    fontWeight: FontWeight.bold),
                child: const Text("Animer Text"),
              ),
            )),
        TextButton(
          onPressed: () {
            setState(() {
              _color = _state ? Colors.orange : Colors.blue;
              _size = _state ? 30 : 20;
              _state = !_state;
            });
          },
          child: const Text("Animate Text"),
        )
      ],
    );
  }
}

class MySuggestionValue extends StatefulWidget {
  const MySuggestionValue({super.key});

  @override
  State<MySuggestionValue> createState() => _MySuggestionValueState();
}

class _MySuggestionValueState extends State<MySuggestionValue> {
  // ignore: non_constant_identifier_names
  List<String> item = ["banana", "tomate", "pomme", "banana2"];
  String selectedValue = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Autocomplete<String>(onSelected: (value) {
          setState(() {
            selectedValue = value;
          });
        }, optionsBuilder: (TextEditingValue newValue) {
          if (newValue.text == "") {
            return const Iterable<String>.empty();
          }

          return item.where(
              (element) => element.contains(newValue.text.toLowerCase()));
        }),
        Text(selectedValue)
      ],
    );
  }
}

class MyEcpanded extends StatefulWidget {
  const MyEcpanded({super.key});

  @override
  State<MyEcpanded> createState() => _MyEcpandedState();
}

class _MyEcpandedState extends State<MyEcpanded> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue,
                    ),
                  ))),
          Expanded(
              flex: 2,
              child: Container(
                height: 120,
                color: Colors.orange,
              )),
          Expanded(
              flex: 2,
              child: Container(
                height: 120,
                color: Colors.red,
              )),
        ],
      ),
    );
  }
}

class MyFlexible extends StatelessWidget {
  const MyFlexible({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            child: Container(
          height: 50,
          color: Colors.amber,
        )),
        Flexible(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 20,
              color: Colors.blue,
              child: const Text("HELLO"),
            ),
            Container(
              height: 20,
              color: Colors.orange,
              child: const Text("HELLOhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"),
            )
          ],
        )),
        Flexible(
            child: Container(
          height: 40,
          color: Colors.amberAccent,
        )),
      ],
    );
  }
}

class MyAspectRatio extends StatelessWidget {
  const MyAspectRatio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: 150,
      color: Colors.amber,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
