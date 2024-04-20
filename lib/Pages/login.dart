import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/signUp.dart';
import 'package:flutter_application_1/Service/pocketbase.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loadingProvider = StateProvider<bool>((ref) => false);

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              const Text(
                "Start journey with us using email and password",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              TextFormField(
                cursorColor: Colors.purpleAccent.shade100,
                style: const TextStyle(color: Colors.white),
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: decoration(label: "Email", hint: "abc@gmail.com"),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                cursorColor: Colors.purpleAccent.shade100,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                decoration: decoration(hint: "Password", label: "Password"),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Did'nt have Account |",style: TextStyle(color: Colors.white),),
              const SizedBox(width: 10),
                  GestureDetector(onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const SignUp())),child: Text("SignUp",style: TextStyle(fontStyle:FontStyle.italic,color: Colors.purple,fontSize: 18),),)
                ],
              ),
              const SizedBox(height: 20),
              Consumer(
                builder: (context, ref, _) {
                  final isLoading = ref.watch(loadingProvider);
                  return isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.purpleAccent,
                              minimumSize: const Size(double.infinity, 60),
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.purpleAccent, width: 0.3),
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ref.read(loadingProvider.notifier).state = true;
                              // Set loading to true
                              // Simulating an asynchronous login process
                              Future.delayed(const Duration(seconds: 3),
                                  () async {
                                if (await PocketbaseService().signIn(
                                    emailController.text,
                                    passwordController.text)) {
                                  if (kDebugMode) {
                                    print("Email: ${emailController.text}");
                                    print(
                                        "Password: ${passwordController.text}");
                                  }
                                 ref.read(statusNotifier.notifier).state = Future.value("Logged in");
                                 print(ref.watch(statusNotifier));
                                  
                                }
                                // After login process is done, set loading to false
                                ref.read(loadingProvider.notifier).state =
                                    false;
                              });
                            }
                          },
                          child: const Text('Submit'),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  decoration({String? hint, label}) => InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color.fromARGB(96, 49, 49, 49),
        hintStyle: const TextStyle(color: Colors.grey),
        labelText: label,
        labelStyle:  TextStyle(color: Colors.grey.shade400),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: Colors.purpleAccent, width: 0.3)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent)),
      );
}
