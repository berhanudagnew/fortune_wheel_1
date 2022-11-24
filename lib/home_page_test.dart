import 'dart:math';

import 'package:flutter/material.dart';

import 'board_view.dart';
import 'model.dart';
import 'components/bottom_menu.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Size get size => Size(MediaQuery.of(context).size.width * 0.8,
      MediaQuery.of(context).size.width * 0.8);

  late var score;
  double _angle = 0;
  double _current = 0;
  late AnimationController _ctrl;
  late Animation _ani;
  List<Luck> _items = [
    Luck("apple", Colors.accents[0]),
    Luck("raspberry", Colors.accents[2]),
    Luck("grapes", Colors.accents[4]),
    Luck("fruit", Colors.accents[6]),
    Luck("milk", Colors.accents[8]),
    Luck("salad", Colors.accents[10]),
    Luck("cheese", Colors.accents[12]),
    Luck("carrot", Colors.accents[14]),
    // Luck("carrot", Colors.green),
    // Luck("carrot", Colors.green),
    // Luck("carrot", Colors.green),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    score = 0;
    var _duration = Duration(milliseconds: 5000);
    _ctrl = AnimationController(vsync: this, duration: _duration);
    print(_ctrl.isAnimating);
    _ani = CurvedAnimation(parent: _ctrl, curve: Curves.fastLinearToSlowEaseIn);
    print(_ani.isCompleted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  colors: [
                Color(0xFF64138E),
                Color(0xFF64138E).withOpacity(0.2),
                Color(0xFF64138E)
              ])),
          child: Column(
            // mainAxisAlignment: MainAxisSize.max,
            children: [
              // Score wallet_icon container
              Container(
                height: 60,
                child: Stack(
                  children: [
                    Positioned(
                      top: 15,
                      left: 50,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        // Score container
                        child: Container(
                          alignment: AlignmentDirectional.centerEnd,
                          height: 30,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Color(0xFFF7C000),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Text(
                            ' + \$${score.toString()}  ',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      left: 15,
                      // Wallet_icon card
                      child: Card(
                        elevation: 9,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        // Wallet icon container
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/images/coin_wallet.png'))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Generated code for this Wheel Widget...
              Text(
                'You have',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '2 free spins',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              // Spinning wheel picture card
              AnimatedBuilder(
                  animation: _ani,
                  builder: (context, child) {
                    final _value = _ani.value;
                    final _angle = _value * this._angle;
                    return Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        BoardView(
                            items: _items, current: _current, angle: _angle),
                        _buildGo(),
                        // _buildResult(_value),
                      ],
                    );
                  }),
              // Spinning results.
              Card(
                elevation: 8,
                color: Colors.purple[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    // image: DecorationImage(
                    //   fit: BoxFit.fill,
                    //   image: AssetImage('assets/images/wheel.png'),
                    // ),
                  ),
                  child: AnimatedBuilder(
                      animation: _ani,
                      builder: (context, child) {
                        final _value = _ani.value;
                        // final _angle = _value * this._angle;
                        return Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            _buildResult(_value),
                          ],
                        );
                      }),
                ),
              ),
              // Avatur image column
              // Generated code for this CircleImage Widget...
              // _buildResult(_value),
              // Card(
              //   elevation: 8,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(40.0),
              //   ),
              //   child: Container(
              //     height: 80,
              //     width: 80,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10.0),
              //         image: DecorationImage(
              //             fit: BoxFit.fill,
              //             image: AssetImage('assets/images/coin_wallet.png'))),
              //   ),
              // ),
              // Bottum menu columen
              BottomMenu(
                icon_background: Color(0xFF2AEBB1),
                icon: Icon(Icons.calendar_month_rounded,
                    color: Colors.white, size: (60)),
                menu_text: ' Daily Check In ',
                button_text: ' Check In ',
              ),
              BottomMenu(
                icon_background: Color(0xFFF814B4),
                icon: Icon(Icons.connected_tv_sharp,
                    color: Colors.white, size: (60)),
                menu_text: ' Watch Videos ',
                button_text: ' Watch ',
              ),
              BottomMenu(
                icon_background: Color(0xFFF814B4),
                icon: Icon(Icons.group_sharp, color: Colors.white, size: (60)),
                menu_text: ' Invite Freinds ',
                button_text: ' Invite ',
              ),
            ],
          ),
        ),
      )),
    );
  }

  _buildGo() {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(size.height),
      ),
      width: size.width / 2,
      height: size.height / 2,
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(size.height / 2 - 20),
        ),
        height: size.height / 2 - 20,
        width: size.width / 2 - 20,
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size.height / 2 - 45),
          ),
          height: size.height / 2 - 45,
          width: size.width / 2 - 45,
          alignment: Alignment.center,
          child: InkWell(
            customBorder: CircleBorder(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(size.height / 2 - 50),
              ),
              height: size.height / 2 - 50,
              width: size.width / 2 - 50,
              alignment: Alignment.center,
              child: Text(
                "GO",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            onTap: _animation,
          ),
        ),
      ),
    );
  }

  _animation() {
    print('is completed');
    print(_ani.isCompleted);
    if (!_ctrl.isAnimating) {
      score = 0;
      print(score);
      var _random = Random().nextDouble();
      _angle = 20 + Random().nextInt(5) + _random;
      _ctrl.forward(from: 0.0).then((_) {
        _current = (_current + _random);
        _current = _current - _current ~/ 1;
        _ctrl.reset();
      });
    }
  }

  int _calIndex(value) {
    var _base = (2 * pi / _items.length / 2) / (2 * pi);
    return (((_base + value) % 1) * _items.length).floor();
  }

  _buildResult(_value) {
    var _index = _calIndex(_value * _angle + _current);
    String _asset = _items[_index].asset;
    score = _index;
    // if (_ani) print('result');
    print(_ani.isCompleted);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(_asset, height: 80, width: 80),
      ),
    );
  }
}



// AnimatedBuilder(
//             animation: _ani,
//             builder: (context, child) {
//               final _value = _ani.value;
//               final _angle = _value * this._angle;
//               return Stack(
//                 alignment: Alignment.center,
//                 children: <Widget>[
//                   BoardView(items: _items, current: _current, angle: _angle),
//                   _buildGo(),
//                   _buildResult(_value),
//                 ],
//               );
//             }),


// InkWell(
//         customBorder: CircleBorder(),
//         child: Container(
//           alignment: Alignment.center,
//           height: 120,
//           width: 120,
//           child: Text(
//             "GO",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 22.0,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         onTap: _animation,
//       ),