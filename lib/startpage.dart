import 'package:flutter/material.dart';
import 'package:crmapp/loginscreen.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  static const Color primaryGreen = Color(0xFF087F3E);
  static const Color darkText = Color(0xFF17251D);
  static const Color secondaryText = Color(0xFF69736D);
  static const Color gold = Color(0xFFD4B15E);
  static const Color background = Color(0xFFFDFDFC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double width = constraints.maxWidth;
            final double height = constraints.maxHeight;

            final bool isTablet = width >= 600;
            final bool isSmallPhone = height < 700;

            // Responsive horizontal padding
            final double horizontalPadding = isTablet
                ? width * 0.10
                : width * 0.07;

            // Responsive logo width
            final double logoWidth = isTablet ? width * 0.55 : width * 0.82;

            // Responsive top spacing
            final double topSpacing = isTablet
                ? height * 0.035
                : height * 0.025;

            // Responsive spacing after logo
            final double logoBottomSpacing = isTablet
                ? height * 0.055
                : isSmallPhone
                ? height * 0.035
                : height * 0.045;

            // Responsive button bottom spacing
            final double buttonBottomSpacing = isTablet
                ? height * 0.07
                : height * 0.055;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),

              child: Column(
                children: [
                  // =========================================================
                  // TOP BRANDING
                  // =========================================================
                  SizedBox(height: topSpacing),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: isTablet ? 8 : 6,
                        height: isTablet ? 8 : 6,
                        decoration: const BoxDecoration(
                          color: primaryGreen,
                          shape: BoxShape.circle,
                        ),
                      ),

                      const SizedBox(width: 8),

                      Text(
                        'INDIAGRAIN CRM',
                        style: TextStyle(
                          fontSize: isTablet ? 15 : 11.5,
                          fontWeight: FontWeight.w800,
                          letterSpacing: isTablet ? 2.2 : 1.8,
                          color: primaryGreen,
                        ),
                      ),
                    ],
                  ),

                  // =========================================================
                  // LOGO
                  // =========================================================
                  SizedBox(height: isTablet ? 28 : 18),

                  Image.asset(
                    'assets/images/indiagrain_logo.jpeg',
                    width: logoWidth,
                    fit: BoxFit.contain,
                  ),

                  SizedBox(height: logoBottomSpacing),

                  // =========================================================
                  // WELCOME SECTION
                  // =========================================================
                  Text(
                    'Welcome to IndiaGrain CRM',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isTablet
                          ? 30
                          : isSmallPhone
                          ? 22
                          : 24,
                      fontWeight: FontWeight.w800,
                      height: 1.15,
                      letterSpacing: -0.5,
                      color: darkText,
                    ),
                  ),

                  SizedBox(height: isTablet ? 20 : 16),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 70 : 5,
                    ),
                    child: Text(
                      'Your complete workspace for managing '
                      'customers, enquiries and business operations.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isTablet ? 17 : 14,
                        height: 1.55,
                        fontWeight: FontWeight.w400,
                        color: secondaryText,
                        letterSpacing: 0.05,
                      ),
                    ),
                  ),

                  // =========================================================
                  // FLEXIBLE SPACE
                  // =========================================================
                  //
                  // Instead of using fixed values such as 200 / 400 pixels,
                  // Spacer automatically adapts to the device height.
                  //
                  const Spacer(),

                  // =========================================================
                  // GET STARTED BUTTON
                  // =========================================================
                  SizedBox(
                    width: isTablet ? 390 : double.infinity,
                    height: isTablet ? 62 : 56,

                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryGreen,
                        foregroundColor: Colors.white,

                        elevation: 6,

                        shadowColor: primaryGreen.withValues(alpha: 0.22),

                        padding: EdgeInsets.zero,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            isTablet ? 16 : 14,
                          ),
                        ),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: isTablet ? 18 : 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.1,
                            ),
                          ),

                          SizedBox(width: isTablet ? 36 : 30),

                          Container(
                            width: isTablet ? 32 : 30,
                            height: isTablet ? 32 : 30,

                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.12),
                              shape: BoxShape.circle,
                            ),

                            child: Icon(
                              Icons.arrow_forward_rounded,
                              size: isTablet ? 20 : 19,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // =========================================================
                  // SPACE BELOW BUTTON
                  // =========================================================
                  SizedBox(height: buttonBottomSpacing),

                  // =========================================================
                  // FOOTER
                  // =========================================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: isTablet ? 30 : 22,
                        height: 1,
                        color: gold,
                      ),

                      SizedBox(width: isTablet ? 10 : 8),

                      Flexible(
                        child: Text(
                          'A Complete Solution for Grain Industry',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: isTablet ? 12 : 10,
                            color: const Color(0xFF8A918C),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.15,
                          ),
                        ),
                      ),

                      SizedBox(width: isTablet ? 10 : 8),

                      Container(
                        width: isTablet ? 30 : 22,
                        height: 1,
                        color: gold,
                      ),
                    ],
                  ),

                  SizedBox(height: isTablet ? 18 : 12),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
