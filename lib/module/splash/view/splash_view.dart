import 'package:blocwithgetit/Util/Ads/applovin.dart';
import 'package:blocwithgetit/Util/Constant/ad_unit.dart';
import 'package:blocwithgetit/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/splash_controller.dart';
import '../state/splash_state.dart';
import 'package:get_it/get_it.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashController controller = SplashController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<SplashController>()) {
      GetIt.I.unregister<SplashController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<SplashController, SplashState>(
        listener: (context, state) {
          appLovinBanner = state.ad[0].unit;
          appLovinInters = state.ad[1].unit;
          appLovinNative = state.ad[2].unit;
          appLovinReward = state.ad[3].unit;
          admobOpenAd = state.ad[4].unit;
          AdAppLovinNetwork.CAP = int.tryParse(state.ad[5].unit);
        },
        child: BlocBuilder<SplashController, SplashState>(
          builder: (context, state) {
            final bloc = context.read<SplashController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    SplashController controller,
    SplashState state,
  ) {
    return Scaffold(
      body: SafeArea(
        child: state.isReady
            ? Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 225,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        image: DecorationImage(
                            image: AssetImage('assets/images/melmod_gif.gif'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        loading(),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Center(
                          child: Text(
                            'Please wait...',
                            style: GoogleFonts.cousine(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : SizedBox(),
      ),
    );
  }
}
