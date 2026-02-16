// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vessel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vessel _$VesselFromJson(Map<String, dynamic> json) => Vessel(
      caimFleetId: json['caim_fleet_id'] as String,
      caimContractId: json['caim_contract_id'] as String,
      caimContractNumber: json['caim_contract_number'] as String,
      vesselName: json['vessel_name'] as String,
      reportTime: json['report_time'] as String,
      lastUpdate: json['last_update'] as String,
      latitude: (json['lat'] as num).toDouble(),
      longitude: (json['lon'] as num).toDouble(),
      heading: (json['hdg'] as num).toDouble(),
      speedOverGround: (json['sog'] as num).toDouble(),
      draught: (json['draught'] as num).toDouble(),
      aisEngineStatusId: (json['ais_engine_status_id'] as num).toInt(),
      destination: json['destination'] as String?,
      eta: json['eta'] as String?,
      imo: (json['imo'] as num).toInt(),
      mmsi: (json['mmsi'] as num).toInt(),
      trueWindSpeed: (json['true_wind_speed'] as num?)?.toDouble(),
      trueWindDirection: (json['true_wind_direction'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VesselToJson(Vessel instance) => <String, dynamic>{
      'caim_fleet_id': instance.caimFleetId,
      'caim_contract_id': instance.caimContractId,
      'caim_contract_number': instance.caimContractNumber,
      'vessel_name': instance.vesselName,
      'report_time': instance.reportTime,
      'last_update': instance.lastUpdate,
      'lat': instance.latitude,
      'lon': instance.longitude,
      'hdg': instance.heading,
      'sog': instance.speedOverGround,
      'draught': instance.draught,
      'ais_engine_status_id': instance.aisEngineStatusId,
      'destination': instance.destination,
      'eta': instance.eta,
      'imo': instance.imo,
      'mmsi': instance.mmsi,
      'true_wind_speed': instance.trueWindSpeed,
      'true_wind_direction': instance.trueWindDirection,
    };

RoutePoint _$RoutePointFromJson(Map<String, dynamic> json) => RoutePoint(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      timestamp: json['timestamp'] as String,
      speed: (json['speed'] as num).toDouble(),
    );

Map<String, dynamic> _$RoutePointToJson(RoutePoint instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timestamp': instance.timestamp,
      'speed': instance.speed,
    };
