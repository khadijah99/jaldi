import 'package:flutter/material.dart';
import 'package:jaldi/widgets/dumb_widgets/inkwell_text.dart';
import 'package:jaldi/widgets/dumb_widgets/login_textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:vrouter/vrouter.dart';
import 'login_screen_view_model.dart';

class LoginScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginScreenViewModel>.reactive(
      builder:
          (BuildContext context, LoginScreenViewModel viewModel, Widget? _) {
        return Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/BG-login.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(70.0),
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 448,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                      'assets/images/jaldi-logo-yellow.png'),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text('Welcome to Jaldi',
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  const Text('Stop wasting your leads.',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w100,
                                      )),
                                ]),
                            Center(
                                child: Image.asset(
                              'assets/images/jaldi-big.png',
                              //height: MediaQuery.of(context).size.height,
                            )),
                            const Text("© 2022 Jaldi.",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      // Adjust the flex as needed
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 384,
                              width: 416,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFE8E3FB)),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 96,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFE8E3FB)),
                                        color: Color(0xFFFBFCFF),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8),
                                            topLeft: Radius.circular(8))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Login',
                                              style: TextStyle(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w500)),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Don't have an account?",
                                                style: TextStyle(
                                                    color: Color(0xFF868E96)),
                                              ),
                                              InkWellText(
                                                text: 'Register',
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Email',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        LoginTextField(
                                            hintText: 'Email@email.com',
                                            obscureText: false,
                                            controller:
                                                viewModel.emailController),
                                        const SizedBox(height: 12),
                                        const Text(
                                          'Password',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        LoginTextField(
                                          hintText: 'Type your password',
                                          controller:
                                              viewModel.passwordController,
                                          obscureText: viewModel.obscureText,
                                          suffixIcon: IconButton(
                                            color: Color(0xFF244494),
                                            icon: viewModel.obscureText
                                                ? Icon(Icons.visibility)
                                                : Icon(Icons.visibility_off),
                                            onPressed: () {
                                              viewModel.toggleObscureText();
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: 25),
                                        ElevatedButton(
                                          onPressed: () {
                                            context.vRouter.to("/leads");
                                          },
                                          onHover: (value) {
                                            viewModel.toggleButtonColor(value);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  viewModel.loginButtonColor,
                                              fixedSize: Size(
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  50),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 50,
                                                      vertical: 10),
                                              textStyle: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                                color: viewModel
                                                    .loginButtonTextColor,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            const InkWellText(
                              text: 'Forgot Password?',
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
      viewModelBuilder: () => LoginScreenViewModel(),
    );
  }
}
