enum StatusAbsen {
  Alpha,
  Hadir,
  Izin,
  Sakit,
  AlreadyOut,
  Dispen,
  Telat
}

StatusAbsen parseToStatusAbsen(String tipe) {
  switch (tipe) {
    case "IZIN":
      return StatusAbsen.Izin;
    case "ALPHA":
      return  StatusAbsen.Alpha;
    case "DISPENSASI":
      return  StatusAbsen.Dispen;
    case "SAKIT":
      return  StatusAbsen.Sakit;
    case "TELAT":
      return StatusAbsen.Telat;
    default:
      return  StatusAbsen.Hadir;
  }
}

String statusAbsenToString(StatusAbsen status) {
  switch (status) {
    case StatusAbsen.Izin:
      return "IZIN";
    case StatusAbsen.Alpha:
      return "ALPHA";
    case StatusAbsen.Dispen:
      return "DISPENSASI";
    case StatusAbsen.Sakit:
      return "SAKIT";
    case StatusAbsen.Telat:
      return "TELAT";
    default:
      return "HADIR";
  }
}