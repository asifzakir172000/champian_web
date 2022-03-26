import 'dart:convert';
import 'dart:ui';
import 'package:champian_web/style_guide/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils{


  static void snackBar({title,msg}){
    Get.snackbar(
        title,
        msg,
      duration: Duration(milliseconds: 3000),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void showWaitDialogBox({msg}){
    Get.defaultDialog(
        barrierDismissible: false,
        radius: 20,
        title: "",
        content: Container(
          height: 50,
          margin: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircularProgressIndicator(color: primaryColor,),
              SizedBox(width: 20,),
              Text(msg??"Please Wait",
                  textAlign: TextAlign.center,
                  ),
            ],
          ),
        )
    );
  }



  static void successBox({msg}){
    // Future.delayed(const Duration(seconds: 3), (){
    //   Navigator.of(context).pop();
    // });
    Get.defaultDialog(
      barrierDismissible: false,
      radius: 20,
      content: Container(
        height: 200,
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(msg,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black, fontFamily: 'Poppins')),
          ],
        ),
      )
    );
  }

  static void showDialogBox({title, msg, buttonTitle, bool? cancel}) {
    Get.defaultDialog(
      barrierDismissible: false,
      title: "",
      radius: 20,
      content: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              title,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              msg,
            ),
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: cancel!,
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          gradient: linearGradient,
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor,
                        ),
                        child: Center(
                          child: Text(
                            "Cancel",
                          ),
                        ),
                      ),
                    ),
                    maintainSize: false,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          gradient: linearGradient,
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor,
                        ),

                        child: Center(
                          child: Text(
                            buttonTitle,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showDialogBoxWithFunc({ title,msg, fun, bool? cancel, wid}) {
    Get.defaultDialog(
      barrierDismissible: false,
      radius: 20,
      title: "",
      content: Container(
        width: wid,
        height: wid,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                title!,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Text(
                  msg!,
                ),
              ),
            ),
            // SizedBox(
            //   height: 70.h,
            // ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: cancel!,
                      child: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                              gradient: linearGradient,
                              borderRadius: BorderRadius.circular(10),
                              color: primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                "Cancel",
                              ),
                            ),
                          ),
                      ),
                    maintainSize: false,
                    ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: fun,
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          gradient: linearGradient,
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor,
                        ),

                        child: Center(
                          child: Text(
                            "Ok",
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getJsonOnlyHeader() {
    return {'Accept': 'application/json', 'Content-Type': 'application/json'};
  }

  static void writeStorage({key, value}){
     GetStorage getWrite = GetStorage();
     getWrite.write(key, value);
  }

  static void writeMapStorage({key, value}){
    GetStorage getWriteMap = GetStorage();
    getWriteMap.write(key, jsonEncode(value));
  }

  static dynamic readStorage({key}){
    GetStorage getRead = GetStorage();
    return getRead.read(key);
  }

  static readMapStorage({key}){
    GetStorage getReadMap = GetStorage();
    var user = json.decode(getReadMap.read(key));
    return user;
  }

  static dynamic removeStorage(){
    GetStorage getErase = GetStorage();
    return getErase.erase();
  }

  static dynamic removeIndexStorage({key}){
    GetStorage removeIndex = GetStorage();
    return removeIndex.remove(key);
  }

  static void launchURLBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


}