class Place {
  String? xid;
  String? name;
  double? dist;
  int? rate;
  String? osm;
  String? wikidata;
  String? kinds;
  Point? point;

  Place(
      {this.xid,
        this.name,
        this.dist,
        this.rate,
        this.osm,
        this.wikidata,
        this.kinds,
        this.point});

  Place.fromJson(Map<String, dynamic> json) {
    xid = json['xid'];
    name = json['name'];
    dist = json['dist'];
    rate = json['rate'];
    osm = json['osm'];
    wikidata = json['wikidata'];
    kinds = json['kinds'];
    point = json['point'] != null ? Point.fromJson(json['point']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['xid'] = xid;
    data['name'] = name;
    data['dist'] = dist;
    data['rate'] = rate;
    data['osm'] = osm;
    data['wikidata'] = wikidata;
    data['kinds'] = kinds;
    if (point != null) {
      data['point'] = point!.toJson();
    }
    return data;
  }
}

class Point {
  double? lon;
  double? lat;

  Point({this.lon, this.lat});

  Point.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}

