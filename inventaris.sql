-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 16 Apr 2024 pada 08.24
-- Versi server: 8.0.30
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventaris`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `idbarang` int NOT NULL,
  `merk` varchar(15) DEFAULT NULL COMMENT 'Merk',
  `nama_barang` varchar(15) DEFAULT NULL COMMENT 'Nama Barang',
  `deskripsi` varchar(100) DEFAULT NULL COMMENT 'Deskripsi',
  `kategori` varchar(25) DEFAULT NULL COMMENT 'Kategori'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`idbarang`, `merk`, `nama_barang`, `deskripsi`, `kategori`) VALUES
(1, 'Panasonic', 'AC', 'AC', 'Elektronik'),
(2, 'LG', 'Smart TV', 'Smart TV', 'Elektronik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi`
--

CREATE TABLE `lokasi` (
  `idlokasi` int NOT NULL,
  `nama_lokasi` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `lokasi`
--

INSERT INTO `lokasi` (`idlokasi`, `nama_lokasi`, `created_at`) VALUES
(1, 'Kalam Kudus Tidar', '2024-04-16 00:00:00'),
(2, 'Kalam Kudus Kasin', '2024-04-16 00:00:00'),
(3, 'Kalam Kudus Yamin', '2024-04-16 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mutasi`
--

CREATE TABLE `mutasi` (
  `idmutasi` int NOT NULL,
  `idbarang` int NOT NULL,
  `idlokasi` int NOT NULL,
  `qty` int NOT NULL,
  `jenismutasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ket` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mutasi`
--

INSERT INTO `mutasi` (`idmutasi`, `idbarang`, `idlokasi`, `qty`, `jenismutasi`, `ket`, `tgl`) VALUES
(1, 1, 1, 1, 'Keluar', 'coba 1', '2024-04-16'),
(2, 2, 2, 1, 'Keluar', 'coba 2', '2024-04-16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `idtransaksi` int NOT NULL,
  `tgl` date DEFAULT NULL COMMENT 'Tanggal Transaksi',
  `jenis` varchar(6) DEFAULT NULL COMMENT 'Jenis Transaksi',
  `idbarang` int DEFAULT NULL COMMENT 'Barang',
  `qty` int DEFAULT NULL COMMENT 'Qty',
  `ket` varchar(100) DEFAULT NULL COMMENT 'Keterangan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`idtransaksi`, `tgl`, `jenis`, `idbarang`, `qty`, `ket`) VALUES
(1, '2024-04-08', 'Masuk', 1, 20, 'Pembelian barang baru'),
(2, '2024-04-08', 'Masuk', 2, 10, 'Pembelian barang baru'),
(3, '2024-04-08', 'Keluar', 1, 5, 'Pindah ke gudang A'),
(4, '2024-04-08', 'Keluar', 2, 5, 'Pindah ke gudang A'),
(5, '2024-05-08', 'Masuk', 1, 10, 'Barang beli baru'),
(6, '2024-05-08', 'Masuk', 2, 15, 'Pembelian Barang baru');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user` varchar(10) NOT NULL COMMENT 'Username',
  `pass` varchar(15) DEFAULT NULL COMMENT 'Password',
  `nama` varchar(25) DEFAULT NULL COMMENT 'Nama Lengkap',
  `level` varchar(15) DEFAULT NULL COMMENT 'Level Akses'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user`, `pass`, `nama`, `level`) VALUES
('admin', 'admin', 'Nama Admin', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`idbarang`);

--
-- Indeks untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`idlokasi`);

--
-- Indeks untuk tabel `mutasi`
--
ALTER TABLE `mutasi`
  ADD PRIMARY KEY (`idmutasi`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`idtransaksi`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `idbarang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `idlokasi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `mutasi`
--
ALTER TABLE `mutasi`
  MODIFY `idmutasi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `idtransaksi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
