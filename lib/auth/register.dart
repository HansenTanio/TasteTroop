import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/auth/auth.dart';
import '/auth/components/button.dart';
import '/auth/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool visibilityPass = false;
  bool _validateEmail = false;
  bool _validatePass = false;
  bool _validateConfirmPass = false;
  final Authentication _auth = Authentication();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<bool> _register(
    TextEditingController email,
    TextEditingController pass,
    TextEditingController confirm,
  ) async {
    setState(() {
      _validateEmail = email.text.isEmpty;
      if (pass.text.length < 10 || confirm.text.length < 10) {
        _validatePass = true;
      } else if (pass.text != confirm.text) {
        _validatePass = false;
        _validateConfirmPass = true;
      } else {
        _validatePass = false;
        _validateConfirmPass = false;
      }
    });
    if (_validateEmail == false &&
        _validatePass == false &&
        _validateConfirmPass == false) {
      if (await _auth.register(
          _emailController.text, _passwordController.text)) {
        addUser();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
        return true;
      }
      return false;
    } else {
      return false;
    }
  }

  void addUser() async {
    FirebaseFirestore db = await FirebaseFirestore.instance;
    await db.collection('user').add(
      {
        "Email": _emailController.text,
        "Alamat": [],
        "Label": [],
        "ProfileImage": ""
      },
    );
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
                  width: 150,
                  height: 100,
                  child: Center(
                      child: Text(
                    "Register",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
                ),
                SizedBox(height: 15),
                TextFormField(
                  key: Key("Email"),
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
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
                SizedBox(height: 15),
                TextFormField(
                  key: Key("Password"),
                  obscureText: !visibilityPass,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Kata Sandi",
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
                        : _validateConfirmPass
                            ? "Password Tidak Sama!"
                            : null,
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  key: Key("Confirm"),
                  obscureText: !visibilityPass,
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: "Konfirmasi Kata Sandi",
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
                        : _validateConfirmPass
                            ? "Password Tidak Sama!"
                            : null,
                  ),
                ),
                Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 20)),
                    MyButton(
                      text: 'Register',
                      onpressed: () async {
                        if (await _register(_emailController,
                            _passwordController, _confirmPasswordController)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            registerSuccess(context),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            registerFail(context),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 10),
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
                                    builder: (context) => LoginScreen(),
                                  ));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('atau register dengan'),
                SizedBox(
                  height: 20,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

registerSuccess(BuildContext context) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.green,
    duration: Duration(seconds: 5),
    content: Text('Register Berhasil!'),
    action: SnackBarAction(
      label: 'Tutup',
      textColor: Colors.white,
      onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
    ),
  );
}

registerFail(BuildContext context) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red,
    duration: Duration(seconds: 5),
    content: Text('Akun Sudah Terdaftar'),
    action: SnackBarAction(
      label: 'Tutup',
      textColor: Colors.white,
      onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
    ),
  );
}
