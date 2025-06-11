// File: lib/login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:local_auth/local_auth.dart';
import 'app_colors.dart';
import 'auth_provider.dart';
import 'language_provider.dart';
import 'language_selector.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _factoryCodeController = TextEditingController();
  final _nationalIdController = TextEditingController();
  
  bool _isSignUp = false;
  bool _isPasswordVisible = false;
  bool _enableFaceId = false;
  bool _isLoading = false;
  String? _uploadedImagePath;
  
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final LocalAuthentication _localAuth = LocalAuthentication();

  final Map<String, String> _factoryCodes = {
    'ANJAM001': 'admin@anjamhospital.com',
    'ANJAM002': 'doctor@anjamhospital.com',
  };

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryGreen,
              AppColors.accentGreen,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
              child: Column(
                children: [
                  _buildHeader(),
                  Expanded(child: _buildFormContainer()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: LanguageSelector(),
            ),
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Icon(
                Icons.local_hospital,
                size: 50,
                color: AppColors.primaryGreen,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Anjam Hospital',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _isSignUp ? 'Create Your Account' : 'Welcome Back',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormContainer() {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        padding: const EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!_isSignUp) ...[
                _buildBiometricLoginButton(),
                const SizedBox(height: 24),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('OR', style: TextStyle(color: AppColors.greyColor)),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 24),
              ],
              _buildEmailField(),
              const SizedBox(height: 16),
              _buildPasswordField(),
              if (_isSignUp) ...[
                const SizedBox(height: 16),
                _buildFactoryCodeField(),
                const SizedBox(height: 16),
                _buildNationalIdField(),
                const SizedBox(height: 16),
                _buildImageUploadSection(),
                const SizedBox(height: 16),
                _buildFaceIdOption(),
              ],
              const SizedBox(height: 32),
              _buildSubmitButton(),
              const SizedBox(height: 16),
              _buildToggleAuthMode(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBiometricLoginButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryGreen, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton.icon(
        onPressed: _authenticateWithBiometrics,
        icon: const Icon(Icons.fingerprint, color: AppColors.primaryGreen),
        label: const Text(
          'Login with Face ID / Fingerprint',
          style: TextStyle(
            color: AppColors.primaryGreen,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email Address',
        prefixIcon: Icon(Icons.email_outlined),
        hintText: 'Enter your email',
        filled: true,
        fillColor: AppColors.backgroundColor,
      ),
      validator: (value) {
        if (value?.isEmpty ?? true) return 'Please enter your email';
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.lock_outlined),
        suffixIcon: IconButton(
          icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility),
          onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
        ),
        hintText: 'Enter your password',
        filled: true,
        fillColor: AppColors.backgroundColor,
      ),
      validator: (value) {
        if (value?.isEmpty ?? true) return 'Please enter your password';
        if (value!.length < 6) return 'Password must be at least 6 characters';
        return null;
      },
    );
  }

  Widget _buildFactoryCodeField() {
    return TextFormField(
      controller: _factoryCodeController,
      decoration: const InputDecoration(
        labelText: 'Factory Code',
        prefixIcon: Icon(Icons.security_outlined),
        hintText: 'Enter factory code (e.g., ANJAM001)',
        filled: true,
        fillColor: AppColors.backgroundColor,
      ),
      validator: (value) {
        if (value?.isEmpty ?? true) return 'Please enter factory code';
        if (!_factoryCodes.containsKey(value)) return 'Invalid factory code';
        return null;
      },
    );
  }

  Widget _buildNationalIdField() {
    return TextFormField(
      controller: _nationalIdController,
      decoration: const InputDecoration(
        labelText: 'National ID Number',
        prefixIcon: Icon(Icons.credit_card_outlined),
        hintText: 'Enter your national ID',
        filled: true,
        fillColor: AppColors.backgroundColor,
      ),
      validator: (value) {
        if (value?.isEmpty ?? true) return 'Please enter your national ID';
        return null;
      },
    );
  }

  Widget _buildImageUploadSection() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Icon(
            _uploadedImagePath != null ? Icons.check_circle : Icons.camera_alt_outlined,
            size: 48,
            color: _uploadedImagePath != null ? AppColors.successGreen : AppColors.greyColor,
          ),
          const SizedBox(height: 8),
          Text(
            _uploadedImagePath != null ? 'National ID Uploaded' : 'Upload National ID Card',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: _uploadedImagePath != null ? AppColors.successGreen : AppColors.greyColor,
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: _pickNationalIdImage,
            icon: const Icon(Icons.upload_file),
            label: Text(_uploadedImagePath != null ? 'Change Image' : 'Choose Image'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFaceIdOption() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Checkbox(
            value: _enableFaceId,
            onChanged: (value) => setState(() => _enableFaceId = value ?? false),
            activeColor: AppColors.primaryGreen,
          ),
          const Expanded(
            child: Text(
              'Enable Face ID / Fingerprint for faster login',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _isLoading ? null : _handleSubmit,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
      ),
      child: _isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
            )
          : Text(
              _isSignUp ? 'Create Account' : 'Login',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
    );
  }

  Widget _buildToggleAuthMode() {
    return TextButton(
      onPressed: () => setState(() => _isSignUp = !_isSignUp),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: AppColors.greyColor),
          children: [
            TextSpan(text: _isSignUp ? 'Already have an account? ' : 'Don\'t have an account? '),
            TextSpan(
              text: _isSignUp ? 'Login' : 'Sign Up',
              style: const TextStyle(
                color: AppColors.primaryGreen,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper methods
  Future<void> _authenticateWithBiometrics() async {
    try {
      final bool isAvailable = await _localAuth.canCheckBiometrics;
      if (!isAvailable) {
        _showErrorSnackBar('Biometric authentication not available');
        return;
      }

      final bool didAuthenticate = await _localAuth.authenticate(
        localizedReason: 'Please authenticate to access your account',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      if (didAuthenticate) {
        _navigateToHome();
      }
    } on PlatformException catch (e) {
      _showErrorSnackBar('Biometric authentication error: ${e.message}');
    }
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      
      if (_isSignUp) {
        await _handleSignUp(authProvider);
      } else {
        await _handleLogin(authProvider);
      }
    } catch (e) {
      _showErrorSnackBar(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _handleSignUp(AuthProvider authProvider) async {
    if (!_factoryCodes.containsKey(_factoryCodeController.text)) {
      throw Exception('Invalid factory code');
    }

    final expectedEmail = _factoryCodes[_factoryCodeController.text];
    if (_emailController.text != expectedEmail) {
      throw Exception('Email does not match factory code');
    }

    if (_uploadedImagePath == null) {
      throw Exception('Please upload your national ID card image');
    }

    final success = await authProvider.signUp(
      email: _emailController.text,
      password: _passwordController.text,
      factoryCode: _factoryCodeController.text,
      nationalId: _nationalIdController.text,
      nationalIdImagePath: _uploadedImagePath!,
      enableFaceId: _enableFaceId,
    );

    if (success) {
      _navigateToHome();
    } else {
      throw Exception('Sign up failed. Please try again.');
    }
  }

  Future<void> _handleLogin(AuthProvider authProvider) async {
    final success = await authProvider.login(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (success) {
      _navigateToHome();
    } else {
      throw Exception('Invalid email or password');
    }
  }

  void _navigateToHome() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    switch (authProvider.userType) {
      case UserType.patient:
        Navigator.of(context).pushReplacementNamed('/patient-home');
        break;
      case UserType.doctor:
        Navigator.of(context).pushReplacementNamed('/doctor-dashboard');
        break;
      case UserType.reception:
        Navigator.of(context).pushReplacementNamed('/reception-dashboard');
        break;
      default:
        _showErrorSnackBar('Unknown user type');
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.errorRed,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Future<void> _pickNationalIdImage() async {
    setState(() {
      _uploadedImagePath = 'path/to/national_id_image.jpg';
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('National ID image uploaded successfully'),
        backgroundColor: AppColors.successGreen,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _factoryCodeController.dispose();
    _nationalIdController.dispose();
    super.dispose();
  }
}