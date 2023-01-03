import 'package:get/get.dart';
import 'package:mvvm_usamaa_app/core/views_models/auth_view_model.dart';
import 'package:mvvm_usamaa_app/core/views_models/cart_view_model.dart';
import 'package:mvvm_usamaa_app/core/views_models/check_out_view_model.dart';
import 'package:mvvm_usamaa_app/core/views_models/control_view_model.dart';
import 'package:mvvm_usamaa_app/core/views_models/home_view_model.dart';
import 'package:mvvm_usamaa_app/helper/local_storage_data.dart';
import 'package:mvvm_usamaa_app/views/screens/home/account_view.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthViewModel());
    Get.put(ControlViewModel());
    Get.put(HomeViewModel());
    Get.put(CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.put(AccountView());
    Get.lazyPut(() => CheckOutViewModel());
  }
}
