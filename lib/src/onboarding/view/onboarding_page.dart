import 'dart:math';

import 'package:donut/src/auth/view/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:donut/src/auth/auth.dart';
import 'package:donut/src/onboarding/view/view.dart';
import 'package:donut/src/onboarding/widgets/widgets.dart';

class OnboardingPage extends StatefulWidget {
  final double screenHeight;

  const OnboardingPage({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  static Route route(double screenHeight) {
    return MaterialPageRoute<void>(
        builder: (_) => OnboardingPage(screenHeight: screenHeight));
  }

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with TickerProviderStateMixin {
  late final AnimationController _cardsAnimationController;
  late final AnimationController _pageIndicatorAnimationController;
  late final AnimationController _rippleAnimationController;

  late Animation<Offset> _slideAnimationImage;
  late Animation<double> _pageIndicatorAnimation;
  late Animation<double> _rippleAnimation;

  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _cardsAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _pageIndicatorAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _rippleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _rippleAnimation = Tween<double>(
      begin: 0.0,
      end: widget.screenHeight,
    ).animate(CurvedAnimation(
      parent: _rippleAnimationController,
      curve: Curves.easeIn,
    ));

    _setPageIndicatorAnimation();
    _setCardsSlideOutAnimation();
  }

  @override
  void dispose() {
    _cardsAnimationController.dispose();
    _pageIndicatorAnimationController.dispose();
    _rippleAnimationController.dispose();
    super.dispose();
  }

  bool get isFirstPage => _currentPage == 1;

  Widget _getPage() {
    switch (_currentPage) {
      case 1:
        return Onboarding(
          number: 1,
          image: Image.asset("assets/images/who.png"),
          imageAnimation: _slideAnimationImage,
          textColumn: const TextColumn(
            title: "Introduction",
            text:
                "We are a group of sec 3 students from Hwa Chong who have created this app to allow users to donate to the needy directly",
          ),
        );
      case 2:
        return Onboarding(
          number: 2,
          image: Image.asset("assets/images/question_mark.png"),
          imageAnimation: _slideAnimationImage,
          textColumn: const TextColumn(
            title: "Our Rationale",
            text:
                "- To make donation convenient so that more people would be encouraged to donate \n- To allow donors to directly get in touch with the needy",
          ),
        );
      case 3:
        return Onboarding(
          number: 3,
          image: Image.asset("assets/images/audience.png"),
          imageAnimation: _slideAnimationImage,
          textColumn: const TextColumn(
            title: "Target Audience",
            text:
                "- Members of the public looking for a convenient way to donate \n- The needy who are looking for useful items or necessities",
          ),
        );
      case 4:
        return Onboarding(
          number: 4,
          image: Image.asset("assets/images/target.png"),
          imageAnimation: _slideAnimationImage,
          textColumn: const TextColumn(
            title: "Our Objectives",
            text:
                "- Help those in need through the creation of a donation App\n- Provide a more convenient way of donation rather than going down to charity donation collection points",
          ),
        );
      default:
        throw Exception("Page with number $_currentPage does not exist.");
    }
  }

  void _setCardsSlideInAnimation() {
    setState(() {
      _slideAnimationImage = Tween<Offset>(
        begin: const Offset(1.5, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeOut,
      ));
      _cardsAnimationController.reset();
    });
  }

  void _setCardsSlideOutAnimation() {
    setState(() {
      _slideAnimationImage = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-1.5, 0.0),
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeIn,
      ));
      _cardsAnimationController.reset();
    });
  }

  void _setPageIndicatorAnimation({bool isClockwiseAnimation = true}) {
    final multiplier = isClockwiseAnimation ? 2 : -2;

    setState(() {
      _pageIndicatorAnimation = Tween(
        begin: 0.0,
        end: multiplier * pi,
      ).animate(
        CurvedAnimation(
          parent: _pageIndicatorAnimationController,
          curve: Curves.easeIn,
        ),
      );
      _pageIndicatorAnimationController.reset();
    });
  }

  void _setNextPage(int nextPageNumber) {
    setState(() {
      _currentPage = nextPageNumber;
    });
  }

  Future<void> _nextPage() async {
    switch (_currentPage) {
      case 1:
        if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
          _pageIndicatorAnimationController.forward();
          await _cardsAnimationController.forward();
          _setNextPage(2);
          _setCardsSlideInAnimation();
          await _cardsAnimationController.forward();
          _setCardsSlideOutAnimation();
          _setPageIndicatorAnimation(isClockwiseAnimation: false);
        }
        break;
      case 2:
        if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
          _pageIndicatorAnimationController.forward();
          await _cardsAnimationController.forward();
          _setNextPage(3);
          _setCardsSlideInAnimation();
          await _cardsAnimationController.forward();
          _setCardsSlideOutAnimation();
          _setPageIndicatorAnimation(isClockwiseAnimation: false);
        }
        break;
      case 3:
        if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
          _pageIndicatorAnimationController.forward();
          await _cardsAnimationController.forward();
          _setNextPage(4);
          _setCardsSlideInAnimation();
          await _cardsAnimationController.forward();
        }
        break;
      case 4:
        if (_pageIndicatorAnimation.status == AnimationStatus.completed) {
          await _goToWelcome();
        }
        break;
    }
  }

  Future<void> _goToWelcome() async {
    await _rippleAnimationController.forward();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.pink.shade100, Colors.pink.shade300])),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                children: <Widget>[
                  Header(onSkip: _goToWelcome),
                  Expanded(child: _getPage()),
                  AnimatedBuilder(
                    animation: _pageIndicatorAnimation,
                    builder: (_, Widget? child) {
                      return OnboardingPageIndicator(
                        angle: _pageIndicatorAnimation.value,
                        currentPage: _currentPage,
                        child: child!,
                      );
                    },
                    child: NextPageButton(onPressed: _nextPage),
                  ),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _rippleAnimation,
            builder: (_, Widget? child) {
              return Ripple(radius: _rippleAnimation.value);
            },
          ),
        ],
      ),
    );
  }
}
