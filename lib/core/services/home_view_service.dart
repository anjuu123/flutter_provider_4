import 'package:flutter_provider_arch/core/models/places.dart';
import 'package:flutter_provider_arch/core/services/api.dart';
import 'package:flutter_provider_arch/core/services/db_service.dart';

class HomeViewService {
  final Api api;
  final DbService dbService;

  HomeViewService({this.api, this.dbService});

  List<Place> _places = [];

  List<Place> get places => List.from(_places);

  getAllPlacesFromLocal() async {
    final data = await dbService.fetchAllPlaces();
    _places.addAll(data);

  }
  getAllPlacesFromServer() async {
    final data = await api.getAllPlace();
    _places.addAll(data); 
  }
}
