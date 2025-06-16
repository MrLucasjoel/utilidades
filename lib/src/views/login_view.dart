import 'package:flutter/material.dart';
import 'package:utilidades/src/controllers/login_controller.dart';
import 'package:utilidades/src/services/auth_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _controller = LoginController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _message = '';
  
  bool _isLoading = false;

  void _handleLogin() async{
    final success = await _controller.login(
      _usernameController.text,
      _passwordController.text,
    );

    @override
void dispose() {
  _usernameController.dispose();
  _passwordController.dispose();
  super.dispose();
}

if (!mounted) return;

    if(success) {
      AuthService.login();
      Navigator.pushReplacementNamed(context, "/home");
    }else{
      setState(() {
        _message = "Usuário ou senha incorretos";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 1, 92, 84), // Define a cor de fundo do Scaffold
      appBar: AppBar(title: Text("Login"),),
      body:  Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Image.asset("assets/logo/kings.png", width: 200,),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Usuário",
                labelStyle: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
            ),
            
            SizedBox(height: 10,),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10,),
           _isLoading 
            ? CircularProgressIndicator()
            : ElevatedButton(
              onPressed: _handleLogin,
              child: Text("entrar")
            ),
            SizedBox(height: 10,),
            Text(_message, style: TextStyle(color: Colors.deepOrange),),
          ],
        ),
      ),
    );
  }
}