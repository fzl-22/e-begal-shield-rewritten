// import 'dart:async';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:location/location.dart';

// class CurrentLocationProvider extends StateNotifier<LocationData>{
//   CurrentLocationProvider() : super(){
//     _timer = Timer.periodic(Duration(seconds: 1), (_) async {
//       state.getLocation().then((location) => state = location);
//     });
//   }

//   late final Timer _timer;

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
// }