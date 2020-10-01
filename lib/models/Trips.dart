class Trip {
  String title;
  DateTime startDate;
  DateTime endDate;
  double budget;
  String travelType;

  Trip(
    this.title,
    this.startDate,
    this.endDate,
    this.budget,
    this.travelType,
  );

  //a function to create a json for above data
  Map<String, dynamic> toJson() => {
        'trip': title,
        'startDate': startDate,
        'endDate': endDate,
        'budget': budget,
        'travelType': travelType
      };
}
