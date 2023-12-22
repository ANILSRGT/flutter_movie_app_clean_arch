part of '../splash_view.dart';

/// [_SplashLogo] is the logo of the splash screen.
class _SplashLogo extends StatefulWidget {
  /// [_SplashLogo] constructor
  const _SplashLogo();

  @override
  State<_SplashLogo> createState() => _SplashLogoState();
}

class _SplashLogoState extends State<_SplashLogo>
    with TickerProviderStateMixin {
  final _scaleTween = Tween<double>(begin: 0.9, end: 1);
  final _fadeTween = Tween<double>(begin: 0.5, end: 1);
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  )..repeat(reverse: true);
  late final Animation<double> _animation =
      CurveTween(curve: Curves.easeInOutQuad).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    _animation.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildTransitions;
  }

  FadeTransition get _buildTransitions {
    return FadeTransition(
      opacity: _fadeTween.animate(_animation),
      child: ScaleTransition(
        scale: _scaleTween.animate(_animation),
        child: _buildSplashLogo,
      ),
    );
  }

  FlutterLogo get _buildSplashLogo {
    return const FlutterLogo(
      size: 100,
    );
  }
}
