// import 'package:dio/dio.dart';

// class DirectionRepository{
//   static const String _baseUrl = 'https://maps.googleapis.com/maps/api/directions/json?';

//   final Dio _dio;

//   DirectionRepository({Dio? dio}) : _dio = dio ?? Dio();

//   // Future<Directions> getDirections({required LatLng origin, required LatLng destination}) async {
//   //   final response = await _dio.get(_baseUrl, queryParameters: {
//   //     'origin': '${origin.latitude},${origin.longitude}',
//   //     'destination': '${destination.latitude},${destination.longitude}',
//   //     'key': googleAPIKey,
//   //   });

//   //   if(response.statusCode == 200){
//   //     return Directions.fromMap(response.data);
//   //   }

//   //   // return null;
//   // }
// }