-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 05, 2026 at 05:15 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saranarazaq`
--

-- --------------------------------------------------------

--
-- Table structure for table `alat`
--

CREATE TABLE `alat` (
  `idalat` int NOT NULL,
  `idkategori` int NOT NULL,
  `namaalat` varchar(50) NOT NULL,
  `jumlah` int NOT NULL,
  `kondisi` varchar(20) NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alat`
--

INSERT INTO `alat` (`idalat`, `idkategori`, `namaalat`, `jumlah`, `kondisi`, `lokasi`, `foto`) VALUES
(7, 1, 'Proyektor Epson', 5, 'Baik', 'XI RPL 2', 'proyektor.jpg'),
(8, 1, 'Laptop Asus', 10, 'Baik', 'XI RPL 2', 'laptop.jpg'),
(9, 2, 'Kabel HDMI 5m', 15, 'Baik', 'XI RPL 2', 'kabel.jpg'),
(10, 2, 'Mouse Wireless', 20, 'Baik', 'Lab 1', 'mouse.jpg'),
(11, 3, 'Meja Komputer', 12, 'Baik', 'Lab 2', 'meja.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `asal`
--

CREATE TABLE `asal` (
  `idasal` int NOT NULL,
  `namaasal` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `asal`
--

INSERT INTO `asal` (`idasal`, `namaasal`) VALUES
(1, 'kualasimpang'),
(2, 'Paya Raja');

-- --------------------------------------------------------

--
-- Table structure for table `detilpeminjaman`
--

CREATE TABLE `detilpeminjaman` (
  `iddetilpeminjaman` int NOT NULL,
  `idpeminjaman` int NOT NULL,
  `idalat` int NOT NULL,
  `jumlahpinjam` int NOT NULL,
  `kondisi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detilpeminjaman`
--

INSERT INTO `detilpeminjaman` (`iddetilpeminjaman`, `idpeminjaman`, `idalat`, `jumlahpinjam`, `kondisi`) VALUES
(1, 1, 7, 1, 'Baik'),
(2, 1, 9, 2, 'Baik'),
(3, 2, 8, 1, 'Baik'),
(4, 2, 10, 1, 'Baik'),
(5, 3, 11, 2, 'Baik');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int NOT NULL,
  `namakategori` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkategori`, `namakategori`) VALUES
(1, 'Elektronik'),
(2, 'olahraga'),
(3, 'perkakas');

-- --------------------------------------------------------

--
-- Table structure for table `peminjam`
--

CREATE TABLE `peminjam` (
  `idpeminjam` int NOT NULL,
  `idasal` int NOT NULL,
  `namapeminjam` varchar(50) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `alamat` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `peminjam`
--

INSERT INTO `peminjam` (`idpeminjam`, `idasal`, `namapeminjam`, `kelas`, `nohp`, `alamat`) VALUES
(7, 1, 'Teuku Abdul Razaq', 'XI RPL 2', '081234567890', 'Kualasimpang'),
(8, 1, 'susi', 'XI TKJ 1', '082198765432', 'kampunglanduk'),
(9, 2, 'Budi', 'Guru', '085211223344', 'Paya Raja');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `idpeminjaman` int NOT NULL,
  `iduser` int NOT NULL,
  `idpeminjam` int NOT NULL,
  `tanggalpinjam` date NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`idpeminjaman`, `iduser`, `idpeminjam`, `tanggalpinjam`, `status`) VALUES
(1, 4, 7, '2026-09-30', 'Dipinjam'),
(2, 5, 8, '2026-09-30', 'Dipinjam'),
(3, 6, 9, '2026-09-29', 'Selesai');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int NOT NULL,
  `namauser` varchar(30) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(155) NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `namauser`, `username`, `password`, `nohp`, `alamat`, `foto`) VALUES
(1, 'razaquser1', 'razaq', 'razaq', '081436116967', 'kualasimpang', 'aisdhfhhaisdhfhaisduhf918287312hgghasidf'),
(2, 'razaquser2', 'razaq', 'razaq', '081436116967', 'paya raja', 'aisdhfhhaisdhfhaisduhf918287312hgghasidf'),
(3, 'razaquser3', 'razaq', 'razaq', '081436116967', 'paya raja', 'aisdhfhhaisdhfhaisduhf918287312hgghasidf'),
(4, 'razaq', 'razaquser4', 'razaq1', '081436116967', 'paya raja', 'aisdhfhhaisdhfhaisduhf918287312hgghasidf '),
(5, 'razaq', 'razaquser5', 'razaq2', '081436116967', 'paya raja', 'aisdhfhhaisdhfhaisduhf918287312hgghasidf '),
(6, 'razaq', 'razaquser6', 'razaq3', '081436116967', 'paya raja', 'aisdhfhhaisdhfhaisduhf918287312hgghasidf ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alat`
--
ALTER TABLE `alat`
  ADD PRIMARY KEY (`idalat`),
  ADD KEY `idkategori` (`idkategori`);

--
-- Indexes for table `asal`
--
ALTER TABLE `asal`
  ADD PRIMARY KEY (`idasal`);

--
-- Indexes for table `detilpeminjaman`
--
ALTER TABLE `detilpeminjaman`
  ADD PRIMARY KEY (`iddetilpeminjaman`),
  ADD KEY `idpeminjaman` (`idpeminjaman`),
  ADD KEY `idalat` (`idalat`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indexes for table `peminjam`
--
ALTER TABLE `peminjam`
  ADD PRIMARY KEY (`idpeminjam`),
  ADD KEY `idasal` (`idasal`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`idpeminjaman`),
  ADD KEY `fk_peminjaman_user` (`iduser`),
  ADD KEY `fk_peminjaman_peminjam` (`idpeminjam`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alat`
--
ALTER TABLE `alat`
  MODIFY `idalat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `asal`
--
ALTER TABLE `asal`
  MODIFY `idasal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detilpeminjaman`
--
ALTER TABLE `detilpeminjaman`
  MODIFY `iddetilpeminjaman` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `peminjam`
--
ALTER TABLE `peminjam`
  MODIFY `idpeminjam` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `idpeminjaman` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alat`
--
ALTER TABLE `alat`
  ADD CONSTRAINT `idkategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`);

--
-- Constraints for table `detilpeminjaman`
--
ALTER TABLE `detilpeminjaman`
  ADD CONSTRAINT `idalat` FOREIGN KEY (`idalat`) REFERENCES `alat` (`idalat`),
  ADD CONSTRAINT `idpeminjaman` FOREIGN KEY (`idpeminjaman`) REFERENCES `peminjaman` (`idpeminjaman`);

--
-- Constraints for table `peminjam`
--
ALTER TABLE `peminjam`
  ADD CONSTRAINT `idasal` FOREIGN KEY (`idasal`) REFERENCES `asal` (`idasal`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `fk_peminjaman_peminjam` FOREIGN KEY (`idpeminjam`) REFERENCES `peminjam` (`idpeminjam`),
  ADD CONSTRAINT `fk_peminjaman_user` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
