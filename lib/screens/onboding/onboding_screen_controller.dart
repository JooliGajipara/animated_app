import 'package:get/get.dart';
import 'package:rive/rive.dart';

import 'components/sign_in_dialog.dart';

class OnBodingScreenController extends GetxController {
  late RiveAnimationController btnAnimationController;

  bool isShowSignInDialog = false;

  @override
  void onInit() {
    btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.onInit();
  }

  void onTapBtn(context){
    btnAnimationController.isActive = true;
    Future.delayed(
      const Duration(milliseconds: 800),
          () {
          isShowSignInDialog = true;
        showCustomDialog(
          context,
          onValue: (_) {
              isShowSignInDialog = false;
          },
        );
      },
    );
    update();
  }
}
