// File: Pesawat.java
public class Pesawat {
    // Atribut
    String namaPesawat;
    String jenisPesawat;
    int kecepatanMaksimum;
    int kapasitasPenumpang;
    String maskapai;

    // Constructor
    public Pesawat(String namaPesawat, String jenisPesawat, int kecepatanMaksimum, int kapasitasPenumpang, String maskapai) {
        this.namaPesawat = namaPesawat;
        this.jenisPesawat = jenisPesawat;
        this.kecepatanMaksimum = kecepatanMaksimum;
        this.kapasitasPenumpang = kapasitasPenumpang;
        this.maskapai = maskapai;
    }

    // Method untuk menampilkan informasi pesawat
    public void tampilkanInfo() {
        System.out.println("Nama Pesawat: " + namaPesawat);
        System.out.println("Jenis Pesawat: " + jenisPesawat);
        System.out.println("Kecepatan Maksimum: " + kecepatanMaksimum + " km/jam");
        System.out.println("Kapasitas Penumpang: " + kapasitasPenumpang);
        System.out.println("Maskapai: " + maskapai);
    }
}
