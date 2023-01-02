import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => SwitchStateProvider(),
        lazy: true,
        child: const DesignScreen(),
      ),
    );
  }
}

class DesignScreen extends StatelessWidget {
  const DesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: white,
      body: Center(
        child: VpnSwitch(),
      ),
    );
  }
}

class VpnSwitch extends StatefulWidget {
  const VpnSwitch({Key? key}) : super(key: key);

  @override
  State<VpnSwitch> createState() => _VpnSwitchState();
}

class _VpnSwitchState extends State<VpnSwitch>
    with SingleTickerProviderStateMixin {
  late final AnimationController switchAnimationController;
  late final Animation<Alignment> switchAnimation;

  @override
  void initState() {
    super.initState();
    switchAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    switchAnimation = CurvedAnimation(
            parent: switchAnimationController, curve: Curves.easeInOut)
        .drive(AlignmentTween(
            begin: Alignment.topCenter, end: Alignment.bottomCenter));
  }

  @override
  void dispose() {
    switchAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<SwitchStateProvider, SwitchState>(
      selector: (context, vpnSwitch) => vpnSwitch.switchState,
      builder: (_, switchState, child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * .35,
          height: MediaQuery.of(context).size.height * .35,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: switchState == SwitchState.ON
                  ? [green, darkGreen]
                  : [grey, darkGrey],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 20,
                spreadRadius: 2,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (switchState == SwitchState.ON)
                const Positioned(
                  top: 0,
                  child: ArrowUpIcon(),
                ),
              if (switchState == SwitchState.OFF)
                const Positioned(
                  bottom: 0,
                  child: ArrowDownIcon(),
                ),
              child!,
            ],
          ),
        );
      },
      child: AnimatedBuilder(
        animation: switchAnimationController,
        builder: (context, child) {
          return Align(
            alignment: switchAnimation.value,
            child: child,
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VpnSwitchThumb(
                switchAnimationController: switchAnimationController),
          ],
        ),
      ),
    );
  }
}

class VpnSwitchThumb extends StatelessWidget {
  const VpnSwitchThumb({Key? key, required this.switchAnimationController})
      : super(key: key);
  final AnimationController switchAnimationController;

  @override
  Widget build(BuildContext context) {
    return Consumer<SwitchStateProvider>(
      builder: (_, vpnSwitch, __) {
        return GestureDetector(
          onPanUpdate: (DragUpdateDetails dragUpdateDetails) {
            if (dragUpdateDetails.delta.dy > 0 &&
                vpnSwitch.switchState == SwitchState.OFF) {
              vpnSwitch.switchState = SwitchState.ON;
              switchAnimationController.forward();
            } else if (dragUpdateDetails.delta.dy < 0 &&
                vpnSwitch.switchState == SwitchState.ON) {
              vpnSwitch.switchState = SwitchState.OFF;
              switchAnimationController.reverse();
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width * .35,
            height: MediaQuery.of(context).size.height * .35 * .6,
            decoration: BoxDecoration(
              color: vpnSwitch.switchState == SwitchState.ON
                  ? ligthGreen
                  : ligthGrey,
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              border: Border.all(
                color: vpnSwitch.switchState == SwitchState.ON ? green : grey,
                width: 5,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 5,
                  width: 20,
                  decoration: BoxDecoration(
                    color: vpnSwitch.switchState == SwitchState.ON
                        ? neonGreen
                        : green,
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    boxShadow: [
                      if (vpnSwitch.switchState == SwitchState.ON)
                        BoxShadow(
                          color: vpnSwitch.switchState == SwitchState.OFF
                              ? green
                              : neonGreen,
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 0),
                        ),
                    ],
                  ),
                ),
                Text(
                  vpnSwitch.switchState == SwitchState.ON ? 'STOP' : 'START',
                  style: const TextStyle(
                    color: white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: vpnSwitch.switchState == SwitchState.ON
                        ? ligthGreen
                        : ligthGrey,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 5,
                        spreadRadius: 3,
                        offset: const Offset(0, 5),
                        inset: true,
                      ),
                      BoxShadow(
                        color: vpnSwitch.switchState == SwitchState.ON
                            ? brightGreen
                            : brightGrey,
                        blurRadius: 5,
                        offset: const Offset(0, -5),
                        inset: true,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.power_settings_new_rounded,
                    color: vpnSwitch.switchState == SwitchState.ON
                        ? neonGreen
                        : white,
                    size: 40,
                    shadows: [
                      if (vpnSwitch.switchState == SwitchState.ON)
                        const BoxShadow(
                          color: neonGreen,
                          blurRadius: 15,
                          offset: Offset(0, 0),
                          inset: true,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ArrowUpIcon extends StatelessWidget {
  const ArrowUpIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.keyboard_arrow_up_rounded,
          color: Colors.white.withOpacity(0.5),
          size: 40,
        ),
        const Positioned(
          top: 10,
          child: Icon(
            Icons.keyboard_arrow_up_rounded,
            color: Colors.white,
            size: 50,
          ),
        ),
      ],
    );
  }
}

class ArrowDownIcon extends StatelessWidget {
  const ArrowDownIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        const Positioned(
          bottom: 10,
          child: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white,
            size: 50,
          ),
        ),
        Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Colors.white.withOpacity(0.5),
          size: 40,
        ),
      ],
    );
  }
}

class SwitchStateProvider extends ChangeNotifier {
  SwitchState _switchState = SwitchState.OFF;
  SwitchState get switchState => _switchState;
  set switchState(SwitchState value) {
    _switchState = value;
    Future.delayed(const Duration(milliseconds: 500), () {
      notifyListeners();
    });
  }
}

enum SwitchState { ON, OFF }

const brightGreen = Color.fromARGB(255, 122, 161, 152);
const ligthGreen = Color(0xff698A7F);
const green = Color(0xff384F47);
const darkGreen = Color(0xff152520);
const brightGrey = Color.fromARGB(255, 97, 97, 109);
const ligthGrey = Color(0xff575763);
const grey = Color.fromARGB(255, 63, 66, 78);
const darkGrey = Color(0xff121317);
const neonGreen = Color(0xff0FFF2E);
const white = Colors.white;
