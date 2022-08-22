import 'package:http/http.dart';

class Select {
  late final String? id;
  late final String? image;
  late final String? nama;
  late final int? attack;
  late final int? defence;
  late final int? speed;
  late final int? spesial;

  Select(
      {this.id,
      this.image,
      this.nama,
      this.attack,
      this.defence,
      this.speed,
      this.spesial});
}
