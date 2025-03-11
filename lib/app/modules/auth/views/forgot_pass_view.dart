import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:senjayer/app/core/theme.dart';
import 'package:senjayer/widgets/custom_button.dart';
import 'package:senjayer/widgets/custom_textfield.dart';

class ForgotPassView extends StatelessWidget {
  final email_controller = TextEditingController();
  final phone_controller = TextEditingController();
  final password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 120),
              // Logo
              Center(child: Column(children: [Image.asset('assets/logo.png')])),
              const SizedBox(height: 100),

              Center(
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Color.fromARGB(255, 57, 5, 113),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),

                    SizedBox(width: 10),
                    MenuTexts(text: "Mot de passe oublié"),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Sélectionnez les coordonnées  que nous devons utiliser pour réinitialiser votre mot de passe.',
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                  textAlign: TextAlign.start,
                  softWrap: true,
                ),
              ),
              const SizedBox(height: 80),

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: appTheme.appViolet),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        color: Color.fromARGB(99, 58, 0, 120),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Icon(Icons.email, color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        Text(
                          'jy.**ouanvoedo@gmail.com',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // invitation Button
              const SizedBox(height: 90),
              MainButtons(
                text: "Suivant",
                onPressed: () {
                  Get.toNamed('/pass_otp');
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
