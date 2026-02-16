import 'package:flutter/foundation.dart';
import '../models/vessel.dart';
import '../services/mock_data_service.dart';

class VesselProvider with ChangeNotifier {
  List<Vessel> _vessels = [];
  Vessel? _selectedVessel;
  bool _isLoading = false;
  String? _error;
  bool _isRouteViewMode = false;
  Vessel? _routeViewVessel;

  List<Vessel> get vessels => _vessels;
  Vessel? get selectedVessel => _selectedVessel;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isRouteViewMode => _isRouteViewMode;
  Vessel? get routeViewVessel => _routeViewVessel;

  VesselProvider() {
    loadVessels();
  }

  Future<void> loadVessels() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(milliseconds: 800));
      _vessels = MockDataService.getAllVessels();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectVessel(Vessel? vessel) {
    _selectedVessel = vessel;
    notifyListeners();
  }

  void showRouteView(Vessel vessel) {
    _isRouteViewMode = true;
    _routeViewVessel = vessel;
    _selectedVessel = null;
    notifyListeners();
  }

  void exitRouteView() {
    _isRouteViewMode = false;
    _routeViewVessel = null;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  List<RoutePoint> getRouteForVessel(String vesselName) {
    return MockDataService.getRouteForVessel(vesselName);
  }
}
