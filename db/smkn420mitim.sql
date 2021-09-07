-- Author: angrypin aka _Reduce
-- Database: smkn420mitim
-- 

CREATE DATABASE IF NOT EXISTS `smkn420mitim` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- 
-- table structure for table `user`
-- 

CREATE TABLE `users` (
	`id` int(1) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`username` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`password` char(72) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Data for table `users`
-- 
-- password: J$}R1#+l#`QIRgI9d|p3

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(NULL, 'angrypin', '$2y$10$wnpu39hSbj4GiPNfHXlh6.ml9xybsFU8EU3axIdreOJFLZ3M7ZLJW');

-- 
-- table structure for table `list_majors`
-- 

CREATE TABLE `list_majors` (
	`id` int(2) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`short_name` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`long_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Data for table `list_majors`
-- 

INSERT INTO `list_majors` (`id`, `short_name`, `long_name`) VALUES
(NULL, 'RPL', 'Rekayasa Perangkat Lunak'),
(NULL, 'TKJ', 'Teknik Komputer dan Jaringan'),
(NULL, 'AK', 'Akuntansi dan Keuangan Lembaga'),
(NULL, 'AP', 'Akomodasi Perhotelan'),
(NULL, 'MM', 'Multi Media'),
(NULL, 'PBK', 'Perbankan'),
(NULL, 'PM', 'Pemasaran'),
(NULL, 'UPW', 'Usaha Perjalanan Wisata');

-- 
-- table structure for table `fasilities`
-- 

CREATE TABLE `fasilities` (
	`id` int(1) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`total` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Data for table `fasilities`
-- 

INSERT INTO `fasilities` (`id`, `name`, `description`, `total`) VALUES
(NULL, 'Lab. Komputer', 'tempat riset ilmiah, eksperimen, pengukuran ataupun pelatihan ilmiah yang berhubungan dengan ilmu komputer dan memiliki beberapa komputer dalam satu jaringan untuk penggunaan oleh kalangan tertentu.', 5),
(NULL, 'Lab. IPA', 'Tempat untuk mengadakan percobaan, penyelidikan, eksperimen, pengukuran ataupun pelatihan ilmiah dan sebagainya yang berhubungan dengan ilmu fisika, kimia, dan biologi atau bidang ilmu lain.', 2),
(NULL, 'Perpustakaan', 'Sebuah koleksi besar buku dan majalah yang dibiayai dan dioperasikan oleh sebuah kota atau institusi, serta dimanfaatkan oleh masyarakat yang rata-rata tidak mampu membeli sekian banyak buku dengan biaya sendiri.', 3),
(NULL, 'Mushola', 'Ruangan, tempat atau rumah kecil menyerupai masjid yang digunakan sebagai tempat salat dan mengaji bagi umat Islam.', 2),
(NULL, 'lapangan', ' tempat untuk melakukan semua kegiatan baik upacara, olahraga, maupun kegiatan-kegiatan sekolah yang lain', 1),
(NULL, 'Taman', 'ruang terbuka hijau yang bisa membuat suasana belajar menjadi lebih menyenangkan karena suasananya yang asri.', 3),
(NULL, 'Kantin', 'Ruangan dalam sebuah gedung umum yang dapat digunakan pengunjungnya untuk makan, baik makanan yang dibawa sendiri maupun yang dibeli di sana.', 2),
(NULL, 'Koperasi', 'koperasi yang didirikan di lingkungan sekolah yang anggota-anggotanya terdiri atas siswa sekolah.', 2),
(NULL, 'gedung aula', 'ruangan besar yang dapat digunakan untuk rapat, upacara, dan sebagainya', 1);

-- 
-- table structure for table `classes`
-- 

CREATE TABLE `classes` (
	`id` int(1) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`class` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`major_id` int(2) NOT NULL,
	`total` int(2) NOT NULL,
	CONSTRAINT `major_id` FOREIGN KEY (`major_id`) REFERENCES `list_majors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Data for table `classes`
-- 

INSERT INTO `classes` (`id`, `class`, `major_id`, `total`) VALUES
(NULL, 'X', 1, 4),
(NULL, 'X', 2, 4),
(NULL, 'X', 3, 2),
(NULL, 'X', 4, 1),
(NULL, 'X', 5, 3),
(NULL, 'X', 6, 3),
(NULL, 'X', 7, 2),
(NULL, 'X', 8, 1),
(NULL, 'XI', 1, 4),
(NULL, 'XI', 2, 1),
(NULL, 'XI', 3, 2),
(NULL, 'XI', 4, 1),
(NULL, 'XI', 5, 1),
(NULL, 'XI', 6, 4),
(NULL, 'XI', 7, 3),
(NULL, 'XI', 8, 3),
(NULL, 'XII', 1, 1),
(NULL, 'XII', 2, 1),
(NULL, 'XII', 3, 4),
(NULL, 'XII', 4, 4),
(NULL, 'XII', 5, 2),
(NULL, 'XII', 6, 1),
(NULL, 'XII', 7, 1),
(NULL, 'XII', 8, 2);

-- 
-- table structure for table `achievements`
-- 

CREATE TABLE `achievements` (
	`id` int(3) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`year` year NOT NULL,
	`name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`award` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`rank` int(1) NOT NULL,
	`type` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`level` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Data for table `achievements`
-- 
-- source: http://sekolah.data.kemdikbud.go.id/index.php/chome/profil/08d9e915-d51a-442a-a904-5deb681d4e22
-- 

INSERT INTO `smkn420mitim`.`achievements` (`id`, `year`, `name`, `award`, `rank`, `type`, `level`) VALUES
(NULL, 2011, 'KARATE', 'KEJURDA KUSHINRYU M KARATE-DO INDONESIA(KKI)', 2, 'Olahraga', 'Propinsi'),
(NULL, 2011, 'KARATE', 'KEJUARAAN KARATE RADEN INTAN CUP III', 3, 'Olahraga', 'Kab/kota'),
(NULL, 2012, 'SELEKSI TIMNAS', 'H.M TAUFIQ KIEMAS', 2, 'Olahraga', 'Nasional'),
(NULL, 2012, 'SELEKSI TIMNAS', 'H.M TAUFIQ KIEMAS', 2, 'Olahraga', 'Nasional'),
(NULL, 2012, 'PENCAK SILAT', '-', 1, 'Olahraga', 'Sekolah'),
(NULL, 2013, 'KARATE', 'KEJURDA KARATE CHAMPHIONS GUBERNUR CUP III', 1, 'Olahraga', 'Propinsi'),
(NULL, 2013, 'KARATE', 'KEJURDA KUSHINRYU M KARATE-DO INDONESIA(KKI)', 1, 'Olahraga', 'Propinsi'),
(NULL, 2013, 'SENAM RITMIK GYMNASTIK', 'SURABAYA', 3, 'Olahraga', 'Nasional'),
(NULL, 2014, 'PERSADA FAIR 2014 BASKETBALL PUTRI', 'PEERSADA FAIR 2014', 2, 'Olahraga', 'Sekolah'),
(NULL, 2014, 'FOURTEN CUP BASKET BALL COMPETITIOS 2015', 'SMAN 14 BANDAR LAMPUNG', 2, 'Olahraga', 'Sekolah'),
(NULL, 2014, 'GLORY COMPETITIONS OF SUDIRMAN 41', 'SMAN 1 BANDAR LAMPUNG', 3, 'Olahraga', 'Sekolah'),
(NULL, 2014, 'PBB', 'SMP PERINTIS', 1, 'Olahraga', 'Propinsi'),
(NULL, 2014, 'KEJUARAAN TERBUKA TAEKWONDO SABURAI CUP', 'KOTA BANDAR LAMPUNG', 2, 'Olahraga', 'Propinsi'),
(NULL, 2014, 'PENTAS SENI GLOCS 41', 'SMAN 1 BANDAR LAMPUNG', 3, 'Seni', 'Sekolah'),
(NULL, 2014, 'BASKETBALL PERSADA FAIR 2014', 'SMK PERSADA BANDAR LAMPUNG', 2, 'Olahraga', 'Sekolah'),
(NULL, 2014, 'FOURTEEN CUP BASKET BALL COMPETITION', 'SMAN 14 BANDAR LAMPUNG', 2, 'Olahraga', 'Sekolah'),
(NULL, 2014, 'KARATE', 'FORKI L.A CUP II', 3, 'Olahraga', 'Propinsi'),
(NULL, 2015, 'KARATE', 'KEJURDA KARATE CHAMPHIONS WALIKOTA CUP', 2, 'Olahraga', 'Propinsi'),
(NULL, 2015, 'BASKETBALL COMPETITION 2015 FOR JUNIOR', 'SMA YP UNILA', 3, 'Olahraga', 'Sekolah'),
(NULL, 2015, 'KARATE', 'KEJURDA KARATE CHAMPHIONS GUBERNUR CUP V', 3, 'Olahraga', 'Propinsi'),
(NULL, 2015, 'KARATE', 'KEJURDA KARATE CHAMPHIONS WALIKOTA CUP', 3, 'Olahraga', 'Propinsi'),
(NULL, 2015, 'KOMPETISI FUTSAL PEMUDA TEKNOKRAT', 'PERGURUAN TINGGI TEKNOKRAT', 2, 'Olahraga', 'Kab/kota'),
(NULL, 2015, 'TEKNOKTAR BASKETBALL COMPETITION 2015', 'PERGURUAN TINGGI TEKNOKRAT', 2, 'Olahraga', 'Kab/kota'),
(NULL, 2015, 'BASKETBALL COMPETITION 2015 FOR JUNIOR', 'SMA YP UNILA BANDAR LAMPUNG', 3, 'Olahraga', 'Sekolah'),
(NULL, 2015, 'PERSADA FAIR 2014 BASKETBALL PUTRI', 'PEERSADA FAIR 2015', 2, 'Olahraga', 'Sekolah'),
(NULL, 2016, 'KCCK IBI DARMAJAYA', 'IBI DARMAJAYA', 3, 'Lain-lain', 'Kab/kota');