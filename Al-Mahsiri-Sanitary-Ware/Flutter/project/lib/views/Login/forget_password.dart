import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final emailtext = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  @override
  void dispose() {
    emailtext.dispose();
    super.dispose();
  }

  Future passwordRest() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailtext.text.trim());
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(content: Text("Password resent"));
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(content: Text(e.message.toString()));
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Form(
          key: _keyForm,
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/loginPage");
                      },
                      child: const Padding(
                        padding: const EdgeInsets.all(20),
                        child: Icon(
                          Icons.arrow_back,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Reset Password',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 25),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '    Masukan Email/ No. Hp akun untuk mereset kata\n    sandi Anda ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                        'Email/ Phone',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: TextFormField(
                    controller: emailtext,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: '0787006524',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter an Phone";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: const Color(0xFF3669C9)),
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          passwordRest();
                          // Navigator.pushNamed(context, "/verificationPage");
                        }
                      },
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
