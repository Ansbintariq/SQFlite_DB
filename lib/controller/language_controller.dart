import 'package:get/get_navigation/src/root/internacionalization.dart';

class Language extends Translations {
  @override

  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'message': 'what is your name',
          'name': 'my name is tariq',
        },
        'ur_PK': {
          'message': 'آپ کا نام کیا ہے',
          'name': 'میرا نام طارق ہے۔',
        }
      };
}
