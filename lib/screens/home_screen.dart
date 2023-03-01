import 'package:flutter/material.dart';
import 'package:ostad_task/widgets/item_add_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (ctx, index) {
          return Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            child: Column(
              children: [
                Text("Product Name"),
                Text("Description"),
                Text("Price"),
                Text("End Date"),
                Image.network("")
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (builder) => ItemForm(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
