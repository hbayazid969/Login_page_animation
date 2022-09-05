import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:login_page_animation/widget/custom_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObsecure = true;

  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));

    animationController.forward();
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController.reset();
              animationController.forward();
            }
          });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            CachedNetworkImage(
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: FractionalOffset(animation.value, 0),
              imageUrl:
                  "https://cdn.pixabay.com/photo/2018/05/16/22/27/rose-3407234_1280.jpg",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login Page",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Card(
                      elevation: 8,
                      child: Container(
                        height: 60,
                        width: 400,
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (!value!.contains("@")) {
                              return "Invalid Email";
                            }
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              suffix: Icon(Icons.email),
                              labelStyle: TextStyle(color: Colors.teal),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 1)),
                              hintStyle: TextStyle(color: Colors.red),
                              hintText: "Enter your email"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      elevation: 8,
                      child: Container(
                        height: 60,
                        width: 400,
                        child: TextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value) {
                            if (!value!.contains("@")) {
                              return "Invalid password";
                            }
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              suffix: Icon(Icons.password),
                              labelStyle: TextStyle(color: Colors.teal),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 1)),
                              hintStyle: TextStyle(color: Colors.red),
                              hintText: "Enter your Password"),
                        ),
                      ),
                    ),
                    CustomeButton(
                      name: "Login",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          print("okay");
                          print("${_emailController.text}");
                        } else {
                          print("Something wrong");
                        }
                      },
                    ),
                    CustomeButton(
                      name: "Don't have a account ? Register",
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomeButton extends StatelessWidget {
  CustomeButton({this.name, this.onTap});
  String? name;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        color: Colors.black,
        child: Text(
          "${name}",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
