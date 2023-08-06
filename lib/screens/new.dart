import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class HealthStatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Stats App',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
      ),
      home: HealthStatsScreen(),
    );
  }
}

class HealthStatsScreen extends StatefulWidget {
  @override
  _HealthStatsScreenState createState() => _HealthStatsScreenState();
}

class _HealthStatsScreenState extends State<HealthStatsScreen> {
  int heartRate = 72;
  int steps = 5237;
  double bloodPressure = 120 / 80;
  double sweatLevel = 65;
  double sugarLevel = 90;

  List<charts.Series<HeartRateData, String>> _createHeartRateData() {
    final data = [
      HeartRateData('3h', 65),
      HeartRateData('2h', 80),
      HeartRateData('1h', 90),
      HeartRateData('Now', heartRate),
    ];

    return [
      charts.Series<HeartRateData, String>(
        id: 'Heart Rate',
        domainFn: (HeartRateData data, _) => data.time,
        measureFn: (HeartRateData data, _) => data.rate,
        data: data,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Statistics'),
        backgroundColor: Color(0xFF7165D6),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Heartbeat Statistics',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: charts.BarChart(
                  _createHeartRateData(),
                  animate: true,
                  barRendererDecorator: charts.BarLabelDecorator<String>(),
                ),
              ),
              SizedBox(height: 20),
              _buildHealthStatCard('Heart Rate', '$heartRate bpm', Icons.favorite, Colors.red),
              _buildHealthStatCard('Blood Pressure', '${bloodPressure.toStringAsFixed(0)} mmHg', Icons.format_list_numbered, Colors.blue),
              _buildHealthStatCard('Sweat Level', '${sweatLevel.toStringAsFixed(0)}%', Icons.opacity, Colors.green),
              _buildHealthStatCard('Sugar Level', '${sugarLevel.toStringAsFixed(0)} mg/dL', Icons.cake, Colors.orange),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHealthStatCard(String title, String value, IconData iconData, Color color) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(iconData, color: color, size: 40),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(value, style: TextStyle(fontSize: 16)),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }
}

class HeartRateData {
  final String time;
  final int rate;

  HeartRateData(this.time, this.rate);
}
