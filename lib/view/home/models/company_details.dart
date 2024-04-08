class CompanyDetails {
  final Company? company;

  CompanyDetails({
    this.company,
  });

  CompanyDetails.fromJson(Map<String, dynamic> json)
    : company = (json['company'] as Map<String,dynamic>?) != null ? Company.fromJson(json['company'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'company' : company?.toJson()
  };
}

class Company {
  final String? ceo;
  final String? coo;
  final String? cto;
  final String? founder;
  final String? name;
  final String? summary;
  final int? founded;

  Company({
    this.ceo,
    this.coo,
    this.cto,
    this.founder,
    this.name,
    this.summary,
    this.founded,
  });

  Company.fromJson(Map<String, dynamic> json)
    : ceo = json['ceo'] as String?,
      coo = json['coo'] as String?,
      cto = json['cto'] as String?,
      founder = json['founder'] as String?,
      name = json['name'] as String?,
      summary = json['summary'] as String?,
      founded = json['founded'] as int?;

  Map<String, dynamic> toJson() => {
    'ceo' : ceo,
    'coo' : coo,
    'cto' : cto,
    'founder' : founder,
    'name' : name,
    'summary' : summary,
    'founded' : founded
  };
}