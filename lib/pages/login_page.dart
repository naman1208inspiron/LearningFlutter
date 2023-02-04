import 'package:flutter/material.dart';
import 'package:flutter_console/util/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // underscore se class private ho jaega
  // state class se screen refrersh karne ka mauka milega

  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, Myroutes.homeRoute);
      setState(() {
        // agar back aata hai to
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        //--> scroll view m daal dega
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_page.png",
              fit: BoxFit.cover,
              // height: 500,
            ),
            const SizedBox(
              // here it is used to give space bw the image and the text. using of padding in such case is avoided
              height: 20.0,
              // child: Text("naman"),
            ),
            Text(
              "SWAG se SWAAGAT, $name",
              style: const TextStyle(
                fontSize: 28,
                color: Colors.purple,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Form(
                key: _formkey,
                child: Column(children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "enter username",
                      labelText: "USER ka NAME",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "username do apna";
                      }
                      // if no problem
                      return null;
                    },
                    onChanged: (value) {
                      //jab jab textfield m change hoga tb ek call back milega -> ek string dega --> value --> value given to name.
                      name = value;
                      setState(() {
                        //setstate build method ko dubara call karta hai taaki page refresh ho sake.
                        // hum directly build() fxn call nii kar skte --> code fat jayega
                      });
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "enter password",
                      labelText: "USER ka secret PASSWORD",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
                      } else if (value.length < 6) {
                        return "bada Password do yrr";
                      }
                      // if no problem
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     // minimumSize: Size(150,50),
                  //     elevation: 20,
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30)),
                  //     padding: const EdgeInsets.symmetric(
                  //         vertical: 20, horizontal: 40),
                  //   ),
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, Myroutes.homeRoute);
                  //   },
                  //   child: const Text("login kro"),
                  // )

                  //kisi bhi widget ko clickable banana hai to usko gestureDetector ya inkwell se wrap kar skte hai.
                  // gesture detector doesn't give feedback.
                  // inkwell ka ancestor material hona chaiye for proper functioning.

                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 11),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        // color: Colors.deepPurple,
                        alignment: Alignment.center,
                        // decoration: BoxDecoration(
                        //   color: Colors.deepPurple,
                        //   // borderRadius: BorderRadius.all(Radius.circular(15)),
                        //   borderRadius:
                        //       BorderRadius.circular(changeButton ? 50 : 11),
                        //   // shape:
                        //   //     changeButton ? BoxShape.circle : BoxShape.rectangle,
                        // ),
                        child: changeButton
                            ? const Icon(
                                Icons.done_all_outlined,
                                color: Colors.white,
                              )
                            : const Text("login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),

      // child: Center(
      //   child: const Text(
      //     "Login Page is too small to test things",
      //     style: TextStyle(
      //         fontSize: 40,
      //         color: Colors.deepOrange,
      //         fontWeight: FontWeight.w900)
      //   ),
      // ),
    );
  }
}
