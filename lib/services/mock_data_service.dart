import '../models/vessel.dart';

class MockDataService {
  static List<Vessel> getAllVessels() {
    return _mockVessels;
  }

  static List<RoutePoint> getRouteForVessel(String vesselName) {
    switch (vesselName) {
      case 'Explora I':
        return _routeExploraI;
      case 'MSC Grandiosa':
        return _routeMscGrandiosa;
      case 'MSC Seaside':
        return _routeMscSeaside;
      case 'MSC Meraviglia':
        return _routeMscMeraviglia;
      case 'MSC Bellissima':
        return _routeMscBellissima;
      case 'MSC World Europa':
        return _routeMscWorldEuropa;
      case 'MSC Seashore':
        return _routeMscSeashore;
      case 'MSC Virtuosa':
        return _routeMscVirtuosa;
      default:
        return [];
    }
  }

  static final List<Vessel> _mockVessels = [
    Vessel(
      caimFleetId: "855d004c-64cc-4c99-ae66-975f3e17c4d6",
      caimContractId: "c71ec96e-ce11-4707-bcab-6412e3f1d89b",
      caimContractNumber: "VY988664",
      vesselName: "Explora I",
      reportTime: "2026-02-12T08:10:20Z",
      lastUpdate: "2026-02-12T08:10:20Z",
      latitude: 25.153717,
      longitude: -79.785134,
      heading: 335.55,
      speedOverGround: 15.2,
      draught: 7.1,
      aisEngineStatusId: 0,
      destination: "USMIA",
      eta: "2026-02-12T10:45:00Z",
      imo: 9869875,
      mmsi: 256389000,
      trueWindSpeed: 8.8,
      trueWindDirection: 291.52,
    ),
    Vessel(
      caimFleetId: "5d2f90dc-cf8f-45e7-b05f-239d798dd3c3",
      caimContractId: "7dd28dcd-12af-4cc6-839c-d4fc74179fcb",
      caimContractNumber: "LM301153",
      vesselName: "MSC Grandiosa",
      reportTime: "2026-02-12T08:10:08Z",
      lastUpdate: "2026-02-12T08:10:06Z",
      latitude: 19.634014,
      longitude: -74.969481,
      heading: 65.07,
      speedOverGround: 17.7,
      draught: 8.6,
      aisEngineStatusId: 0,
      destination: "JMFMH",
      eta: "2026-02-11T12:00:00Z",
      imo: 9803613,
      mmsi: 215325000,
      trueWindSpeed: 23.3,
      trueWindDirection: 30.81,
    ),
    Vessel(
      caimFleetId: "5d2f90dc-cf8f-45e7-b05f-239d798dd3c3",
      caimContractId: "10be6b12-0ee9-413e-a291-a5a056b6f817",
      caimContractNumber: "VL419000",
      vesselName: "MSC Virtuosa",
      reportTime: "2026-02-12T08:10:06Z",
      lastUpdate: "2026-02-12T08:10:05Z",
      latitude: 17.098301,
      longitude: -62.195234,
      heading: 56.02,
      speedOverGround: 7.2,
      draught: 8.7,
      aisEngineStatusId: 0,
      destination: "AGSJO",
      eta: "2026-02-12T11:00:00Z",
      imo: 9803625,
      mmsi: 215610000,
      trueWindSpeed: 19.7,
      trueWindDirection: 91.27,
    ),
    // Add more vessels as needed
  ];

  static final List<RoutePoint> _routeExploraI = [
    RoutePoint(latitude: 25.7617, longitude: -80.1918, timestamp: "2026-02-10T16:00:00Z", speed: 0.0),
    RoutePoint(latitude: 25.7234, longitude: -80.2456, timestamp: "2026-02-10T17:00:00Z", speed: 12.5),
    RoutePoint(latitude: 25.6543, longitude: -80.3234, timestamp: "2026-02-10T18:00:00Z", speed: 16.8),
    RoutePoint(latitude: 24.5551, longitude: -81.8010, timestamp: "2026-02-11T03:00:00Z", speed: 16.8),
    RoutePoint(latitude: 23.1195, longitude: -82.3456, timestamp: "2026-02-12T05:00:00Z", speed: 0.0),
    RoutePoint(latitude: 25.0658, longitude: -77.3234, timestamp: "2026-02-13T09:00:00Z", speed: 0.0),
    RoutePoint(latitude: 25.153717, longitude: -79.785134, timestamp: "2026-02-12T08:10:20Z", speed: 15.2),
  ];

