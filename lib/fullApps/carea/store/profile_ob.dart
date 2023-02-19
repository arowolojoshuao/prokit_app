import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'profile_ob.g.dart';

class ProfileOb = _ProfileOb with _$ProfileOb;

abstract class _ProfileOb with Store {
  @observable
  XFile? pickedFile;

  @observable
  double pickedValuseOfDropDownMenu1 = 0;

  @observable
  double pickedValuseOfDropDownMenu2 = 0;

  @action
  Future<void> pickImage() async {
    ImagePicker picker = ImagePicker();
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
  }
}
