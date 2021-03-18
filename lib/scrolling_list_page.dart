import 'package:flutter/material.dart';

class ScrollingListPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => ScrollingListPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scrolling List')),
      body: FutureBuilder<Map<String, IconData>>(
        future: _getIcons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              key: Key('scrollingListPage_listView'),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final iconInfo = snapshot.data.entries.elementAt(index);
                return ListTile(
                  leading: Icon(iconInfo.value),
                  title: Text(iconInfo.key),
                  onTap: () => Navigator.of(context)
                      .push(Details.route(iconInfo.key, iconInfo.value)),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    Key key,
    @required this.title,
    @required this.icon,
  }) : super(key: key);

  static Route route(String title, IconData icon) {
    return MaterialPageRoute(builder: (_) => Details(title: title, icon: icon));
  }

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            key: Key('detailsPage_saveIcon'),
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Icon saved'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context)
                            .popUntil((route) => route.isFirst),
                        child: Text('OK'),
                      )
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
      body: Center(child: Icon(icon, size: 90)),
    );
  }
}

Future<Map<String, IconData>> _getIcons() {
  return Future.delayed(const Duration(seconds: 1), () {
    return {
      'AC Unit': Icons.ac_unit,
      'Baby Changing Station': Icons.baby_changing_station,
      'Child Care': Icons.child_care,
      'Dangerous': Icons.dangerous,
      'Eco': Icons.eco,
      'Face': Icons.face,
      'Games': Icons.games,
      'Handyman': Icons.handyman,
      'Ice Cream': Icons.icecream,
      'Keyboard': Icons.keyboard,
      'Label': Icons.label,
      'Mail': Icons.mail,
      'Nature': Icons.nature,
      'Outdoor Grill': Icons.outdoor_grill,
      'Palette': Icons.palette,
      'QR Code': Icons.qr_code,
      'Radio': Icons.radio,
      'Satellite': Icons.satellite,
      'Tapas': Icons.tapas,
      'Umbrella': Icons.umbrella,
      'Video Call': Icons.video_call,
      'Waves': Icons.waves,
      'YouTube Searched For': Icons.youtube_searched_for,
      'Zoom Out': Icons.zoom_out,
    };
  });
}
