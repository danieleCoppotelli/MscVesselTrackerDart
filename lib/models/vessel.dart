import 'package:json_annotation/json_annotation.dart';

part 'vessel.g.dart';

@JsonSerializable()
class Vessel {
  @JsonKey(name: 'caim_fleet_id')
  final String caimFleetId;
  
  @JsonKey(name: 'caim_contract_id')
  final String caimContractId;
  
  @JsonKey(name: 'caim_contract_number')
  final String caimContractNumber;
  
  @JsonKey(name: 'vessel_name')
  final String vesselName;
  
  @JsonKey(name: 'report_time')
  final String reportTime;
  
  @JsonKey(name: 'last_update')
  final String lastUpdate;
  
  @JsonKey(name: 'lat')
  final double latitude;
  
  @JsonKey(name: 'lon')
  final double longitude;
  
  @JsonKey(name: 'hdg')
  final double heading;
  
  @JsonKey(name: 'sog')
  final double speedOverGround;
  
  @JsonKey(name: 'draught')
  final double draught;
  
  @JsonKey(name: 'ais_engine_status_id')
  final int aisEngineStatusId;
  
  @JsonKey(name: 'destination')
  final String? destination;
  
  @JsonKey(name: 'eta')
  final String? eta;
  
  @JsonKey(name: 'imo')
  final int imo;
  
  @JsonKey(name: 'mmsi')
  final int mmsi;
  
  @JsonKey(name: 'true_wind_speed')
  final double? trueWindSpeed;
  
  @JsonKey(name: 'true_wind_direction')
  final double? trueWindDirection;

  Vessel({
    required this.caimFleetId,
    required this.caimContractId,
    required this.caimContractNumber,
    required this.vesselName,
    required this.reportTime,
    required this.lastUpdate,
    required this.latitude,
    required this.longitude,
    required this.heading,
    required this.speedOverGround,
    required this.draught,
    required this.aisEngineStatusId,
    this.destination,
    this.eta,
    required this.imo,
    required this.mmsi,
    this.trueWindSpeed,
    this.trueWindDirection,
  });

  factory Vessel.fromJson(Map<String, dynamic> json) => _$VesselFromJson(json);
  Map<String, dynamic> toJson() => _$VesselToJson(this);

  String get statusText {
    switch (aisEngineStatusId) {
      case 0:
        return 'In navigazione';
      case 1:
        return 'All\'ancora';
      case 2:
        return 'Non sotto comando';
      case 3:
        return 'Manovrabilità limitata';
      case 5:
        return 'Ormeggiata';
      default:
        return 'Altro/Sconosciuto';
    }
  }

  bool get isMoving {
    return speedOverGround > 0.5 || 
           aisEngineStatusId == 0 || 
           aisEngineStatusId == 3;
  }

  String get formattedSpeed {
    return '${speedOverGround.toStringAsFixed(1)} kn';
  }
}

@JsonSerializable()
class RoutePoint {
  final double latitude;
  final double longitude;
  final String timestamp;
  final double speed;

  RoutePoint({
    required this.latitude,
    required this.longitude,
    required this.timestamp,
    required this.speed,
  });

  factory RoutePoint.fromJson(Map<String, dynamic> json) => 
      _$RoutePointFromJson(json);
  Map<String, dynamic> toJson() => _$RoutePointToJson(this);
}
