// // // // import 'package:flutter/material.dart';
// // // // import 'package:get/get.dart';
// // // // import 'package:mvvm_usamaa_app/const/const.dart';
// // // // import 'package:mvvm_usamaa_app/core/views_models/check_out_view_model.dart';
// // // // import 'package:mvvm_usamaa_app/views/screens/checkout/deliver_time_widget.dart';
// // // // import 'package:mvvm_usamaa_app/views/screens/checkout/add_address_widget.dart';
// // // // import 'package:mvvm_usamaa_app/views/screens/checkout/summary_widget.dart';

// // // // import 'package:status_change/status_change.dart';

// // // // class CheckoutView extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return GetBuilder<CheckOutViewModel>(
// // // //       builder: (controller) => Scaffold(
// // // //         appBar: AppBar(
// // // //           centerTitle: true,
// // // //           backgroundColor: Colors.white,
// // // //           elevation: 0.0,
// // // //           title: Text(
// // // //             "Order Status",
// // // //             style: TextStyle(
// // // //               color: Colors.black,
// // // //             ),
// // // //           ),
// // // //         ),
// // // //         backgroundColor: Colors.white,
// // // //         body: Column(
// // // //           children: [
// // // //             Expanded(
// // // //               child: Container(
// // // //                 child: StatusChange.tileBuilder(
// // // //                   theme: StatusChangeThemeData(
// // // //                     direction: Axis.horizontal,
// // // //                     connectorTheme:
// // // //                         ConnectorThemeData(space: 1.0, thickness: 1.0),
// // // //                   ),
// // // //                   builder: StatusChangeTileBuilder.connected(
// // // //                     itemWidth: (_) =>
// // // //                         MediaQuery.of(context).size.width / _processes.length,
// // // //                     contentWidgetBuilder: (context, index) {
// // // //                       return Padding(
// // // //                         padding: const EdgeInsets.all(15.0),
// // // //                         child: Text(
// // // //                           'add content here',
// // // //                           style: TextStyle(
// // // //                             color: Colors
// // // //                                 .blue, // change color with dynamic color --> can find it with example section
// // // //                           ),
// // // //                         ),
// // // //                       );
// // // //                     },
// // // //                     nameWidgetBuilder: (context, index) {
// // // //                       return Padding(
// // // //                         padding: const EdgeInsets.all(20),
// // // //                         child: Text(
// // // //                           'your text ',
// // // //                           style: TextStyle(
// // // //                             fontWeight: FontWeight.bold,
// // // //                             color: controller.getColor(index),
// // // //                           ),
// // // //                         ),
// // // //                       );
// // // //                     },
// // // //                     indicatorWidgetBuilder: (_, index) {
// // // //                       if (index <= controller.index) {
// // // //                         return DotIndicator(
// // // //                           size: 35.0,
// // // //                           border: Border.all(color: Colors.green, width: 1),
// // // //                           child: Padding(
// // // //                             padding: const EdgeInsets.all(6.0),
// // // //                             child: Container(
// // // //                               decoration: BoxDecoration(
// // // //                                 shape: BoxShape.circle,
// // // //                                 color: Colors.green,
// // // //                               ),
// // // //                             ),
// // // //                           ),
// // // //                         );
// // // //                       } else {
// // // //                         return OutlinedDotIndicator(
// // // //                           size: 30,
// // // //                           borderWidth: 1.0,
// // // //                           color: todoColor,
// // // //                         );
// // // //                       }
// // // //                     },
// // // //                     lineWidgetBuilder: (index) {
// // // //                       if (index > 0) {
// // // //                         if (index == controller.index) {
// // // //                           final prevColor = controller.getColor(index - 1);
// // // //                           final color = controller.getColor(index);
// // // //                           var gradientColors;
// // // //                           gradientColors = [
// // // //                             prevColor,
// // // //                             Color.lerp(prevColor, color, 0.5)
// // // //                           ];
// // // //                           return DecoratedLineConnector(
// // // //                             decoration: BoxDecoration(
// // // //                               gradient: LinearGradient(
// // // //                                 colors: gradientColors,
// // // //                               ),
// // // //                             ),
// // // //                           );
// // // //                         } else {
// // // //                           return SolidLineConnector(
// // // //                             color: controller.getColor(index),
// // // //                           );
// // // //                         }
// // // //                       } else {
// // // //                         return null;
// // // //                       }
// // // //                     },
// // // //                     itemCount: _processes.length,
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             controller.pages == Pages.DeliveryTime
// // // //                 ? DeliveryTime()
// // // //                 : controller.pages == Pages.AddAddress
// // // //                     ? AddAddress()
// // // //                     : Summary()
// // // //           ],
// // // //         ),
// // // //         floatingActionButton: FloatingActionButton(
// // // //           child: Icon(Icons.skip_next),
// // // //           onPressed: () {
// // // //             controller.changeIndex(controller.index + 1);
// // // //           },
// // // //           backgroundColor: inProgressColor,
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // final _processes = [
// // // //   'Order Signed',
// // // //   'Order Processed',
// // // //   'Shipped ',
// // // //   'Out for delivery ',
// // // //   'Delivered ',
// // // // ];

// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/src/widgets/container.dart';
// // // import 'package:flutter/src/widgets/framework.dart';
// // // import 'package:status_change/status_change.dart';

// // // class CheckView extends StatefulWidget {
// // //   const CheckView({super.key});

// // //   @override
// // //   State<CheckView> createState() => _CheckViewState();
// // // }

// // // class _CheckViewState extends State<CheckView> {
// // //   final _processes = [
// // //   'Order Signed',
// // //   'Order Processed',
// // //   'Shipped ',
// // //   'Out for delivery ',
// // //   'Delivered ',
// // // ];
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Column(
// // //         children: [
// // //           StatusChange.tileBuilder(
// // //                 theme: StatusChangeThemeData(
// // //                   direction: Axis.vertical,
// // //                   connectorTheme:
// // //                       ConnectorThemeData(space: 1.0, thickness: 1.0),
// // //                 ),
// // //                 builder: StatusChangeTileBuilder.connected(
// // //                   itemWidth: (_) =>
// // //                       MediaQuery.of(context).size.width / _processes.length,
// // //                   contentWidgetBuilder: (context, index) {
// // //                     return Padding(
// // //                       padding: const EdgeInsets.all(15.0),
// // //                       child: Text(
// // //                         'add content here',
// // //                         style: TextStyle(
// // //                           color: Colors
// // //                               .blue, // change color with dynamic color --> can find it with example section
// // //                         ),
// // //                       ),
// // //                     );
// // //                   },
// // //                   nameWidgetBuilder: (context, index) {
// // //                     return Padding(
// // //                       padding: const EdgeInsets.all(20),
// // //                       child: Text(
// // //                         'your text ',
// // //                         style: TextStyle(
// // //                           fontWeight: FontWeight.bold,
// // //                           color: getColor(index),
// // //                         ),
// // //                       ),
// // //                     );
// // //                   },
// // //                   indicatorWidgetBuilder: (_, index) {
// // //                     if (index <= _processIndex) {
// // //                       return DotIndicator(
// // //                         size: 35.0,
// // //                         border: Border.all(color: Colors.green, width: 1),
// // //                         child: Padding(
// // //                           padding: const EdgeInsets.all(6.0),
// // //                           child: Container(
// // //                             decoration: BoxDecoration(
// // //                               shape: BoxShape.circle,
// // //                               color: Colors.green,
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       );
// // //                     } else {
// // //                       return OutlinedDotIndicator(
// // //                         size: 30,
// // //                         borderWidth: 1.0,
// // //                         color: todoColor,
// // //                       );
// // //                     }
// // //                   },
// // //                   lineWidgetBuilder: (index) {
// // //                     if (index > 0) {
// // //                       if (index == _processIndex) {
// // //                         final prevColor = getColor(index - 1);
// // //                         final color = getColor(index);
// // //                         var gradientColors;
// // //                         gradientColors = [
// // //                           prevColor,
// // //                           Color.lerp(prevColor, color, 0.5)
// // //                         ];
// // //                         return DecoratedLineConnector(
// // //                           decoration: BoxDecoration(
// // //                             gradient: LinearGradient(
// // //                               colors: gradientColors,
// // //                             ),
// // //                           ),
// // //                         );
// // //                       } else {
// // //                         return SolidLineConnector(
// // //                           color: getColor(index),
// // //                         );
// // //                       }
// // //                     } else {
// // //                       return null;
// // //                     }
// // //                   },
// // //                   itemCount: _processes.length,
// // //                 ),
// // //               ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:mvvm_usamaa_app/const/const.dart';
// // import 'package:status_change/status_change.dart';

// // class CheckoutView extends StatefulWidget {
// //   @override
// //   _CheckoutViewState createState() => _CheckoutViewState();
// // }

// // class _CheckoutViewState extends State<CheckoutView> {
// //   int _processIndex = 0;
// //   Pages pages = Pages.DeliveryTime;

