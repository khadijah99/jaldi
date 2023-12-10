import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
                  image: AssetImage('assets/images/BG-login.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        // Adjust height according to your requirement
                        height: MediaQuery.of(context).size.height,
                        child: const Center(
                          child: Text('Left Container'),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2, // Adjust the flex as needed
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.visibility),
                                    onPressed: () {
                                      // Implement toggle for password visibility
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  // Implement login functionality
                                },
                                child: Text('Login'),
                              ),
                            ],
                          ),
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
