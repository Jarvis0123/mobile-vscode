public class Bank {
    private int saldo;

    // Konstruktor Bank dengan parameter saldo awal
    public Bank(int saldo) {
        this.saldo = saldo;
    }

    // Method untuk menyimpan uang
    public void simpanUang(int jumlah) {
        saldo += jumlah;
        System.out.println("Simpan uang: Rp. " + jumlah);
    }

    // Method untuk mengambil uang
    public void ambilUang(int jumlah) {
        if (jumlah <= saldo) {
            saldo -= jumlah;
            System.out.println("Ambil uang: Rp. " + jumlah);
        } else {
            System.out.println("Saldo tidak cukup untuk mengambil Rp. " + jumlah);
        }
    }

    // Method untuk mendapatkan saldo saat ini
    public int getSaldo() {
        return saldo;
    }
}
