import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ostad_task/services/image_services.dart';

class ImageBloc {
  final _imgStreamController = StreamController<String>();

  StreamSink<String> get _imgSink => _imgStreamController.sink;

  Stream<String> get imgStream => _imgStreamController.stream;

  ImageService _imageService = ImageService();

 Future<void> getImageUrl() async {
 try{
   _imgSink.add("loading");
   final image = await _imageService.loadAssets();
   print("imagePath$image");
   final fileName = DateTime.now().microsecond.toString();
   const destination = 'images/';
   // print("destinaton$destination");
   final storageRef =
   FirebaseStorage.instance.ref(destination).child(fileName);
   print("storageRef$storageRef");
   var storeData = await storageRef.putFile(image);
   print("storData$storeData");
   String url = await storeData.ref.getDownloadURL();
   print("url$url");
   _imgSink.add(url);
 }catch(e){
   print("exception:::$e");
 }
  }
}
