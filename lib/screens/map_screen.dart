import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../models/vessel.dart';
import '../providers/vessel_provider.dart';
import '../widgets/vessel_list_sheet.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  
  List<LatLng> _animatedRoutePoints = [];
  Timer? _animationTimer;

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(25.0, -80.0),
    zoom: 3.0,
  );

  @override
  void dispose() {
    _animationTimer?.cancel();
    super.dispose();
  }

  void _animateRoute(List<RoutePoint> routePoints) {
    _animationTimer?.cancel();
    _animatedRoutePoints = [];
    
    if (routePoints.isEmpty) return;

    int currentIndex = 0;
    _animationTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (currentIndex >= routePoints.length) {
        timer.cancel();
        return;
      }

      setState(() {
        _animatedRoutePoints.add(
          LatLng(routePoints[currentIndex].latitude, routePoints[currentIndex].longitude)
        );
      });

      currentIndex++;
    });
  }

  void _updateMarkers(List<Vessel> vessels, bool isRouteMode, Vessel? routeVessel) {
    setState(() {
      _markers.clear();
      _polylines.clear();

      if (isRouteMode && routeVessel != null) {
        // Route view mode
        final provider = Provider.of<VesselProvider>(context, listen: false);
        final routePoints = provider.getRouteForVessel(routeVessel.vesselName);
        
        if (routePoints.isNotEmpty) {
          // Start marker
          _markers.add(Marker(
            markerId: const MarkerId('start'),
            position: LatLng(routePoints.first.latitude, routePoints.first.longitude),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
            infoWindow: const InfoWindow(title: 'Partenza'),
          ));

          // End marker
          _markers.add(Marker(
            markerId: const MarkerId('end'),
            position: LatLng(routePoints.last.latitude, routePoints.last.longitude),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            infoWindow: InfoWindow(title: 'Posizione Attuale', snippet: routeVessel.vesselName),
          ));

          // Animated polyline
          if (_animatedRoutePoints.length >= 2) {
            _polylines.add(Polyline(
              polylineId: const PolylineId('route'),
              points: _animatedRoutePoints,
              color: const Color(0xFF6BB6D6),
              width: 5,
              geodesic: true,
            ));
          }
        }
      } else {
        // Normal mode - all vessels
        for (var vessel in vessels) {
          _markers.add(Marker(
            markerId: MarkerId(vessel.caimFleetId),
            position: LatLng(vessel.latitude, vessel.longitude),
            infoWindow: InfoWindow(
              title: vessel.vesselName,
              snippet: vessel.statusText,
            ),
            onTap: () {
              Provider.of<VesselProvider>(context, listen: false)
                  .selectVessel(vessel);
            },
          ));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<VesselProvider>(
          builder: (context, provider, child) {
            return Text(
              provider.isRouteViewMode
                  ? 'Percorso - ${provider.routeViewVessel?.vesselName ?? ""}'
                  : 'MSC Vessel Tracker',
            );
          },
        ),
        backgroundColor: const Color(0xFF001F54),
        foregroundColor: Colors.white,
      ),
      body: Consumer<VesselProvider>(
        builder: (context, provider, child) {
          _updateMarkers(
            provider.vessels,
            provider.isRouteViewMode,
            provider.routeViewVessel,
          );

          // Trigger animation when entering route mode
          if (provider.isRouteViewMode && provider.routeViewVessel != null) {
            final route = provider.getRouteForVessel(provider.routeViewVessel!.vesselName);
            if (route.isNotEmpty && _animatedRoutePoints.isEmpty) {
              Future.microtask(() => _animateRoute(route));
            }
          } else {
            _animatedRoutePoints = [];
          }

          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: _initialPosition,
                markers: _markers,
                polylines: _polylines,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                myLocationButtonEnabled: false,
                zoomControlsEnabled: true,
              ),
              
              if (provider.isRouteViewMode)
                Positioned(
                  bottom: 32,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: ElevatedButton.icon(
                      onPressed: () => provider.exitRouteView(),
                      icon: const Icon(Icons.close),
                      label: const Text('Torna alla Mappa'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),

              if (provider.isLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
      floatingActionButton: Consumer<VesselProvider>(
        builder: (context, provider, child) {
          if (provider.isRouteViewMode) return const SizedBox.shrink();
          
          return FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => VesselListSheet(
                  vessels: provider.vessels,
                ),
              );
            },
            backgroundColor: const Color(0xFF6BB6D6),
            child: const Icon(Icons.list),
          );
        },
      ),
    );
  }
}
