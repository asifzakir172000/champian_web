import 'package:champian_web/style_guide/colors.dart';
import 'package:champian_web/style_guide/text.dart';
import 'package:flutter/material.dart';

enum GenderSlection { male, female, other }
enum CategorySelection { school, Jr, sr }

class StudentRegistration extends StatefulWidget {
  @override
  _StudentRegistrationState createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  int _currentStep = 0;
  GenderSlection gender = GenderSlection.male;
  String birthDateInString = "Plase select a date of birth";
  DateTime birthDate = new DateTime.now();
  CategorySelection categorySelection = CategorySelection.school;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        color: primaryColor,
        child: Center(
          child: Container(
            height: queryData.size.height * 0.8,
            width: queryData.size.width,
            margin: EdgeInsets.only(
                right: queryData.size.width * 0.15,
                left: queryData.size.width * 0.15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Stepper(
                    type: StepperType.vertical,
                    physics: ScrollPhysics(),
                    currentStep: _currentStep,
                    onStepTapped: (step) => tapped(step),
                    steps: <Step>[
                      //Name
                      Step(
                        title: smallTextView(msg: 'General', color: whiteColor),
                        subtitle: smallTextView(
                            msg: 'Name Application', color: grey, textSize: 12),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20),
                              child: smallTextView(
                                msg:
                                    'Enter correct name and details given in this application will be printed in the NTS Ceritificate.',
                                color: whiteColor,
                                textSize: 14,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 20, right: 20, left: 20),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Frist Name",
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: 20,
                                      top: 20,
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Last Name",
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Row(
                                      children: [
                                        Radio(
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => primaryColor),
                                          value: GenderSlection.male,
                                          groupValue: gender,
                                          onChanged: (GenderSlection? value) {
                                            setState(() {
                                              gender = value!;
                                            });
                                          },
                                        ),
                                        smallTextView(
                                            msg: 'Male', color: whiteColor),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Row(
                                      children: [
                                        Radio(
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => primaryColor),
                                          value: GenderSlection.female,
                                          groupValue: gender,
                                          onChanged: (GenderSlection? value) {
                                            setState(() {
                                              gender = value!;
                                            });
                                          },
                                        ),
                                        smallTextView(
                                            msg: 'Female', color: whiteColor),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => primaryColor),
                                        value: GenderSlection.other,
                                        groupValue: gender,
                                        onChanged: (GenderSlection? value) {
                                          setState(() {
                                            gender = value!;
                                          });
                                        },
                                      ),
                                      smallTextView(
                                          msg: 'Other', color: whiteColor),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20),
                              child: GestureDetector(
                                child: Row(
                                  children: [
                                    new Icon(
                                      Icons.calendar_today,
                                      color: whiteColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: smallTextView(
                                          msg: birthDateInString,
                                          color: whiteColor),
                                    )
                                  ],
                                ),
                                onTap: () async {
                                  final datePick = await showDatePicker(
                                      context: context,
                                      initialDate: new DateTime.now(),
                                      firstDate: new DateTime(1900),
                                      lastDate: new DateTime(2100));
                                  if (datePick != null &&
                                      datePick != birthDate) {
                                    setState(
                                      () {
                                        birthDate = datePick;
                                        // isDateSelected=true;

                                        // put it here
                                        birthDateInString =
                                            "${birthDate.month}-${birthDate.day}-${birthDate.year}"; // 08/14/2019
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 150,
                              margin: EdgeInsets.only(top: 30.0, left: 20),
                              child: ElevatedButton(
                                onPressed: () => continued(),
                                child: Text('Next'),
                              ),
                            ),
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 0
                            ? StepState.complete
                            : StepState.disabled,
                      ),

                      //Address/Contact
                      Step(
                        title: smallTextView(
                            msg: 'Address/Contact Number', color: whiteColor),
                        subtitle: smallTextView(
                            msg: 'Application Address',
                            color: grey,
                            textSize: 12),
                        content: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 20, right: 20, left: 20),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "State",
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: 20,
                                      top: 20,
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Distric",
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 30.0,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(right: 20, left: 20),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: "Email ID",
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: 20,
                                      ),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: "Phone number",
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 30, right: 20, left: 20),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Parent Contact number",
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 150,
                                  margin: EdgeInsets.only(top: 30.0, left: 20),
                                  child: ElevatedButton(
                                    onPressed: () => cancel(),
                                    child: Text('Privious'),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 150,
                                  margin: EdgeInsets.only(top: 30.0, left: 20),
                                  child: ElevatedButton(
                                    onPressed: () => continued(),
                                    child: Text('Next'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 1
                            ? StepState.complete
                            : StepState.disabled,
                      ),

                      //student Details
                      Step(
                        title: smallTextView(
                            msg: 'Institution Details', color: whiteColor),
                        subtitle: smallTextView(
                            msg: 'Student Details', color: grey, textSize: 12),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20),
                              child: smallTextView(
                                msg:
                                    'Instruction for madrasa, Diploma, ITi, NIOS studennt',
                                color: whiteColor,
                                textSize: 14,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Row(
                                      children: [
                                        Radio(
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => primaryColor),
                                          value: CategorySelection.school,
                                          groupValue: categorySelection,
                                          onChanged:
                                              (CategorySelection? value) => {
                                            setState(() {
                                              categorySelection = value!;
                                            })
                                          },
                                        ),
                                        smallTextView(
                                            msg: 'School', color: whiteColor),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Row(
                                      children: [
                                        Radio(
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => primaryColor),
                                          value: CategorySelection.Jr,
                                          groupValue: categorySelection,
                                          onChanged:
                                              (CategorySelection? value) => {
                                            setState(() {
                                              categorySelection = value!;
                                            })
                                          },
                                        ),
                                        smallTextView(
                                            msg: 'Juniour College',
                                            color: whiteColor),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => primaryColor),
                                        value: CategorySelection.sr,
                                        groupValue: categorySelection,
                                        onChanged: (CategorySelection? value) =>
                                            {
                                          setState(() {
                                            categorySelection = value!;
                                          })
                                        },
                                      ),
                                      smallTextView(
                                          msg: 'Seniour College',
                                          color: whiteColor),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(right: 20, left: 20, top: 20),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText:
                                      "Name of your School / College / Institution",
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                right: 20,
                                left: 20,
                                top: 20,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Current Class / Year",
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                right: 20,
                                left: 20,
                                top: 20,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Language",
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 150,
                                  margin: EdgeInsets.only(top: 30.0, left: 20),
                                  child: ElevatedButton(
                                    onPressed: () => cancel(),
                                    child: Text('Privious'),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 150,
                                  margin: EdgeInsets.only(top: 30.0, left: 20),
                                  child: ElevatedButton(
                                    onPressed: () => continued(),
                                    child: Text('Finish'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 1
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
