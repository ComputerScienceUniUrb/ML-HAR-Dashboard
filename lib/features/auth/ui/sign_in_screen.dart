import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailTextEditingController = useTextEditingController();
    final passwordTextEditingController = useTextEditingController();
    final obscureText = useState(true);
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(''),
                  TextFormField(
                    controller: emailTextEditingController,
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  TextFormField(
                    controller: passwordTextEditingController,
                    obscureText: obscureText.value,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        color: Colors.black,
                        onPressed: () {
                          obscureText.value = !obscureText.value;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signInWithCredential(
                        EmailAuthProvider.credential(
                            email: emailTextEditingController.text.trim(),
                            password:
                                passwordTextEditingController.text.trim()),
                      );
                    },
                    child: const Text('Accedi'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
