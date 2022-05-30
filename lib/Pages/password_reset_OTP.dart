import 'package:flutter/material.dart';
import 'package:snsc/Functions_and_Vars/api_services.dart';
import '../config/accesibility_config.dart';
import '../config/pallete.dart';
import '../widgets/all_widgets.dart';
import 'all_pages.dart';

class PasswordResetOTP extends StatefulWidget {
  final String email;
  final String fullHash;
  const PasswordResetOTP(
      {Key? key, required this.email, required this.fullHash})
      : super(key: key);

  @override
  State<PasswordResetOTP> createState() => _PasswordResetOTPState();
}

class _PasswordResetOTPState extends State<PasswordResetOTP> {
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  late String fullHash;

  validateOTP() async {
    String inputOTP = otp1.text + otp2.text + otp3.text + otp4.text;
    await APIService.verifyOTP(widget.email, inputOTP, fullHash, context);
  }

  @override
  void initState() {
    super.initState();
    fullHash = widget.fullHash;
  }

  void refreshPage() {
    setState(() {
    });
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
                  callBack: refreshPage,
                ),
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
                        "VERIFICATION",
                        style: TextStyle(
                          fontFamily: Preferences.currentFont(),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Pallete.buttonGreen),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 8.0),
                      child: Text(
                        "Enter the One Time Pin (OTP) sent to ${widget.email}",
                        style: TextStyle(
                          fontSize: (MediaQuery.of(context).size.height * 0.02),
                          fontFamily: Preferences.currentFont(),
                          color: Preferences.usingDarkMode()
                              ? Colors.white
                              : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      children: [
                        OTPTextField(
                          first: true,
                          last: false,
                          pinController: otp1,
                        ),
                        OTPTextField(
                          first: false,
                          last: false,
                          pinController: otp2,
                        ),
                        OTPTextField(
                          first: false,
                          last: false,
                          pinController: otp3,
                        ),
                        OTPTextField(
                          first: false,
                          last: true,
                          pinController: otp4,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RoundedRectangleButton(
                        width: 400,
                        onPressed: () {
                          validateOTP();
                        },
                        text: "Verify",
                        buttoncolor: Pallete.buttonBlue,
                        height: 50,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Did not recieve the pin? ",
                          style: TextStyle(
                            fontFamily: Preferences.currentFont(),
                            color: Preferences.usingDarkMode()
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        GestureDetector(
                          onTap: () async {
                            fullHash = await APIService.resendOTP(
                                widget.email, context);
                          },
                          child: Text(
                            "Resend New Code",
                            style: TextStyle(
                              fontFamily: Preferences.currentFont(),
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    )
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
