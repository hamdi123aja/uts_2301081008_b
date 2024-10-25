double calculateTotalBayar({
  required String jenisPenumpang,
  required double biayaAwal,
  required double biayaPerKilometer,
  required double jumlahKilometer,
}) {
  double gratisKilometer = 0.0;

  if (jenisPenumpang == 'VIP') {
    gratisKilometer = 5.0;
  } else if (jenisPenumpang == 'GOLD') {
    gratisKilometer = 2.0;
  }

  double totalBayar = biayaAwal + (biayaPerKilometer * (jumlahKilometer - gratisKilometer).clamp(0, jumlahKilometer));
  return totalBayar;
}
