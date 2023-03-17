import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  RxString imagePath = ''.obs;
  Future getImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  Future getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1200,
      maxHeight: 1200,
    );
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }
}
