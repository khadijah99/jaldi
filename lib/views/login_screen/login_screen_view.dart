import 'package:flutter/material.dart';
import 'package:jaldi/core/constants/app_assets.dart';
import 'package:jaldi/core/providers/authentication_provider.dart';
import 'package:jaldi/widgets/dumb_widgets/inkwell_text.dart';
import 'package:jaldi/widgets/dumb_widgets/login_textfield.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'login_screen_view_model.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginScreenViewModel>.reactive(
      builder:
          (BuildContext context, LoginScreenViewModel viewModel, Widget? _) {
        return Scaffold(
          body: Container(
              //Setting the background here.
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.loginBG),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(70.0),
                child: Row(
                  children: [
                    /////////////////Left container START//////////////
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
                                  Image.asset(AppAssets.jaldiYellowLogo),
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
                              AppAssets.jaldiBigLogo,
                            )),
                            const Text("© 2022 Jaldi.",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey))
                          ],
                        ),
                      ),
                    ),
                    /////////////////Left container END///////////////////////////////
                    /////////////////Right container (Login Frame) START//////////////
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height:
                                  viewModel.errorMessage == null ? 384 : 400,
                              width: 416,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFE8E3FB)),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 96,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xFFE8E3FB)),
                                        color: const Color(0xFFFBFCFF),
                                        borderRadius: const BorderRadius.only(
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
                                            color: const Color(0xFF244494),
                                            icon: viewModel.obscureText
                                                ? const Icon(Icons.visibility)
                                                : const Icon(
                                                    Icons.visibility_off),
                                            onPressed: () {
                                              viewModel.toggleObscureText();
                                            },
                                          ),
                                        ),
                                        viewModel.errorMessage != null
                                            ? Text(
                                                viewModel.errorMessage!,
                                                style: const TextStyle(
                                                    color: Colors.red),
                                              )
                                            : Container(),
                                        const SizedBox(height: 25),
                                        ElevatedButton(
                                          onPressed: () {
                                            viewModel.login(context);
                                            //  context.vRouter.to("/leads");
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
                                          child:
                                              Consumer<AuthenticationProvider>(
                                                  builder:
                                                      (context, value, child) {
                                            return value.isLoading
                                                ? const CircularProgressIndicator()
                                                : Text(
                                                    'Login',
                                                    style: TextStyle(
                                                        color: viewModel
                                                            .loginButtonTextColor,
                                                        fontSize: 16),
                                                  );
                                          }),
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
                    /////////////////Right container (Login Frame) END//////////////
                  ],
                ),
              )),
        );
      },
      viewModelBuilder: () => LoginScreenViewModel(context),
    );
  }
}
