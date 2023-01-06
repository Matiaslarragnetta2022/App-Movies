import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_app/providers/login_provider.dart';
import 'package:udemy_app/services/auth_service.dart';
import 'package:udemy_app/services/notifications_service.dart';
import 'package:udemy_app/theme/app_theme.dart';

import '../widgets/custom_input_field.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
     
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
    return Column(
      children: [

         Stack(
                children: [Container(
                  
                  height: 350,
                  
                  child: const HeaderWaveGradient(
                    
                  ),
                  
                  ),
                   Container(
                   
                height: 790,
                  child: const HeaderBajo(),), 
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    child: ImputsLogin(loginForm: loginForm)),

                ]), 
        
      ],
    );
  }
}

class ImputsLogin extends StatelessWidget {
  const ImputsLogin({
    Key? key,
    required this.loginForm,
  }) : super(key: key);

  final LoginFormProvider loginForm;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: loginForm.formKey,
          child: Column(
            children: [
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
              TextButton(
                  onPressed: (() {
                    Navigator.pushNamed(
                      context,
                      '/register',
                    );
                  }),
                  child: const Text('You do not have an account? Sign up')),
              TextButton(
                
                child: Container(
                  width: 400,
                    height: 40,
                  
                  decoration: BoxDecoration(
                    gradient:  const LinearGradient(colors:
                    <Color>[
          
          Color.fromARGB(255, 41, 151, 253),
          Color.fromARGB(246, 59, 147, 179),
          
          Color(0xff60b698b),
        ], ),
                   
                  borderRadius: BorderRadius.circular(30)
                ),
                  
                    
                    child: const Center(child: Text('Iniciar sesión', style: TextStyle(color: Colors.white),))),
                onPressed: () async {
                  FocusScope.of(context).requestFocus(FocusNode());

                  final authService =
                      Provider.of<AuthService>(context, listen: false);

                  final String? errorMessage = await authService.login(
                      loginForm.email, loginForm.password);
                  if (!loginForm.isValidForm()) return;

                  if (errorMessage == null) {
                    Navigator.pushReplacementNamed(
                      context,
                      '/actual-home',
                    );
                  } else {
                    NotificationsService.showSnackbar(errorMessage);
                  }

                  //* imprimir valores del formulario
                  //print(loginForm.email);
                },
              ),
               
            ],
            
          ),
        ));
  }
}


class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromCircle(center: const Offset(0.0, 55.0), radius: 180);

    const Gradient gradiente = LinearGradient(
         begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: <Color>[
          Color(0xff60b698b),
          
          Color.fromARGB(246, 32, 104, 130),
          Color.fromARGB(255, 41, 151, 253),
        ],
       );

    final lapiz = Paint()..shader = gradiente.createShader(rect);

    // Propiedades
    // lapiz.color = Color(0xff615AAB);
    // lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lapiz
   
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.90, size.height * 0.20, size.width, size.height * 0.40);
    path.lineTo(size.width, 0);

   

 


   
    

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}




class HeaderBajo extends StatelessWidget {
  const HeaderBajo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderBajo(),
      ),
    );
  }
}

class _HeaderBajo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromCircle(center: const Offset(0.0, 55.0), radius: 180);

    const Gradient gradiente = LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: <Color>[
          
          Color.fromARGB(255, 41, 151, 253),
          Color.fromARGB(246, 32, 104, 130),
          Color(0xff60b698b),
        ],
       );

    final lapiz = Paint()..shader = gradiente.createShader(rect);

    // Propiedades
    // lapiz.color = Color(0xff615AAB);
    // lapiz.color = Colors.red;
    final path = Path();
// New origin
path.moveTo(0,size.height);
// First line
path.lineTo(0, size.height*0.70);
//Wave
path.cubicTo(
   //Control points
   size.width*.40, size.height*0.60,
   size.width*.60, size.height*0.80,
   // Endpoint
   size.width, size.height*0.70
);
// Last Point
path.lineTo(size.width, size.height);
// Back to Origin (optional)
path.lineTo(0,size.height);
   
    

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
