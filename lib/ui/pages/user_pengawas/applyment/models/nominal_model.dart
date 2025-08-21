enum ValueLoanNominal { value1, value2, value3, value4 }

class NominalModel {
  final String? nominal;
  final ValueLoanNominal? value;

  const NominalModel({this.nominal, this.value});

  static List<NominalModel> dataNominal() => [
        //Virtual Account
        const NominalModel(
            nominal: "Rp 1.000.000", value: ValueLoanNominal.value1),
        const NominalModel(
            nominal: "Rp 1.500.000", value: ValueLoanNominal.value2),
        const NominalModel(
            nominal: "Rp 2.000.000", value: ValueLoanNominal.value3),
        const NominalModel(
            nominal: "Nominal Lainnya", value: ValueLoanNominal.value4),
      ];
}
