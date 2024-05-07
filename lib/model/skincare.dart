class SkinCare {
  SkinCare({
    required this.binary,
    required this.name,
  });

  final String binary;
  final String name;
}

List<SkinCare> listSkinCare = [
  SkinCare(binary: '01010011', name: 'Achness'),
  SkinCare(binary: '10001110', name: 'ErhaFacialWash'),
  SkinCare(binary: '00110001', name: 'SenkaPerfectWhip'),
  SkinCare(binary: '01001001', name: 'EminalBighStuff'),
  SkinCare(binary: '10001001', name: 'PondsCharcoal'),
];
