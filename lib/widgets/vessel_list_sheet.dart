import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/vessel.dart';
import '../providers/vessel_provider.dart';

class VesselListSheet extends StatelessWidget {
  final List<Vessel> vessels;

  const VesselListSheet({
    Key? key,
    required this.vessels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Elenco Navi (${vessels.length})',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: vessels.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return _VesselCard(vessel: vessels[index]);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _VesselCard extends StatelessWidget {
  final Vessel vessel;

  const _VesselCard({required this.vessel});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VesselProvider>(context, listen: false);
    final statusColor = vessel.isMoving ? Colors.green : Colors.red;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              vessel.vesselName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  vessel.statusText,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  vessel.formattedSpeed,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            if (vessel.destination != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.navigation, size: 16, color: Color(0xFF001F54)),
                  const SizedBox(width: 4),
                  Text(
                    vessel.destination!,
                    style: const TextStyle(color: Color(0xFF001F54)),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      provider.selectVessel(vessel);
                      Navigator.pop(context);
                    },
                    child: const Text('Vai'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      provider.showRouteView(vessel);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6BB6D6),
                    ),
                    child: const Text('Percorso'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
