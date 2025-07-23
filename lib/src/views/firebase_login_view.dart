import 'package:flutter/material.dart';
import 'package:utilidades/src/controllers/usuario_controller.dart';
import 'package:utilidades/src/views/firebase_registrer_view.dart';

class FirebaseLoginView extends StatefulWidget {
  const FirebaseLoginView({super.key});

  @override
  State<FirebaseLoginView> createState() => _FirebaseLoginViewState();
}

class _FirebaseLoginViewState extends State<FirebaseLoginView> {
  bool _loading = false;
  final UsuarioController _controller = UsuarioController();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  String? _erro;

  void _abrirCadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const FirebaseRegistrerView()),
    );
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
        _erro = null;
      });

      final usuario = await _controller.autenticar(
        _emailController.text,
        _senhaController.text, 
      );

      setState(() {
        _loading = false;
      });

      if(usuario != null){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login realizado com sucesso."))
        );
        Navigator.pushReplacementNamed(context, '/home');
      }else{
        setState(() {
          _erro = "E-mail ou senha inválidos";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login com firebase")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if(_erro != null)...[
                Text(_erro!, style: TextStyle(color: Colors.red),),
                SizedBox(height: 10,)
              ],
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "E-mail"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Informe o e-mail" : null,
              ),
              TextFormField(
                controller: _senhaController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Senha"),
                validator: (value) =>
                    value == null || value.length < 6 ? "Senha inválida" : null,
              ),
              SizedBox(height: 20),
              //botão ou loading
              _loading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(onPressed: _login, child: Text("Entrar")),
              TextButton(
                onPressed: _abrirCadastro,
                child: const Text("Não tem conta? Cadastre-se"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
