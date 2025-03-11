import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:senjayer/widgets/custom_button.dart';
import 'package:senjayer/widgets/custom_textfield.dart';

class SignupView extends StatelessWidget {
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
            children: [
              const SizedBox(height: 80),
              // Logo
              Center(child: Column(children: [Image.asset('assets/logo.png')])),
              const SizedBox(height: 80),
              TitleText_1(text: "Inscription"),
              const SizedBox(height: 20),
              // Email Input
              CustomTextField(
                labelText: 'Email',
                controller: email_controller,
                inputType: TextInputType.emailAddress,
                hintText: "votre@mail.com",
              ),
              const SizedBox(height: 16),

              // Password Input
              CustomTextField(
                labelText: 'Numéro de téléphone',
                controller: phone_controller,
                inputType: TextInputType.phone,
                hintText: "+229 01 XX XX XX",
              ),

              const SizedBox(height: 16),

              CustomTextField(
                labelText: 'Mot de passe',
                controller: password_controller,
                hintText: "Votre mot de passe",
                isPassword: true,
              ),

              const SizedBox(height: 16),
              // Password Requirements
              Center(child: Text('Votre mot de passe doit contenir')),
              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 8),
                  Text('Au minimum 6 caractères'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.grey),
                  SizedBox(width: 8),
                  Text('Contenir un caractère ASCII et un chiffre'),
                ],
              ),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(text: "En m’inscrivant, j’accepte les "),
                    TextSpan(
                      text: "conditions",
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                      // recognizer: TapGestureRecognizer()..onTap = onTermsTap,
                    ),
                    TextSpan(text: " et "),
                    TextSpan(
                      text: "politique de service.",
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                      // recognizer: TapGestureRecognizer()..onTap = onPolicyTap,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              // Signup Button
              MainButtons(
                text: "S'inscrire",
                onPressed: () {
                  // run signup function here to let user in before going to succes page
                  Get.toNamed('/succes_reg');
                },
              ),
              const SizedBox(height: 20),
              Text('ou poursuivre avec'),
              const SizedBox(height: 16),
              // Social Media Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => {},
                    child: Image.asset(
                      "assets/facebook.png",
                      width: 70,
                      height: 70,
                    ),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () => {},
                    child: Image.asset(
                      "assets/twitter.png",
                      width: 60,
                      height: 70,
                    ),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () => {},
                    child: Image.asset(
                      "assets/google.png",
                      width: 60,
                      height: 60,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              // Already have an account?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Vous avez déjà un compte ? '),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/login');
                    },
                    child: Text(
                      'Connectez-vous',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
