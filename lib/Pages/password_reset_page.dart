import 'package:flutter/material.dart';
import 'package:snsc/Functions_and_Vars/api_services.dart';
import '../Functions_and_Vars/functions.dart';
import '../config/accesibility_config.dart';
import '../config/pallete.dart';
import '../widgets/all_widgets.dart';
import 'all_pages.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  _PasswordResetPageState createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  TextEditingController emailController = TextEditingController();

  validateEmail() async {
    await APIService.sendOTP(emailController.text, context);
  }

  void refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(screenWidth < 700
              ? "Assets/background_1.jpg"
              : "Assets/web_background_1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor:
            Preferences.usingDarkMode() ? Colors.black : Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                AppBarReturn(
                    returnPage: const LandingPage(),
                    popContext: true,
                    callBack: refreshPage),
                const Padding(
                  padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                  child: Image(
                    image: AssetImage('Assets/high_res_SNSC_logo.png'),
                    width: 200,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "PASSWORD RESET",
                        style: TextStyle(
                            fontFamily: Preferences.currentFont(),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 8.0),
                      child: Text(
                        "Enter the Email Address associated with your account.You will receive a one time pin (OTP) to verify your identity and reset your password.",
                        style: TextStyle(
                          fontFamily: Preferences.currentFont(),
                          fontSize: (MediaQuery.of(context).size.height * 0.02),
                          color: Preferences.usingDarkMode()
                              ? Colors.white
                              : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    RoundedInputField(
                      hintText: "Email Address",
                      icon: Icons.email,
                      onChanged: (value) {},
                      controller: emailController,
                      validator: Validators.emailValidator,
                      obscure: false,
                      inputType: TextInputType.emailAddress,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RoundedRectangleButton(
                        width: 400,
                        onPressed: () {
                          validateEmail();
                        },
                        text: "Send Reset Link",
                        buttoncolor: Pallete.buttonBlue,
                        height: 50,
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
