class PlaceDetails {
  String? xid;
  String? name;
  Address? address;
  String? rate;
  String? wikidata;
  String? kinds;
  Sources? sources;
  String? otm;
  String? wikipedia;
  String? image;
  Preview? preview;
  WikipediaExtracts? wikipediaExtracts;
  Point? point;

  PlaceDetails(
      {this.xid,
        this.name,
        this.address,
        this.rate,
        this.wikidata,
        this.kinds,
        this.sources,
        this.otm,
        this.wikipedia,
        this.image,
        this.preview,
        this.wikipediaExtracts,
        this.point});

  PlaceDetails.fromJson(Map<String, dynamic> json) {
    xid = json['xid'];
    name = json['name'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    rate = json['rate'];
    wikidata = json['wikidata'];
    kinds = json['kinds'];
    sources =
    json['sources'] != null ? new Sources.fromJson(json['sources']) : null;
    otm = json['otm'];
    wikipedia = json['wikipedia'];
    image = json['image'];
    preview =
    json['preview'] != null ? new Preview.fromJson(json['preview']) : null;
    wikipediaExtracts = json['wikipedia_extracts'] != null
        ? new WikipediaExtracts.fromJson(json['wikipedia_extracts'])
        : null;
    point = json['point'] != null ? new Point.fromJson(json['point']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['xid'] = xid;
    data['name'] = name;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['rate'] = rate;
    data['wikidata'] = wikidata;
    data['kinds'] = kinds;
    if (sources != null) {
      data['sources'] = sources!.toJson();
    }
    data['otm'] = otm;
    data['wikipedia'] = wikipedia;
    data['image'] = image;
    if (preview != null) {
      data['preview'] = preview!.toJson();
    }
    if (wikipediaExtracts != null) {
      data['wikipedia_extracts'] = wikipediaExtracts!.toJson();
    }
    if (point != null) {
      data['point'] = point!.toJson();
    }
    return data;
  }
}

class Address {
  String? city;
  String? state;
  String? county;
  String? suburb;
  String? country;
  String? postcode;
  String? countryCode;
  String? stateDistrict;

  Address(
      {this.city,
        this.state,
        this.county,
        this.suburb,
        this.country,
        this.postcode,
        this.countryCode,
        this.stateDistrict});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city']??"";
    state = json['state']??"";
    county = json['county']??"";
    suburb = json['suburb']??"";
    country = json['country']??"";
    postcode = json['postcode']??"";
    countryCode = json['country_code']??"";
    stateDistrict = json['state_district']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['city'] = city;
    data['state'] = state;
    data['county'] = county;
    data['suburb'] = suburb;
    data['country'] = country;
    data['postcode'] = postcode;
    data['country_code'] = countryCode;
    data['state_district'] = stateDistrict;
    return data;
  }
}

class Sources {
  String? geometry;
  List<String>? attributes;

  Sources({this.geometry, this.attributes});

  Sources.fromJson(Map<String, dynamic> json) {
    geometry = json['geometry'];
    attributes = json['attributes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['geometry'] = geometry;
    data['attributes'] = attributes;
    return data;
  }
}

class Preview {
  String? source;
  int? height;
  int? width;

  Preview({this.source, this.height, this.width});

  Preview.fromJson(Map<String, dynamic> json) {
    source = json['source']??"";
    height = json['height']??"";
    width = json['width']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['source'] = source;
    data['height'] = height;
    data['width'] = width;
    return data;
  }
}

class WikipediaExtracts {
  String? title;
  String? text;
  String? html;

  WikipediaExtracts({this.title, this.text, this.html});

  WikipediaExtracts.fromJson(Map<String, dynamic> json) {
    title = json['title']??"";
    text = json['text']??"";
    html = json['html']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['text'] = this.text;
    data['html'] = this.html;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    return data;
  }
}
