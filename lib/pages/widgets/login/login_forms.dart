import 'package:flutter/material.dart';

// Definimos las credenciales predeterminadas aquí para fácil acceso y manejo
const String defaultEmail = 'usuario@prueba.com';
const String defaultPassword = '123456';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      // En una aplicación real, pondrías un widget de pantalla completa aquí
      home: const Scaffold(
        backgroundColor: Color.fromARGB(255, 230, 245, 230),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bienvenido',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 50, 168, 54)),
                ),
                SizedBox(height: 40),
                // Aquí se llama al formulario
                LoginForms(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForms extends StatelessWidget {
  const LoginForms({super.key});

  @override
  Widget build(BuildContext context) {
    return const FormCustomEmail();
  }
}


// Acá creamos la clase para el formulario (StatefulWidget)
class FormCustomEmail extends StatefulWidget {
  const FormCustomEmail({super.key});

  @override
  FormEmail createState() {
    return FormEmail();
  }
}


// acá configuramos el formulario (State)
class FormEmail extends State<FormCustomEmail> {
  // 1. Clave global para la validación del formulario
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // 2. Controladores para capturar el texto de los inputs
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // acá creamos un borde que rodea el input completo (OutlineINmputBorder)
  final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  );

  // acá insertamos iconos de la clase MaterialIcons de flutter.
  static const IconData keyIcon = Icons.vpn_key;
  static const IconData mailIcon = Icons.email;
  static const IconData arrowBackIos = Icons.arrow_back_ios;


  // acá le damos configuraciones al intput de como queremos que sea vea y lo que contenga
  InputDecoration get inputDecorationEmail => InputDecoration(
    hintText: 'Ingrese su email',
    border: outlineInputBorder,
    filled: true,
    fillColor: Colors.white,
    prefixIcon: const Icon(mailIcon, color: Color.fromARGB(255, 50, 168, 54)),
  );


  InputDecoration get inputDecorationPassword => InputDecoration(
    hintText: 'Ingrese su contraseña',
    border: outlineInputBorder,
    filled: true,
    fillColor: Colors.white,
    prefixIcon: const Icon(keyIcon, color: Color.fromARGB(255, 50, 168, 54)),
  );

  // Debemos liberar los recursos de los controladores al destruir el widget
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Lógica para iniciar sesión y validar
  void _login() {
    // Intentamos validar el formulario
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      // Verificamos las credenciales predeterminadas
      if (email == defaultEmail && password == defaultPassword) {
        // Credenciales correctas
        print('¡Inicio de sesión exitoso!');
        print('Redirigiendo a la página de productos (simulación)...');
        Navigator.pushNamed(context, '/catalogo');
        // Muestra un mensaje de éxito (SnackBar)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ ¡Inicio de sesión exitoso! Redirigiendo a productos...'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
        // Aquí iría la navegación a la página de productos: 
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProductCatalogPage()));

      } else {
        // Credenciales incorrectas
        print('Error de inicio de sesión: Credenciales incorrectas');

        // Muestra un mensaje de error (SnackBar)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('❌ Credenciales incorrectas. Usuario: $defaultEmail, Contraseña: $defaultPassword'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 4),
          ),
        );
      }
    } else {
      print('Validación fallida. Revise los campos.');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      // Asignamos la clave global para poder validar
      key: _formKey,
      child: Column(
        // esto es para que todos los widget se centren
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Center(
            // esto es para poder ingresar texto
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _emailController, // Usar el controlador
                    keyboardType: TextInputType.emailAddress, // Teclado optimizado para email
                    // Añadir la lógica de validación
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El correo electrónico es obligatorio';
                      }
                      // Validación de formato básico de email
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'Ingrese un formato de correo válido';
                      }
                      return null;
                    },
                    decoration: inputDecorationEmail,
                  ),
                ) 
            ) 
          ),

          const SizedBox(height: 5),

          Center(child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              width: 300,
              child: TextFormField(
                controller: _passwordController, // Usar el controlador
                obscureText: true, // Ocultar el texto de la contraseña
                // Añadir la lógica de validación
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La contraseña es obligatoria';
                  }
                  if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
                decoration: inputDecorationPassword,
              ),
            ) 
            )
          ),


          SizedBox(
            height: 20,
            width: 300,
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  print('Navegando a la página de recuperación de contraseña');
                  // Lógica para navegar a la página de registro
                  // Por ejemplo: Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                },
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 50, 168, 54),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
            
          const SizedBox(height: 60),


          Center(
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                // Llama a la función _login que maneja la validación y verificación
                onPressed: _login, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 50, 168, 54),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),


          const SizedBox(height: 20),


          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                print('Navegando a la página de registro');
                // acá va la logica para poder navegar a la pagina de registrar
                // Por ejemplo: Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: RichText(
                text: const TextSpan(
                text: '¿No tienes cuenta? ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Regístrate',
                    style: TextStyle(
                      color: Color.fromARGB(255, 50, 168, 54), 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                ),
              ),
            ),
          ),
        ], 
      ),
    );
  }
}
