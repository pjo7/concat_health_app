class bpmHeart{
  final String? id;
  final String? time;
  final int? bpm;
  
  const bpmHeart({
    this.id,
    required this.time,
    required this.bpm
  });

  toJson(){
    return {
      "time": time,
      "bpm": bpm,
    };
  }
}
