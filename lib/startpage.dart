import 'package:crmapp/loginscreen.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final bool isTablet = width >= 600;

    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFC),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),

                child: Padding(
                  padding: EdgeInsets.only(
                    left: isTablet ? 70 : 28,
                    right: isTablet ? 70 : 28,
                    top: isTablet ? 28 : 18,
                    bottom: 4, // Reduced bottom space
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // ==================================================
                      // TOP BRANDING
                      // ==================================================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                              color: Color(0xFF087F3E),
                              shape: BoxShape.circle,
                            ),
                          ),

                          const SizedBox(width: 8),

                          Text(
                            'INDIAGRAIN CRM',
                            style: TextStyle(
                              fontSize: isTablet ? 15 : 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2.0,
                              color: const Color(0xFF087F3E),
                            ),
                          ),
                        ],
                      ),

                      // ==================================================
                      // LOGO
                      // ==================================================
                      SizedBox(height: isTablet ? 26 : 18),

                      Image.asset(
                        'assets/images/indiagrain_logo.jpeg',
                        width: isTablet ? width * 0.58 : width * 0.86,
                        fit: BoxFit.contain,
                      ),

                      // Space between logo and title
                      SizedBox(height: isTablet ? 20 : 14),

                      // ==================================================
                      // WELCOME TITLE
                      // ==================================================
                      Text(
                        'Welcome to IndiaGrain CRM',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isTablet ? 30 : 24,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF17251D),
                          letterSpacing: -0.4,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // ==================================================
                      // DESCRIPTION
                      // ==================================================
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 100 : 12,
                        ),

                        child: Text(
                          'Your complete workspace for managing '
                          'customers, enquiries and business operations.',

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: isTablet ? 17 : 14,
                            height: 1.5,
                            color: const Color(0xFF69736D),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      // Space before button
                      SizedBox(height: isTablet ? 32 : 24),

                      // ==================================================
                      // GET STARTED BUTTON
                      // ==================================================
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
                            backgroundColor: const Color(0xFF087F3E),

                            foregroundColor: Colors.white,

                            elevation: 5,

                            shadowColor: const Color(
                              0xFF087F3E,
                            ).withOpacity(0.25),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
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
                                ),
                              ),

                              const SizedBox(width: 12),

                              const Icon(Icons.arrow_forward_rounded, size: 21),
                            ],
                          ),
                        ),
                      ),

                      // Small space between button and footer
                      SizedBox(height: isTablet ? 18 : 12),

                      // ==================================================
                      // FOOTER
                      // ==================================================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Container(
                            width: 22,
                            height: 1,
                            color: const Color(0xFFD4B15E),
                          ),

                          const SizedBox(width: 8),

                          Flexible(
                            child: Text(
                              'A Complete Solution of Grain Industry',

                              textAlign: TextAlign.center,

                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,

                              style: TextStyle(
                                fontSize: isTablet ? 12 : 10,

                                color: const Color(0xFF8A918C),

                                fontWeight: FontWeight.w500,

                                letterSpacing: 0.1,
                              ),
                            ),
                          ),

                          const SizedBox(width: 8),

                          Container(
                            width: 22,
                            height: 1,
                            color: const Color(0xFFD4B15E),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
