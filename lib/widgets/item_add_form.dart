import 'package:flutter/material.dart';
import 'package:ostad_task/bloc/image_bloc.dart';

class ItemForm extends StatelessWidget {
  ItemForm({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _priceController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final TextEditingController _descController = TextEditingController();

  final ImageBloc _imgBloc = ImageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<String?>(
            stream: _imgBloc.imgStream,
            builder: (context, imageSnapshot) {
              return Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: "Enter name"),
                  ),
                  TextField(
                    controller: _descController,
                    decoration: const InputDecoration(hintText: "Enter description"),
                  ),
                  TextField(
                    controller: _priceController,
                    decoration: const InputDecoration(hintText: "Enter price"),
                  ),
                  TextField(
                    controller: _dateController,
                    decoration: const InputDecoration(hintText: "Enter Ending date"),
                  ),
                  GestureDetector(
                    onTap: (){
                      _imgBloc.getImageUrl();

                    },
                    child:imageSnapshot.data==null? Image.asset("asset/camera.jpg",height: 100,width: 100,):imageSnapshot.data=="loading"?CircularProgressIndicator():Image.network(imageSnapshot.data!,height: 100,width: 200,)
                  ),
                  TextButton(onPressed: (){

                  }, child: Text("Save"))
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
