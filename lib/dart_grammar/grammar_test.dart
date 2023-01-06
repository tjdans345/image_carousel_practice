


void main() {

  DateTime now = DateTime.now();
    print(now);

    
  Duration duration = Duration(seconds: 60);
    print(duration);
    print(duration.inDays);
    print(duration.inHours);
    print(duration.inMinutes);
    print(duration.inSeconds);
    print(duration.inMilliseconds);
    
  DateTime specificDay = DateTime(
    2017,
    11,
    23
  );

  print(specificDay);

  final difference = now.difference(specificDay);

  print(difference.inDays);

  print(now.isAfter(specificDay));
  
  print("----------------");
  print(now.add(Duration(hours: 5)));
  print(now.subtract(Duration(hours: 5)));

}