// //   Color getColor(int index) {
// //     if (index == _processIndex) {
// //       return inProgressColor;
// //     } else if (index < _processIndex) {
// //       return Colors.green;
// //     } else {
// //       return todoColor;
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         centerTitle: true,
// //         backgroundColor: Colors.white,
// //         elevation: 0.0,
// //         title: Text(
// //           "Order Status",
// //           style: TextStyle(
// //             color: Colors.black,
// //           ),
// //         ),
// //       ),
// //       backgroundColor: Colors.white,
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: Container(
// //               child: StatusChange.tileBuilder(
// //                 theme: StatusChangeThemeData(
// //                   direction: Axis.horizontal,
// //                   connectorTheme:
// //                       ConnectorThemeData(space: 1.0, thickness: 1.0),
// //                 ),
// //                 builder: StatusChangeTileBuilder.connected(
// //                   itemWidth: (_) =>
// //                       MediaQuery.of(context).size.width / _processes.length,
// //                   contentWidgetBuilder: (context, index) {
// //                     return Padding(
// //                       padding: const EdgeInsets.all(15.0),
// //                       child: Text(
// //                         'add content here',
// //                         style: TextStyle(
// //                           color: Colors
// //                               .blue, // change color with dynamic color --> can find it with example section
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                   nameWidgetBuilder: (context, index) {
// //                     return Padding(
// //                       padding: const EdgeInsets.all(20),
// //                       child: Text(
// //                         'your text ',
// //                         style: TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                           color: getColor(index),
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                   indicatorWidgetBuilder: (_, index) {
// //                     if (index <= _processIndex) {
// //                       return DotIndicator(
// //                         size: 35.0,
// //                         border: Border.all(color: Colors.green, width: 1),
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(6.0),
// //                           child: Container(
// //                             decoration: BoxDecoration(
// //                               shape: BoxShape.circle,
// //                               color: Colors.green,
// //                             ),
// //                           ),
// //                         ),
// //                       );
// //                     } else {
// //                       return OutlinedDotIndicator(
// //                         size: 30,
// //                         borderWidth: 1.0,
// //                         color: todoColor,
// //                       );
// //                     }
// //                   },
// //                   lineWidgetBuilder: (index) {
// //                     if (index > 0) {
// //                       if (index == _processIndex) {
// //                         final prevColor = getColor(index - 1);
// //                         final color = getColor(index);
// //                         var gradientColors;
// //                         gradientColors = [
// //                           prevColor,
// //                           Color.lerp(prevColor, color, 0.5)
// //                         ];
// //                         return DecoratedLineConnector(
// //                           decoration: BoxDecoration(
// //                             gradient: LinearGradient(
// //                               colors: gradientColors,
// //                             ),
// //                           ),
// //                         );
// //                       } else {
// //                         return SolidLineConnector(
// //                           color: getColor(index),
// //                         );
// //                       }
// //                     } else {
// //                       return null;
// //                     }
// //                   },
// //                   itemCount: _processes.length,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         child: Icon(Icons.skip_next),
// //         onPressed: () {},
// //         backgroundColor: inProgressColor,
// //       ),
// //     );
// //   }
// // }

// // final _processes = [
// //   'Order Signed',
// //   'Order Processed',
// //   'Shipped ',
// //   'Out for delivery ',
// //   'Delivered ',
// // ];

// // final _content = [
// //   '20/18',
// //   '20/18',
// //   '20/18',
// //   '20/18',
// //   '20/18',
// // ];

// import 'package:flutter/material.dart';
// import 'package:mvvm_usamaa_app/const/const.dart';
// import 'package:status_change/status_change.dart';

// class HorizontalExample extends StatefulWidget {
//   @override
//   _HorizontalExampleState createState() => _HorizontalExampleState();
// }

// class _HorizontalExampleState extends State<HorizontalExample> {
//   int _processIndex = 0;
//   Pages pages = Pages.DeliveryTime;

//   Color getColor(int index) {
//     if (index == _processIndex) {
//       return inProgressColor;
//     } else if (index < _processIndex) {
//       return Colors.green;
//     } else {
//       return todoColor;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         title: Text(
//           "Order Status",
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               child: StatusChange.tileBuilder(
//                 theme: StatusChangeThemeData(
//                   direction: Axis.horizontal,
//                   connectorTheme:
//                       ConnectorThemeData(space: 1.0, thickness: 1.0),
//                 ),
//                 builder: StatusChangeTileBuilder.connected(
//                   itemWidth: (_) =>
//                       MediaQuery.of(context).size.width / _processes.length,
//                   contentWidgetBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: Text(
//                         'add content here',
//                         style: TextStyle(
//                             color: Colors
//                                 .blue // change color with dynamic color --> can find it with example section
//                             ),
//                       ),
//                     );
//                   },
//                   nameWidgetBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(20),
//                       child: Text(
//                         'your text ',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: getColor(index),
//                         ),
//                       ),
//                     );
//                   },
//                   indicatorWidgetBuilder: (_, index) {
//                     if (index <= _processIndex) {
//                       return DotIndicator(
//                         size: 35.0,
//                         border: Border.all(color: Colors.green, width: 1),
//                         child: Padding(
//                           padding: const EdgeInsets.all(6.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.green,
//                             ),
//                           ),
//                         ),
//                       );
//                     } else {
//                       return OutlinedDotIndicator(
//                         size: 30,
//                         borderWidth: 1.0,
//                         color: todoColor,
//                       );
//                     }
//                   },
//                   lineWidgetBuilder: (index) {
//                     if (index > 0) {
//                       if (index == _processIndex) {
//                         final prevColor = getColor(index - 1);
//                         final color = getColor(index);
//                         var gradientColors;
//                         gradientColors = [
//                           prevColor,
//                           Color.lerp(prevColor, color, 0.5)
//                         ];
//                         return DecoratedLineConnector(
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: gradientColors,
//                             ),
//                           ),
//                         );
//                       } else {
//                         return SolidLineConnector(
//                           color: getColor(index),
//                         );
//                       }
//                     } else {
//                       return null;
//                     }
//                   },
//                   itemCount: _processes.length,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.skip_next),
//         onPressed: () {
//           print(_processIndex);
//           setState(() {
//             _processIndex++;

//             if (_processIndex == 5) {}
//           });
//         },
//         backgroundColor: inProgressColor,
//       ),
//     );
//   }
// }

// final _processes = [
//   'Order Signed',
//   'Order Processed',
//   'Shipped ',
//   'Out for delivery ',
//   'Delivered ',
// ];

// final _content = [
//   '20/18',
//   '20/18',
//   '20/18',
//   '20/18',
//   '20/18',
// ];
import 'package:flutter/material.dart';
import 'package:mvvm_usamaa_app/const/const.dart';
import 'package:status_change/status_change.dart';

class VerticalExample extends StatefulWidget {
  @override
  _VerticalExampleState createState() => _VerticalExampleState();
}

class _VerticalExampleState extends State<VerticalExample> {
  int _processIndex = 0;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Order Status",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: StatusChange.tileBuilder(
                theme: StatusChangeThemeData(
                  direction: Axis.vertical,
                  connectorTheme:
                      ConnectorThemeData(space: 1.0, thickness: 1.0),
                ),
                builder: StatusChangeTileBuilder.connected(
                  itemWidth: (_) =>
                      MediaQuery.of(context).size.width / _processes.length,
                  contentWidgetBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'add content here',
                        style: TextStyle(
                          color: Colors
                              .blue, // change color with dynamic color --> can find it with example section
                        ),
                      ),
                    );
                  },
                  nameWidgetBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'your text ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: getColor(index),
                        ),
                      ),
                    );
                  },
                  indicatorWidgetBuilder: (_, index) {
                    if (index <= _processIndex) {
                      return DotIndicator(
                        size: 35.0,
                        border: Border.all(color: Colors.green, width: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return OutlinedDotIndicator(
                        size: 30,
                        borderWidth: 1.0,
                        color: todoColor,
                      );
                    }
                  },
                  lineWidgetBuilder: (index) {
                    if (index > 0) {
                      if (index == _processIndex) {
                        final prevColor = getColor(index - 1);
                        final color = getColor(index);
                        var gradientColors;
                        gradientColors = [
                          prevColor,
                          Color.lerp(prevColor, color, 0.5)
                        ];
                        return DecoratedLineConnector(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColors,
                            ),
                          ),
                        );
                      } else {
                        return SolidLineConnector(
                          color: getColor(index),
                        );
                      }
                    } else {
                      return null;
                    }
                  },
                  itemCount: _processes.length,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.skip_next),
        onPressed: () {
          print(_processIndex);
          setState(() {
            _processIndex++;

            if (_processIndex == 5) {}
          });
        },
        backgroundColor: inProgressColor,
      ),
    );
  }
}

final _processes = [
  'Order Signed',
  'Order Processed',
  'Shipped ',
  'Out for delivery ',
  'Delivered ',
];

final _content = [
  '20/18',
  '20/18',
  '20/18',
  '20/18',
  '20/18',
];
