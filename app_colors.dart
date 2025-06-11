import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anjam/core/constants.dart';
import 'package:anjam/features/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isSignUp = false;
  bool _useFaceId = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryGreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildFormContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 80, bottom: 40),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/logos/anjam_logo.svg',
            height: 100,
            color: Colors.white,
          ),
          const SizedBox(height: 20),
          Text(
            _isSignUp ? 'Create Account' : 'Welcome Back',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormContainer() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.all(30),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!_isSignUp) _buildEmailField(),
            if (!_isSignUp) _buildPasswordField(),
            if (_isSignUp) _buildSignUpFields(),
            const SizedBox(height: 20),
            _buildActionButton(),
            const SizedBox(height: 20),
            _buildToggleAuthText(),
            if (_isSignUp) _buildFaceIdOption(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: const Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!value.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _buildSignUpFields() {
    return Column(
      children: [
        _buildEmailField(),
        const SizedBox(height: 15),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: const Icon(Icons.lock),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
        const SizedBox(height: 15),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Factory Code',
            prefixIcon: const Icon(Icons.security),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter factory code';
            }
            return null;
          },
        ),
        const SizedBox(height: 15),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'National ID Number',
            prefixIcon: const Icon(Icons.credit_card),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your national ID';
            }
            return null;
          },
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            // Implement national card image upload
          },
          child: const Text('Upload National Card Image'),
        ),
      ],
    );
  }

  Widget _buildActionButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryGreen,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          final authProvider = Provider.of<AuthProvider>(context, listen: false);
          if (_isSignUp) {
            await authProvider.signUp(
              _emailController.text,
              _passwordController.text,
              _useFaceId,
            );
          } else {
            await authProvider.login(
              _emailController.text,
              _passwordController.text,
            );
          }
        }
      },
      child: Text(
        _isSignUp ? 'Sign Up' : 'Login',
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Widget _buildToggleAuthText() {
    return TextButton(
      onPressed: () {
        setState(() {
          _isSignUp = !_isSignUp;
        });
      },
      child: Text(
        _isSignUp
            ? 'Already have an account? Login'
            : 'Don\'t have an account? Sign Up',
        style: TextStyle(color: AppColors.primaryGreen),
      ),
    );
  }

  Widget _buildFaceIdOption() {
    return Row(
      children: [
        Checkbox(
          value: _useFaceId,
          onChanged: (value) {
            setState(() {
              _useFaceId = value!;
            });
          },
          activeColor: AppColors.primaryGreen,
        ),
        const Text('Enable Face ID for faster login'),
      ],
    );
  }
}