  static final List<RoutePoint> _routeMscGrandiosa = [
    RoutePoint(latitude: 18.5419, longitude: -72.3360, timestamp: "2026-02-11T00:00:00Z", speed: 17.5),
    RoutePoint(latitude: 18.9352, longitude: -73.4521, timestamp: "2026-02-11T04:00:00Z", speed: 17.8),
    RoutePoint(latitude: 19.3145, longitude: -74.3987, timestamp: "2026-02-11T08:00:00Z", speed: 17.5),
    RoutePoint(latitude: 19.634014, longitude: -74.969481, timestamp: "2026-02-12T08:10:08Z", speed: 17.7),
  ];

  static final List<RoutePoint> _routeMscSeaside = [
    RoutePoint(latitude: 25.0443, longitude: -77.3504, timestamp: "2026-02-11T22:00:00Z", speed: 18.5),
    RoutePoint(latitude: 25.2543, longitude: -77.4123, timestamp: "2026-02-12T04:00:00Z", speed: 10.8),
    RoutePoint(latitude: 25.376129, longitude: -77.430535, timestamp: "2026-02-12T08:10:18Z", speed: 9.6),
  ];

  static final List<RoutePoint> _routeMscMeraviglia = [
    RoutePoint(latitude: 25.0443, longitude: -77.3504, timestamp: "2026-02-11T18:00:00Z", speed: 19.2),
    RoutePoint(latitude: 25.6789, longitude: -77.9543, timestamp: "2026-02-12T00:00:00Z", speed: 17.9),
    RoutePoint(latitude: 26.106222, longitude: -78.639449, timestamp: "2026-02-12T08:10:14Z", speed: 16.9),
  ];

  static final List<RoutePoint> _routeMscBellissima = [
    RoutePoint(latitude: 31.3894, longitude: 121.4543, timestamp: "2026-02-11T20:00:00Z", speed: 12.3),
    RoutePoint(latitude: 31.4098, longitude: 121.4987, timestamp: "2026-02-12T02:00:00Z", speed: 2.8),
    RoutePoint(latitude: 31.412765, longitude: 121.503476, timestamp: "2026-02-12T08:10:16Z", speed: 0.1),
  ];

  static final List<RoutePoint> _routeMscWorldEuropa = [
    RoutePoint(latitude: 38.7223, longitude: -9.1393, timestamp: "2026-02-11T12:00:00Z", speed: 19.5),
    RoutePoint(latitude: 38.5234, longitude: -7.8456, timestamp: "2026-02-11T20:00:00Z", speed: 18.2),
    RoutePoint(latitude: 38.520255, longitude: 9.137882, timestamp: "2026-02-12T08:10:06Z", speed: 17.2),
  ];

  static final List<RoutePoint> _routeMscSeashore = [
    RoutePoint(latitude: 27.9506, longitude: -82.4572, timestamp: "2026-02-11T20:00:00Z", speed: 19.2),
    RoutePoint(latitude: 27.3890, longitude: -81.1234, timestamp: "2026-02-12T04:00:00Z", speed: 18.0),
    RoutePoint(latitude: 28.015531, longitude: -80.123624, timestamp: "2026-02-12T08:10:14Z", speed: 17.9),
  ];

  static final List<RoutePoint> _routeMscVirtuosa = [
    RoutePoint(latitude: 18.0731, longitude: -63.0822, timestamp: "2026-02-12T00:00:00Z", speed: 12.5),
    RoutePoint(latitude: 17.5456, longitude: -62.5789, timestamp: "2026-02-12T03:00:00Z", speed: 9.5),
    RoutePoint(latitude: 17.098301, longitude: -62.195234, timestamp: "2026-02-12T08:10:06Z", speed: 7.2),
  ];
}
