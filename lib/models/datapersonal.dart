class DataPersonal {
  final int id;
  final int nik;
  final String nama;
  final String email;
  final String alamat;
  final String createdat;
  final String updatedat;

  DataPersonal({
    required this.id,
    required this.nik,
    required this.nama,
    required this.email,
    required this.alamat,
    required this.createdat,
    required this.updatedat,
  });

  factory DataPersonal.fromJson(dynamic json) {
    return DataPersonal(
        id: json['id'],
        nik: json['nik'],
        nama: json['nama'],
        email: json['email'],
        alamat: json['alamat'],
        createdat: json['created_at'],
        updatedat: json['updated_at']);
  }

  static List<DataPersonal> datapersonalapi(List e) {
    return e.map((data) {
      return DataPersonal.fromJson(data);
    }).toList();
  }

  // @override
  // String toString() {
  //   return 'DataPersonal{id:$id,nik:$nik,nama,email:$email,alamat:$alamat,createdat:$createdat,updatedat:$updatedat}';
  // }

}
