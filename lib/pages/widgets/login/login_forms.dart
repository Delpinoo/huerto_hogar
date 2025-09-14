import 'package:flutter/material.dart';

class LoginForms extends StatelessWidget {
  const LoginForms({super.key});

  @override
  Widget build(BuildContext context) {
    // acá llamamos al fromulario que creamos abajo
    return FormCustomEmail();
  }
}


// Acá creamos la clase para el formulario
class FormCustomEmail extends StatefulWidget {
  const FormCustomEmail({super.key});

  @override
  FormEmail createState() {
    return FormEmail();
  }
}


// acá configuramos el formulario
class FormEmail extends State<FormCustomEmail> {

  // acá creamos un borde que rodea el input completo (OutlineINmputBorder) de color verde y de radio de 40
  final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  );

  // acá insertamos iconos de la clase MaterialIcons de flutter.
  static const IconData key = IconData(0xf052b, fontFamily: 'MaterialIcons');
  static const IconData mail = IconData(0xe3c3, fontFamily: 'MaterialIcons');
  static const IconData arrowBackIos = IconData(0xe093, fontFamily: 'MaterialIcons',matchTextDirection: true,);
  

  // acá le damos configuraciones al intput de como queremos que sea vea y lo que contenga
  InputDecoration get inputDecorationEmail => InputDecoration(
    hintText: 'Ingrese su email',
    border: outlineInputBorder,
    filled: true,
    fillColor: Colors.white,
    prefixIcon: Icon(mail)
  );


  InputDecoration get inputDecorationPassword => InputDecoration(
    hintText: 'Ingrese su contraseña',
    border: outlineInputBorder,
    filled: true,
    fillColor: Colors.white,
    prefixIcon: Icon(key),
  );


  final emailfocusNode = FocusNode();
  final passwordfocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        // esto es para que todos los widget se centren
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Center(
            // esto es para poder ingresar texto
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    // esto es para que se oculte el teclado al presionar fuera de este mismo
                    onTapOutside: (event) {
                    emailfocusNode.unfocus();
                    },
                    focusNode: emailfocusNode,
                    decoration: inputDecorationEmail,
                  ),
                ) 
            ) 
          ),

          const SizedBox(height: 5),

          Center(child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              width: 300,
              child: TextFormField(
                // esto es para que se oculte el teclado al presionar fuera de este mismo
                onTapOutside: (event) {
                passwordfocusNode.unfocus();
              },
              focusNode: passwordfocusNode,
              decoration: inputDecorationPassword
              ),
            ) 
           )
          ),


          SizedBox(
            
            height: 20,
            width: 300,
            child: Align(
              alignment: AlignmentGeometry.centerRight,
              child: GestureDetector(
                onTap: () {
                  // Lógica para navegar a la página de registro
                  print('Navegando a la página de registro');
                  // Por ejemplo: Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: RichText(
                  text: TextSpan(
                    text: '¿Olvidaste tu contraseña? ',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
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
                onPressed: () {
                  print('Iniciar sesion');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 50, 168, 54),
                  foregroundColor:  Colors.white
                ),
                child: const Text('Iniciar Sesión'),
              ),
            ),
          ),


          const SizedBox(height: 20),


          Align(
            alignment: AlignmentGeometry.center,
            child: GestureDetector(
              onTap: () {
                // acá va la logica para poder navegar a la pagina de registrar
                print('Navegando a la página de registro');
                // Por ejemplo: Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: RichText(
                text: TextSpan(
                text: '¿No tienes cuenta? ',
                style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Regístrate',
                  style: TextStyle(
                    color: Colors.green, 
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
