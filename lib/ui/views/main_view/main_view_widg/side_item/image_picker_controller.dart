import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController{
final ImagePicker picker=ImagePicker();
RxString imagePath=RxString("");
@override
  void onInit() {
    super.onInit();
  }
  Future<void> pickImage()async{
    final pickedImage=await picker.pickImage(source:ImageSource.gallery);
    if(pickedImage!=null){
imagePath.value=pickedImage.path;
    }
  }
}