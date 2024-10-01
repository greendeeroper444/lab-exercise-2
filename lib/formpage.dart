import 'package:flutter/material.dart';
import 'package:lab_exercise_2/views/custombutton.dart';
import 'package:lab_exercise_2/views/customfield.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final txtController = TextEditingController();
  final txtController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation'),
      ),
      body: Form(
          key: _formKey,
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller_: txtController,
                    isPassword_: false,
                    error_: 'The username must not be empty!',
                    hintText_: 'Enter your username',
                    labelText_: 'USERNAME',
                  ),
                  CustomTextField(
                    controller_: txtController1,
                    isPassword_: true,
                    error_: 'The password must not be empty!',
                    hintText_: 'Enter your password',
                    labelText_: 'PASSWORD',
                  ),

                  const SizedBox(height: 20),
                  CustomButton(
                    btnText_: 'LOGIN',
                    onPressed_: () {
                      var input = txtController.text;
                      if (_formKey.currentState?.validate() == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                            content: Text('You entered $input'),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
