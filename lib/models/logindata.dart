class DataEmploy {
  final String id;
  final String rollaction_id;
  final String name;
  final String alamat;
  final String nohp;
  final String creatat;
  final String updateat;

  DataEmploy({
    required this.id,
    required this.rollaction_id,
    required this.name,
    required this.alamat,
    required this.nohp,
    required this.creatat,
    required this.updateat,
  });

  factory DataEmploy.fromList(dynamic json) {
    return DataEmploy(
        id: json['id'],
        rollaction_id: json['rollaction_id'],
        name: json['name'],
        alamat: json['alamat'],
        nohp: json['nohp'],
        creatat: json['created_at'],
        updateat: json['updated_at']);
  }

  static List<DataEmploy> dataemployee(List e) {
    return e.map((data) {
      return DataEmploy.fromList(data);
    }).toList();
  }
}
