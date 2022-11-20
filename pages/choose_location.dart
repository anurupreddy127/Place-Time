import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'london.png', url: 'Europe/London', isDaytime: true | false),
    WorldTime(location: 'Berlin', flag: 'berlin.png', url: 'Europe/Berlin', isDaytime: true | false),
    WorldTime(location: 'Cairo', flag: 'cairo.png', url: 'Africa/Cairo', isDaytime: true | false),
    WorldTime(location: 'Chicago', flag: 'chicago.png', url: 'America/Chicago', isDaytime: true | false),
    WorldTime(location: 'Seoul', flag: 'seoul.png', url: 'Asia/Seoul', isDaytime: true | false),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
            child: Card(
              child: ListTile(
                onTap: () {
                 updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

