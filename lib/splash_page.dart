import 'package:flutter/material.dart';
import 'package:nxtpage_proj1/widgets/nxt_button.dart';
import 'package:nxtpage_proj1/pages/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Full text animation (Frame 1 → 2 → final position in Frame 3)
  late Animation<double> _textLeft;
  late Animation<double> _textTop;
  late Animation<double> _fontSize;

  // Frame 3 elements fade in after text lands
  late Animation<double> _finalLayoutOpacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    );

    // Phase 1 (0% – 45%): Frame 1 → 2
    // Text flies in from left and shrinks to 62.35px center position
    final phase1 = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.45, curve: Curves.easeInOut),
    );

    // Phase 2 (45% – 75%): Frame 2 → 3
    // Text continues shrinking and moves up to final title position
    final phase2 = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.45, 0.75, curve: Curves.easeInOut),
    );

    // Chained left position: -846 → 67 → 137
    _textLeft = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -846,
          end: 67,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 10,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 67,
          end: 137,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 40,
      ),
      TweenSequenceItem(tween: ConstantTween<double>(137), weight: 25),
    ]).animate(_controller);

    // Chained top position: 51 → 379 → 92
    _textTop = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 51,
          end: 379,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 10,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 379,
          end: 92,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 40,
      ),
      TweenSequenceItem(tween: ConstantTween<double>(92), weight: 25),
    ]).animate(_controller);

    // Chained font size: 500 → 62.35 → 32
    _fontSize = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 500,
          end: 62.35,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 10,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 62.35,
          end: 32,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 40,
      ),
      TweenSequenceItem(tween: ConstantTween<double>(32), weight: 25),
    ]).animate(_controller);

    // Frame 3 rest of layout fades in as text lands (70% – 100%)
    _finalLayoutOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.70, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E6),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              // ── FRAME 3: Everything except the title fades in ─────────────
              Opacity(
                opacity: _finalLayoutOpacity.value,
                child: SizedBox(
                  width: 393,
                  height: 852,
                  child: Stack(
                    children: [
                      // Logo image
                      Positioned(
                        left: -10,
                        top: 151,
                        child: Container(
                          width: 413,
                          height: 413,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/app_logotransbg.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // Mid gradient overlay
                      Positioned(
                        left: -12,
                        top: 493,
                        child: Container(
                          width: 403,
                          height: 84,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.50, 0.00),
                              end: Alignment(0.50, 1.00),
                              colors: [Color(0x00FFF3E6), Color(0xFFFFF3E6)],
                            ),
                          ),
                        ),
                      ),
                      // Tagline
                      Positioned(
                        left: 76,
                        top: 140,
                        child: SizedBox(
                          width: 241,
                          child: Text(
                            'A place for your next reads.',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF84513E),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // Bottom gradient + text + button
                      Positioned(
                        left: 0,
                        top: 600,
                        child: Container(
                          width: 393,
                          height: 252,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.50, -0.00),
                              end: Alignment(0.50, 1.00),
                              colors: [Color(0x00FFF3E6), Color(0xFFFFF3E6)],
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 82,
                                top: 0,
                                child: SizedBox(
                                  width: 243,
                                  child: Text(
                                    'Save your stuffs',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFF84513E),
                                      fontSize: 28,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 33,
                                top: 50,
                                child: SizedBox(
                                  width: 328,
                                  child: Text(
                                    'Search and access your curated links in seconds. Your next page is always just a quick tap away.',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFFB69A90),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 86,
                                top: 158,
                                child: NxtButton(
                                  label: 'Get Started',
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const HomePage(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── ANIMATED TEXT: travels through all 3 frames ───────────────
              Positioned(
                left: _textLeft.value,
                top: _textTop.value,
                child: DefaultTextStyle.merge(
                  style: const TextStyle(decoration: TextDecoration.none),
                  child: Text(
                    'nxtPage',
                    style: TextStyle(
                      color: const Color(0xFF84513E),
                      fontSize: _fontSize.value,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
