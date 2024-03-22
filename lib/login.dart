import 'package:flutter/material.dart';
import 'package:frederick190/home.dart';

class LoginPage extends StatefulWidget {
  final String? message;

  const LoginPage({Key? key, this.message}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passController = TextEditingController();
  String? message;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    message = widget.message;
  }

  Widget _inputField(String hintText,
      {bool isPassword = false, TextEditingController? controller}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return isPassword ? 'Password tidak boleh kosong' : 'Email tidak boleh kosong';
          }
          if (hintText == 'Email' && !value.contains('@')) {
            return 'Email tidak valid';
          }
          if (isPassword && value.length < 8) {
            return 'Password harus lebih dari 8 karakter';
          }
          return null;
        },
      ),
    );
  }

  Widget _elevatedButton(String text, BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8.0, 25.0, 8.0, 0.0),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final String username = userController.text.trim();
            final String password = passController.text.trim();
            if (username.endsWith("@gmail.com") && password.length > 8) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            } else {
              setState(() {
                message = "Login Gagal";
              });
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message!)));
            }
          }
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(380, 60),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 30.0),
                  child: Text(
                    "Selamat Datang",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text(
                  'Email',
                  textAlign: TextAlign.left,
                ),
                _inputField("Email", controller: userController),
                Text(
                  'Password',
                  textAlign: TextAlign.left,
                ),
                _inputField("Password", controller: passController, isPassword: true),
                if (message != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 20.0, 8.0, 0.0),
                    child: Text(message!,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                _elevatedButton("Sign in", context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
