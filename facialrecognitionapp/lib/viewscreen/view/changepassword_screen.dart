import 'package:facialrecognitionapp/model/changepassword_screen_model.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const routeName = '/changePasswordScreen';

  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChangePasswordState();
  }
}

class _ChangePasswordState extends State<ChangePasswordScreen> {
  late _Controller con;
  late ChangePasswordScreenModel screenModel;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
    screenModel = ChangePasswordScreenModel();
  }

  void render(fn) => setState(fn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Password',
        ),
      ),
      body: changePasswordForm(),
    );
  }

  Widget changePasswordForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(children: [
            Text(
              'Please Enter',
              style: Theme.of(context).textTheme.headline3,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Current Password',
              ),
              obscureText: true,
              autocorrect: false,
              validator: screenModel.validatePassword,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'New Password',
              ),
              autocorrect: false,
              obscureText: true,
              validator: screenModel.validatePassword,
              onSaved: screenModel.savePassword,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'New Password Confirm',
              ),
              autocorrect: false,
              obscureText: true,
              validator: screenModel.validatePassword,
            ),
            ElevatedButton(
              onPressed: con.changePassword,
              child: Text(
                'Submit',
                style: Theme.of(context).textTheme.button,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
          ]),
        ),
      ),
    );
  }
}

class _Controller {
  _ChangePasswordState state;
  _Controller(this.state);

  void changePassword() {}
}
