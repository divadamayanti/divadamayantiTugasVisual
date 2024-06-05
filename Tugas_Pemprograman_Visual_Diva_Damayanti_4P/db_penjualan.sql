-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jun 2024 pada 16.16
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` int(8) NOT NULL,
  `barcode` int(20) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `harga_jual` bigint(20) DEFAULT NULL,
  `harga_beli` bigint(20) DEFAULT NULL,
  `stok` int(10) DEFAULT NULL,
  `kategori_id` int(8) DEFAULT NULL,
  `satuan_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL,
  `suplier_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `barcode`, `name`, `harga_jual`, `harga_beli`, `stok`, `kategori_id`, `satuan_id`, `user_id`, `suplier_id`) VALUES
(1, 11111, 'Ultra Milk', 5000, 3500, 10, 1, 1, 1, 1),
(2, 22222, 'Aqua', 15000, 12000, 20, 2, 2, 2, 2),
(3, 33333, 'Good Day Mocacinno', 12500, 10000, 30, 3, 3, 3, 3),
(4, 44444, 'Buah Naga', 40000, 32000, 40, 4, 4, 4, 4),
(5, 55555, 'Bayam Hijau (250gr)', 7000, 5000, 50, 5, 5, 5, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_beli`
--

CREATE TABLE `detail_beli` (
  `id` int(8) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(10) NOT NULL,
  `subtotal` bigint(20) NOT NULL,
  `pembelian_id` int(8) NOT NULL,
  `barang_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_beli`
--

INSERT INTO `detail_beli` (`id`, `harga`, `qty`, `subtotal`, `pembelian_id`, `barang_id`) VALUES
(1, 3500, 10, 35000, 1, 1),
(2, 12000, 20, 240000, 2, 2),
(3, 10000, 30, 300000, 3, 3),
(4, 32000, 40, 1280000, 4, 4),
(5, 5000, 50, 250000, 5, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_jual`
--

CREATE TABLE `detail_jual` (
  `id` int(8) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(10) NOT NULL,
  `subtotal` bigint(20) NOT NULL,
  `penjualan_id` int(8) DEFAULT NULL,
  `barang_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_jual`
--

INSERT INTO `detail_jual` (`id`, `harga`, `qty`, `subtotal`, `penjualan_id`, `barang_id`) VALUES
(1, 5000, 10, 50000, 1, 1),
(2, 15000, 20, 300000, 2, 2),
(3, 12500, 30, 375000, 3, 3),
(4, 40000, 40, 1600000, 4, 4),
(5, 7000, 50, 35000, 5, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `name`) VALUES
(1, 'Milk'),
(2, 'Mineral Water'),
(3, 'Coffe'),
(4, 'Fruit'),
(5, 'Vegetable'),
(6, 'Fish'),
(7, 'Meat'),
(8, 'Snack'),
(9, 'Fast Food'),
(10, 'Junk Food');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kustomer`
--

CREATE TABLE `kustomer` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kustomer`
--

INSERT INTO `kustomer` (`id`, `nik`, `name`, `telp`, `email`, `alamat`) VALUES
(1, 1234567890, 'Jefri', '089876543210', 'jefri@gmail.com', 'Jl.Pekanbaru No. 16'),
(2, 1122334455, 'Agus', '080188277211', 'Agus@gmail.com', 'Jl. Manggis No.17'),
(3, 1826657761, 'Azizah', '082345675842', 'azizah@gmail.com', 'Jl.Belimbing No.18'),
(4, 1456789096, 'Berliana', '080001456799', 'berliana@gmail.com', 'Jl.Mengkudu No.19'),
(5, 1065254232, 'Maulida', '084527864288', 'maulida@gmailcom', 'Jl. Kini Balu No.20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(8) NOT NULL,
  `invoice` int(20) NOT NULL,
  `total` bigint(20) NOT NULL,
  `bayar` bigint(11) NOT NULL,
  `diskripsi` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `suplier_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id`, `invoice`, `total`, `bayar`, `diskripsi`, `tanggal`, `suplier_id`, `user_id`) VALUES
(1, 2024001, 35000, 35000, 'Pembelian Mingguan', '2024-05-26', 1, 1),
(2, 2024002, 240000, 240000, 'Pembelian Mingguan', '2024-05-26', 2, 2),
(3, 2024003, 300000, 300000, 'Pembelian Mingguan', '2024-05-26', 3, 3),
(4, 2024004, 1280000, 1280000, 'Pembelian Bulanan', '2024-05-01', 4, 4),
(5, 2024005, 250000, 250000, 'Pembelian Bulanan', '2024-05-01', 5, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(8) NOT NULL,
  `invoice` int(20) NOT NULL,
  `total` bigint(200) NOT NULL,
  `bayar` bigint(11) NOT NULL,
  `kembali` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `kustomer_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id`, `invoice`, `total`, `bayar`, `kembali`, `tanggal`, `kustomer_id`, `user_id`) VALUES
(1, 2024001, 50000, 50000, 0, '2024-05-01', 1, 1),
(2, 2024002, 300000, 300000, 0, '2024-05-02', 2, 2),
(3, 2024003, 375000, 400000, 25000, '2024-05-03', 3, 3),
(4, 2024004, 40000, 1600000, 0, '2024-05-04', 4, 4),
(5, 2024005, 350000, 350000, 0, '2024-05-05', 5, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `satuan`
--

CREATE TABLE `satuan` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL,
  `diskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `satuan`
--

INSERT INTO `satuan` (`id`, `name`, `diskripsi`) VALUES
(1, 'Ml', 'Mili Liter\r\n'),
(2, 'Ltr', 'Liter'),
(3, 'Sct', 'Sachet'),
(4, 'Kg', 'Kilogram'),
(5, 'Gr', 'Gram'),
(6, 'Ekr', 'Ekor'),
(7, 'Ptg', 'Potong'),
(8, 'Pack', 'Package'),
(9, 'Pcs', 'Pieces'),
(10, 'Prs', 'Porsi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `perusahaan` varchar(150) DEFAULT NULL,
  `nama_bank` varchar(150) DEFAULT NULL,
  `nama_akun_bank` varchar(150) DEFAULT NULL,
  `no_akun_bank` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id`, `nik`, `name`, `telp`, `email`, `alamat`, `perusahaan`, `nama_bank`, `nama_akun_bank`, `no_akun_bank`) VALUES
(1, 1234567890, 'Supplier1', '081234567890', 'supplier1@gmail.com', 'Jl. Pekapuran Raya No.10', 'ABC Corporation', 'Bank ABC', 'Chika', '1234567890'),
(2, 234567890, 'Supplier2', '082345678901', 'supplier2@gmail.com', 'Jl. Cemara Ujung No.09', 'XYZ Corp.', 'Bank XYZ', 'Jessika', '2345678901'),
(3, 345678901, 'Supplier3', '085432789865', 'supplier3@gmail.com', 'Jl. Anggrek No.08', '89 Enterprises', 'Bank 789', 'Amanda ', '0123456789'),
(4, 124674356, 'Supplier4', '083465432121', 'supplier4@gmail.com', 'Jl. Matahari No.07', '456 Ltd.', 'Bank 456', 'Kevin Robinson', '9012345678'),
(5, 535568765, 'Supplier5', '085211134567', 'supplier5@gmail.com', 'Jl. Dahlia No.06', '123 Company', 'Bank 123', 'Lisa ', '8901234567'),
(6, 897634510, 'Supplier6', '089967543212', 'supplier6@gmail.com', 'Jl. Melati No.05', 'XYZ Corp.', 'Bank XYZ', 'David', '7890123456'),
(7, 245733578, 'Supplier7', '087654321234', 'supplier7@gmail.com', 'Jl. Mawar No.04', 'ABC Corporation', 'Bank ABC', 'Sarah', '6789012345'),
(8, 234256785, 'Supplier8', '086574212121', 'supplier8@gmail.com', 'Jl. Maluku No.03', '789 Enterprises', 'Bank 789', 'Michael ', '5678901234'),
(9, 719163547, 'Supplier9', '088899776655', 'supplier9@gmail.com', 'Jl. Hksn No.02', '456 Ltd.', 'Bank 456', 'Emily B', '4567890123'),
(10, 763826387, 'Supplier10', '087700076543', 'supplier10@gmail.com', 'Jl. Pasar Lama No.01', '123 Company', 'Bank123', 'Ryan ', '3456789012');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `username` char(100) DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` char(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `is_active` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nik`, `username`, `full_name`, `password`, `role`, `email`, `telp`, `alamat`, `is_active`) VALUES
(1, 1234567890, 'Siti_Nurhaliza', 'Siti_Nurhaliza', 'liza1808', 'penjualan', 'sitinurhaliza@gmail.com', '0882021938566', 'Jl. Jahri Saleh No.11', 'True'),
(2, 234567890, 'Diva_Damayanti', 'Diva_Damayanti', 'diva1212', 'penjualan', 'divadamayanti@gmail.com', '081234567890', 'Jl. Handil Bakti No.12', 'True'),
(3, 345678901, 'Harisna', 'Harisna', 'harisna1313', 'penjualan', 'harisna@gmail.com', '0823456789012', 'Jl. Cemara Raya No.13', 'True'),
(4, 456789012, 'Mikke', 'Mikke', 'mikke1414', 'penjualan', 'mikke@gmail.com', '083456789012', 'Jl. Mulawarman No.14', 'True'),
(5, 567890123, 'Susanti', 'Susanti', 'susanti1515', 'penjualan', 'susanti@gmail.com', '084567890123', 'Jl. Sultan Adam No.15', 'True');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kategori` (`kategori_id`),
  ADD KEY `fk_satuan` (`satuan_id`),
  ADD KEY `fk_user` (`user_id`),
  ADD KEY `fk_suplier` (`suplier_id`);

--
-- Indeks untuk tabel `detail_beli`
--
ALTER TABLE `detail_beli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_beli_ibfk_1` (`pembelian_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indeks untuk tabel `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_jual_ibfk_1` (`penjualan_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kustomer`
--
ALTER TABLE `kustomer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `suplier_id` (`suplier_id`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjualan_ibfk_1` (`user_id`),
  ADD KEY `kustomer_id` (`kustomer_id`);

--
-- Indeks untuk tabel `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_beli`
--
ALTER TABLE `detail_beli`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `detail_jual`
--
ALTER TABLE `detail_jual`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `kustomer`
--
ALTER TABLE `kustomer`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2011;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `fk_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`),
  ADD CONSTRAINT `fk_satuan` FOREIGN KEY (`satuan_id`) REFERENCES `satuan` (`id`),
  ADD CONSTRAINT `fk_suplier` FOREIGN KEY (`suplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `detail_beli`
--
ALTER TABLE `detail_beli`
  ADD CONSTRAINT `detail_beli_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`);

--
-- Ketidakleluasaan untuk tabel `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD CONSTRAINT `detail_jual_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`);

--
-- Ketidakleluasaan untuk tabel `kustomer`
--
ALTER TABLE `kustomer`
  ADD CONSTRAINT `kustomer_ibfk_1` FOREIGN KEY (`id`) REFERENCES `penjualan` (`kustomer_id`);

--
-- Ketidakleluasaan untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`suplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`id`) REFERENCES `detail_beli` (`pembelian_id`);

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`id`) REFERENCES `detail_jual` (`penjualan_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
