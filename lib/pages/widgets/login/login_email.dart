import 'package:flutter/material.dart';

class LoginFormEmail extends StatelessWidget {
  const LoginFormEmail({super.key});

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
    borderSide: const BorderSide(color: Colors.green),
    borderRadius: BorderRadius.circular(80)
  );


  // acá le damos configuraciones al intput de como queremos que sea vea y lo que contenga
  InputDecoration get inputDecoration => InputDecoration(
    hintText: 'Ingrese su email',
    border: outlineInputBorder,

  );


  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            // padding: EdgeInsetsGeometry.all(100))
          
          // esto es para poder ingresar texto
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 150),
            child: SizedBox(
            width: 400,
            child: TextFormField(
            // esto es para que se oculte el teclado al presionar fuera de este mismo
            onTapOutside: (event) {
            focusNode.unfocus();
            },
            focusNode: focusNode,
            decoration: inputDecoration,
          ),
          ) 
           ) 
          
          )
        ], 
      ),
    );
  }
}
