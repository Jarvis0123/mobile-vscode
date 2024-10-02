public class BankBeraksi {
    public static void main(String[] args) {
        // Menampilkan sambutan
        System.out.println("Selamat Datang di Bank Rahmat");

        // Menetapkan saldo awal Rp. 100000
        Bank bank = new Bank(100000);

        // Menampilkan saldo saat ini
        System.out.println("Saldo saat ini: Rp. " + bank.getSaldo());

        // Simpan uang sebesar Rp. 500000
        bank.simpanUang(500000);
        System.out.println("Saldo saat ini: Rp. " + bank.getSaldo());

        // Ambil uang sebesar Rp. 150000
        bank.ambilUang(150000);
        System.out.println("Saldo saat ini: Rp. " + bank.getSaldo());
    }
}
