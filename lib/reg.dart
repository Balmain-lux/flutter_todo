//import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_todo/database/service.dart';
import 'package:flutter_todo/database/service_user.dart';
import 'package:motion_toast/motion_toast.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController rePassController = TextEditingController();
  Services services = Services();
  ServiceUser serviceUser = ServiceUser();

  void toastShowSucces() {
    MotionToast toast = MotionToast.success(
      description: Text("Успешная регистрация"),
    );
    toast.show(context);
  }

  void toastShowError() {
    MotionToast toast = MotionToast.error(
      description: Text("аккаунт не создан, проверьте введенные данные"),
    );
    toast.show(context);
  }

  void toastShowNull() {
    MotionToast toast = MotionToast.error(description: Text("Заполните поля"));
    toast.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("TODO", style: TextStyle(fontSize: 32)),
              const SizedBox(height: 20),

              TextField(
                controller: nicknameController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Nickname',
                  prefixIcon: const Icon(Icons.person),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: emailController,
                obscureText: true,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: passController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: rePassController,
                obscureText: true,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Repeat Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (nicknameController.text.isNotEmpty ||
                        emailController.text.isNotEmpty ||
                        passController.text.isNotEmpty ||
                        rePassController.text.isNotEmpty) {
                      var user = await services.regDatabase(
                        emailController.text,
                        passController.text,
                      );

                      if (user != null) {
                        await serviceUser.userAdd(
                          nicknameController.text,
                          emailController.text,
                          passController.text,
                        );
                        toastShowSucces();
                        Navigator.popAndPushNamed(context, "/home");
                      } else {
                        toastShowError();
                      }
                    } else {
                      toastShowNull();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text('Зарегистрироваться'),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.02,
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        indent: 50,
                        endIndent: 20,
                        thickness: 1,
                        color: Colors.white54,
                      ),
                    ),
                    Text(
                      "ИЛИ",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: MediaQuery.of(context).textScaleFactor * 8,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 20,
                        endIndent: 50,
                        thickness: 1,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("есть аккаунт?"),
                  InkWell(
                    onTap: () {
                      Navigator.popAndPushNamed(
                        context,
                        '/',
                      ); // Исправлено с '/reg' на '/'
                    },
                    child: Text(" войти"),
                  ),
                ],
              ),
              // TextButton(onPressed: () {}, child: Text("Кнопка")),
              // OutlinedButton(
              //   onPressed: () {},
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [Text("Кнопка"), Icon(Icons.add)],
              //   ),
              // ),
              // IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            ],
          ),
        ),
      ),
    );
  }
}
