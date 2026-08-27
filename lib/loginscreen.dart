import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController captchaController = TextEditingController();

  bool rememberMe = false;
  bool obscurePassword = true;

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    captchaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),

            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 382),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 25,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // =====================================================
                    // LOGO
                    // =====================================================
                    SizedBox(
                      height: 200,

                      child: Image.asset(
                        'assets/images/indiagrain_logo.jpeg',
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // =====================================================
                    // TITLE
                    // =====================================================
                    const Text(
                      'Login to your account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF263238),
                        height: 1.1,
                      ),
                    ),

                    // =====================================================
                    // DIVIDER
                    // =====================================================
                    const Padding(
                      padding: EdgeInsets.only(top: 22, bottom: 22),

                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xFFE5E5E5),
                      ),
                    ),

                    // =====================================================
                    // USER ID
                    // =====================================================
                    _buildTextField(
                      controller: userController,
                      hintText: 'User Id',
                    ),

                    const SizedBox(height: 17),

                    // =====================================================
                    // PASSWORD
                    // =====================================================
                    _buildTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: obscurePassword,

                      suffixIcon: IconButton(
                        splashRadius: 20,

                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,

                          size: 21,

                          color: const Color(0xFF8A8A8A),
                        ),

                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                    ),

                    // =====================================================
                    // REMEMBER ME
                    // =====================================================
                    const SizedBox(height: 9),

                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,

                          child: Checkbox(
                            value: rememberMe,

                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,

                            visualDensity: VisualDensity.compact,

                            side: const BorderSide(
                              color: Color(0xFF777777),
                              width: 1,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),

                            onChanged: (value) {
                              setState(() {
                                rememberMe = value ?? false;
                              });
                            },
                          ),
                        ),

                        const SizedBox(width: 7),

                        const Text(
                          'Remember me',

                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF555555),
                          ),
                        ),
                      ],
                    ),

                    // =====================================================
                    // CAPTCHA TITLE
                    // =====================================================
                    const SizedBox(height: 20),

                    const Text(
                      'Retype the characters from the picture:',

                      style: TextStyle(
                        fontSize: 12.5,
                        color: Color(0xFF333333),
                      ),
                    ),

                    const SizedBox(height: 7),

                    // =====================================================
                    // CAPTCHA
                    // =====================================================
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Expanded(
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              color: Color(0xFF18391D),
                            ),

                            child: SizedBox(
                              height: 44,

                              child: Image.asset(
                                'assets/images/captcha.png',
                                fit: BoxFit.cover,

                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Text(
                                      'CAPTCHA',

                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 5),

                        _captchaButton(
                          icon: Icons.refresh,
                          onPressed: () {
                            // Refresh CAPTCHA API
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 3),

                    // =====================================================
                    // CAPTCHA TEXT
                    // =====================================================
                    const Padding(
                      padding: EdgeInsets.only(left: 22),

                      child: Text(
                        'BotDetect CAPTCHA ASP.NET Form Validation',

                        style: TextStyle(
                          fontSize: 9.5,
                          color: Color(0xFF555555),
                        ),
                      ),
                    ),

                    // =====================================================
                    // AUDIO BUTTON
                    // =====================================================
                    Align(
                      alignment: Alignment.centerRight,

                      child: Padding(
                        padding: const EdgeInsets.only(right: 28),

                        child: _captchaButton(
                          icon: Icons.volume_up_outlined,

                          onPressed: () {
                            // Play CAPTCHA audio
                          },
                        ),
                      ),
                    ),

                    // =====================================================
                    // CAPTCHA INPUT
                    // =====================================================
                    _buildTextField(
                      controller: captchaController,
                      hintText: '',
                    ),

                    // =====================================================
                    // LOGIN BUTTON
                    // =====================================================
                    const SizedBox(height: 30),

                    SizedBox(
                      height: 48,

                      child: ElevatedButton(
                        onPressed: _login,

                        style: ElevatedButton.styleFrom(
                          elevation: 0,

                          backgroundColor: const Color(0xFF1295E5),

                          foregroundColor: Colors.white,

                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),

                          padding: EdgeInsets.zero,
                        ),

                        child: const Text(
                          'Log In',

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    // =====================================================
                    // BOTTOM DIVIDER
                    // =====================================================
                    const Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 16),

                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xFFE5E5E5),
                      ),
                    ),

                    // =====================================================
                    // FOOTER LINKS
                    // =====================================================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        TextButton(
                          onPressed: () {},

                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),

                          child: const Text(
                            'Forgot Password?',

                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF1478D4),
                            ),
                          ),
                        ),

                        TextButton(
                          onPressed: () {},

                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),

                          child: const Text(
                            'Sign up now',

                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF1478D4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ===============================================================
  // TEXT FIELD
  // ===============================================================

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return SizedBox(
      height: 60,

      child: TextField(
        controller: controller,
        obscureText: obscureText,

        style: const TextStyle(fontSize: 17, color: Color(0xFF333333)),

        decoration: InputDecoration(
          hintText: hintText,

          hintStyle: const TextStyle(fontSize: 17, color: Color(0xFF9A9A9A)),

          filled: true,

          fillColor: const Color(0xFFF3F3F3),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 0,
          ),

          suffixIcon: suffixIcon,

          border: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide.none,
          ),

          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide.none,
          ),

          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,

            borderSide: BorderSide(color: Color(0xFF1295E5), width: 1),
          ),
        ),
      ),
    );
  }

  // ===============================================================
  // CAPTCHA BUTTON
  // ===============================================================

  Widget _captchaButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 27,
      height: 27,

      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),

          border: Border.all(color: const Color(0xFF777777), width: 1),
        ),

        child: IconButton(
          padding: EdgeInsets.zero,

          splashRadius: 12,

          icon: Icon(icon, size: 18, color: const Color(0xFF555555)),

          onPressed: onPressed,
        ),
      ),
    );
  }

  // ===============================================================
  // LOGIN
  // ===============================================================

  void _login() {
    FocusScope.of(context).unfocus();

    final user = userController.text.trim();
    final password = passwordController.text.trim();
    final captcha = captchaController.text.trim();

    if (user.isEmpty) {
      _showMessage('Please enter User Id');
      return;
    }

    if (password.isEmpty) {
      _showMessage('Please enter Password');
      return;
    }

    if (captcha.isEmpty) {
      _showMessage('Please enter CAPTCHA');
      return;
    }

    // TODO:
    // Connect with .NET CRM JWT Login API.
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }
}
