import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_app/providers/login_provider.dart';
import 'package:udemy_app/services/auth_service.dart';

import '../widgets/custom_input_field.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms'),
      ),
      body: SingleChildScrollView(
          child: ChangeNotifierProvider(
        create: (context) => LoginFormProvider(),
        child: const _LoginForm(),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: loginForm.formKey,
          child: Column(
            children: [
              const CustomInputField(
                labelText: 'Nombre',
                hintText: 'Nombre del usuario',
                formProperty: 'first_name',
              ),
              const SizedBox(height: 30),
              const CustomInputField(
                labelText: 'Apellido',
                hintText: 'Apellido del usuario',
                formProperty: 'last_name',
                //formValues: formValues
              ),
              const SizedBox(height: 30),
              CustomInputField(
                labelText: 'Correo',
                hintText: 'Correo del usuario',
                keyboardType: TextInputType.emailAddress,
                formProperty: 'email',
                onChanged: (value) => loginForm.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = RegExp(pattern);
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'El valor ingresado no luce como un correo';
                  // if (value == null) return 'Este campo es requerido';
                  // return value.length < 3 ? 'Mínimo de 3 letras' : null;
                },
                // formValues: formValues,
              ),
              const SizedBox(height: 30),
              CustomInputField(
                labelText: 'Contraseña',
                hintText: 'Contraseña del usuario',
                obscureText: true,
                formProperty: 'password',
                //formValues: formValues,
                onChanged: (value) => loginForm.password = value,
                validator: (value) {
                  if (value == null) return 'Este campo es requerido';
                  return value.length < 3 ? 'Mínimo de 3 letras' : null;
                },
              ),
              const SizedBox(height: 30),
              DropdownButtonFormField<String>(
                  value: 'Admin',
                  items: const [
                    DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                    DropdownMenuItem(
                        value: 'Superuser', child: Text('Superuser')),
                    DropdownMenuItem(
                        value: 'Developer', child: Text('Developer')),
                    DropdownMenuItem(
                        value: 'Jr. Developer', child: Text('Jr. Developer')),
                  ],
                  onChanged: (value) {
                    //print(value);
                    // formValues['role'] = value ?? 'Admin';
                  }),
              ElevatedButton(
                child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Guardar'))),
                onPressed: () async {
                  FocusScope.of(context).requestFocus(FocusNode());

                  final authService =
                      Provider.of<AuthService>(context, listen: false);

                  final String? errorMessage = await authService.createUser(
                      loginForm.email, loginForm.password);
                  if (!loginForm.isValidForm()) return;

                  if (errorMessage == null) {
                    Navigator.pushReplacementNamed(
                      context,
                      '/actual-home',
                    );
                  } else {
                    //print(errorMessage);
                  }

                  //* imprimir valores del formulario
                  //print(loginForm.email);
                },
              )
            ],
          ),
        ));
  }
}
