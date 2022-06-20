class University {
  late List<dynamic> domains;
  late List<dynamic> web_pages;
  late dynamic state_province;
  late String name;
  late String country;
  late String alpha_two_code;
  University(
      {required this.domains,
      required this.web_pages,
      required this.state_province,
      required this.name,
      required this.country,
      required this.alpha_two_code});
  University.FromJSON(Map<String, dynamic> map) {
    domains = map['domains'];
    web_pages = map['web_pages'];
    state_province = map['state-province'];
    name = map['name'];
    country = map['country'];
    alpha_two_code = map['alpha_two_code'];
  }
  @override
  String toString() {
    // TODO: implement toString
    // return 'University is $name, state is $state_province';
    return 'University is $name';
  }
}
