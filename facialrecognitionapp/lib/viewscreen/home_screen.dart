import 'package:flutter/material.dart';

import '../controller/auth_controller.dart';
import '../model/home_screen_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeScreen> {
  late _Controller con;
  late HomeScreenModel screenModel;

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
    screenModel = HomeScreenModel(user: Auth.user!);
    //con.loadPhotoMemoList();
  }

  void render(fn) {
    setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home: ${screenModel.user.email}'),
        ),
        drawer: drawerView(),
      ),
    );
  }

  Widget drawerView() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: const Icon(
              Icons.person,
              size: 70.0,
            ),
            accountName: const Text('No profile'),
            accountEmail: Text(
              screenModel.user.email!,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Change Password'),
            onTap: con.changePassword,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sign out'),
            onTap: con.signOut,
          ),
        ],
      ),
    );
  }
}

class _Controller {
  _HomeState state;
  _Controller(this.state);

  void changePassword() {}

  void signOut() {
    Auth.signOut();
  }
}
