import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_firman/bloc/auth/auth_cubit.dart';
import 'package:tugas_firman/bloc/auth/auth_state.dart';
import 'package:tugas_firman/bloc/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late final AuthCubit authCubit;

  var showPassword = true;

  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (p, c) => (
            (p.errorMessage == '' && c.errorMessage != '') ||
            (p.isLoggedIn == false && c.isLoggedIn == true)
          ),
          listener: (context, state) {
            if (state.errorMessage != '') {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Gagal Login'),
                  content: Text(state.errorMessage),
                  actions: [
                    FilledButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK')
                    )
                  ],
                )
              );
            } else if (state.isLoggedIn) {
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            }
          },
        ),
      ],
      child: Scaffold(
        body: 
        Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bacground_page1.png"),
            fit: BoxFit.cover,
          ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "Selamat Datang Kembali!",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                SizedBox(height: 32,),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.email),
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: OutlineInputBorder(),
                    hintText: "Email",
                  ),
                ),
                SizedBox(height: 16,),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: showPassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.email),
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: OutlineInputBorder(),
                    hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => showPassword = !showPassword), 
                      icon: Icon(Icons.visibility)
                    )
                  ),
                ),
                SizedBox(height: 16,),
                BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => authCubit.login(
                          email: emailController.text,
                          password: passwordController.text),
                      child: state.loading
                          ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            ),
                          )
                          : const Text("Login"),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
