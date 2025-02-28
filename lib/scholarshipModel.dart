class Scholarship {
  final String name;
  final String criteria;
  final String courseTime;
  final List<String> eligibleCountries;
  final String cgpaRequirement;
  final String extraCurricularRequirement;
  final String otherCriteria;

  Scholarship({
    required this.name,
    required this.criteria,
    required this.courseTime,
    required this.eligibleCountries,
    required this.cgpaRequirement,
    required this.extraCurricularRequirement,
    required this.otherCriteria,
  });
}
