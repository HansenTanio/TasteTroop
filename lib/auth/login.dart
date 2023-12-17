import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/auth/auth.dart';
import '/auth/components/button.dart';
import '/auth/register.dart';
import '/screen/navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Authentication _auth = Authentication();
  bool visibilityPass = false;
  bool _validateEmail = false;
  bool _validatePass = false;
  final _passwordFocusNode = FocusNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late SharedPreferences prefs;
  final String _keyUsername = "username";
  final String _keyPassword = "password";

  Future<void> _rememberMe(String? username, String? password) async {
    prefs = await SharedPreferences.getInstance();
    if (username != null && password != null) {
      prefs.setString(_keyUsername, username);
      prefs.setString(_keyPassword, password);
    }
  }

  Future<bool> _login(
      TextEditingController email, TextEditingController pass) async {
    setState(() {
      _validateEmail = email.text.isEmpty;
      if (pass.text.length < 10) {
        _validatePass = true;
      } else {
        _validatePass = false;
      }
    });
    if (_validateEmail == false && _validatePass == false) {
      if (await _auth.login(
        email.text,
        pass.text,
      )) {
        await _rememberMe(email.text, pass.text);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => navigationScreen(),
          ),
        );
        return true;
      }
      return false;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    icon: Icon(
                      Icons.email,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorText:
                        _validateEmail ? "Email tidak boleh kosong" : null,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: !visibilityPass,
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visibilityPass = !visibilityPass;
                        });
                      },
                      icon: visibilityPass
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                    icon: Icon(
                      Icons.settings,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorText: _validatePass
                        ? "Password harus memiliki minimal 10 karakter"
                        : null,
                  ),
                ),
                SizedBox(height: 5),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Lupa kata sandi"),
                      ),
                    ),
                    MyButton(
                      text: "Login",
                      onpressed: () async {
                        if (await _login(
                            _emailController, _passwordController)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            loginSuccess(context),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            loginFail(context),
                          );
                        }
                      },
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Belum memiliki akun ? ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ));
                            },
                            child: Text("Register"),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Text('atau Login dengan'),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 31,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset('assets/logo/google.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          radius: 31,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset('assets/logo/facebook.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

loginSuccess(BuildContext context) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.green,
    duration: Duration(seconds: 5),
    content: Text('Login Berhasil!'),
    action: SnackBarAction(
      label: 'Tutup',
      textColor: Colors.white,
      onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
    ),
  );
}

loginFail(BuildContext context) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red,
    duration: Duration(seconds: 5),
    content: Text('Akun Tidak Ditemukan!'),
    action: SnackBarAction(
      label: 'Tutup',
      textColor: Colors.white,
      onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
    ),
  );
}
