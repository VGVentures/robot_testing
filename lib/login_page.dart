import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: Key('emailTextField'),
          decoration: InputDecoration(hintText: 'Email'),
          keyboardType: TextInputType.emailAddress,
          controller: _emailController,
        ),
        SizedBox(height: 8),
        TextFormField(
          key: Key('passwordTextField'),
          obscureText: true,
          decoration: InputDecoration(hintText: 'Password'),
          controller: _passwordController,
        ),
        ElevatedButton(
          child: Text('Login'),
          onPressed: () async {
            if (_emailController.text.isEmpty ||
                _passwordController.text.isEmpty) {
              _showSnackBar('Invalid credentials');
              return;
            }
            setState(() {
              _isLoading = true;
            });
            await Future.delayed(Duration(seconds: 1));
            setState(() {
              _isLoading = false;
            });
            _showSnackBar('Welcome ${_emailController.text}');
          },
        ),
        if (_isLoading) CircularProgressIndicator(),
      ],
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
