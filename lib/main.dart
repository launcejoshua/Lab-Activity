import 'package:flutter/material.dart';

void main() {
  runApp(ToDoo());
}

class ToDoo extends StatefulWidget {
  const ToDoo({super.key});

  @override
  State<ToDoo> createState() => _ToDooState();
}

class _ToDooState extends State<ToDoo> {
  List<String> ind = [];
  var item = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: item,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ind.add(item.text);
                        });
                      },
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: ind.length,
                  itemBuilder: (context, index) =>
                      todoItem(index + 1, ind[index], ind),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class todoItem extends StatelessWidget {
  todoItem(this.index, this.item, List<String> ind, {super.key});

  String item;
  int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
          title: Text(item),
          tileColor: index % 2 == 0 ? Colors.blue : Colors.red),
    );
  }
}
