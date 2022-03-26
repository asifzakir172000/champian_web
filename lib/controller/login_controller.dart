import 'package:champian_web/views/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var checkBox = false;
  var switchContainer = false;
  var isLoading = false;
  var errorMsg = "";

  TextEditingController mobileNumber = TextEditingController();
  TextEditingController opt1Controller = TextEditingController();
  TextEditingController opt2Controller = TextEditingController();
  TextEditingController opt3Controller = TextEditingController();
  TextEditingController opt4Controller = TextEditingController();

  setCheckBox() {
    checkBox = !checkBox;
    update();
  }

  setSwitchContainer() {
    switchContainer = !switchContainer;
    update();
  }

  setLoading({cameFrom}) {
    isLoading = !isLoading;
    update();
    Future.delayed(Duration(seconds: 3)).then((value) => {
          isLoading = !isLoading,
          update(),
          if (cameFrom == "sendOtp")
            {
              Future.delayed(Duration(milliseconds: 400)).then((value) => {
                    setSwitchContainer(),
                  })
            }else{
              Get.off(() => HomeScreen())
            }
        });
  }

  bool isvalide(phoneNumber) {
    if (phoneNumber.length != 10) {
      setErrormsg("Please enter 10 digit phone number");
      return true;
    } else if (!checkBox) {
      return true;
    } else {
      setErrormsg("");
      return false;
    }
  }

  setErrormsg(msg) {
    errorMsg = msg;
    update();
  }

  bool verifyOtp(otp) {
    if (otp != "0000") {
      setErrormsg("InCorrect OTP");
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    mobileNumber.dispose();
    opt1Controller.dispose();
    opt2Controller.dispose();
    opt3Controller.dispose();
    opt4Controller.dispose();
    super.dispose();
  }

  // @override
  // void onInit() {
  //   errorController = StreamController<ErrorAnimationType>();
  //   super.onInit();
  // }

}
