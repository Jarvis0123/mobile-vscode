// File: Main.java
public class Main {
    public static void main(String[] args) {
        // Membuat objek pesawat
        Pesawat pesawat1 = new Pesawat("Boeing 737", "Jet Komersial", 900, 180, "Garuda Indonesia");

        // Memanggil method untuk menampilkan informasi pesawat
        pesawat1.tampilkanInfo();

        // Akses atribut secara langsung (jika perlu)
        System.out.println("\nAkses langsung ke atribut:");
        System.out.println("Nama Pesawat: " + pesawat1.namaPesawat);
        System.out.println("Maskapai: " + pesawat1.maskapai);
    }
}
