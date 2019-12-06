﻿# Host: localhost  (Version 5.5.5-10.1.38-MariaDB)
# Date: 2019-12-06 23:28:06
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "books"
#

DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `isbn` bigint(13) NOT NULL DEFAULT '0',
  `judul` varchar(100) DEFAULT NULL,
  `penulis` varchar(50) DEFAULT NULL,
  `deskripsi` text,
  `tanggal_terbit` date DEFAULT NULL,
  `penerbit` varchar(30) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `stok` int(3) DEFAULT NULL,
  `harga` double(6,3) DEFAULT '0.000',
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "books"
#

INSERT INTO `books` VALUES (9786020317427,'Tempat Paling Sunyi','Arafat Nur','Di tengah keriuhan pertengkaran rumah tangga yang tak kunjung reda, Mustafa berjuang keras menyelesaikan penulisan novelnya. Berkisah tentang hidupnya yang bagai tegak di pekarangan tepi neraka, juga sejarah negerinya dalam cengkeraman perang saudara. Di antara semua kemelut yang dia hadapi, Mustafa dipertemukan dengan Riana, seorang gadis yang telah lama hadir dalam mimpi-mimpinya. Dia berharap Riana bisa mengubah jalannya, mengubah hidupnya, dan menjadi semacam pemicu semangat untuk menuntaskan novelnya yang sudah begitu lama terkatung-katung. Namun, saat Mustafa berhasil merebut hati Riana, takdir pun berkata lain. Lelaki itu justru dihadapkan pada berbagai pilihan hidup membuat luka masa lalunya menganga. Mustafa lagi-lagi terpuruk, terempas, dan terpaksa berjalan sedirian di tempat paling sunyi. Sebuah kisah perjuangan tanpa henti, pengorbanan, cinta, impian, dan pencarian diri. Bagai sebuah cermin yang menghadirkan bayang ganda, begitulah kisah kesetiaan yang terkhianati, ketulusan yang tersakiti, cinta yang berubah benci, dan surga yang seketika menjadi bentangan neraka. “Sangat menarik; langsung menjerumuskan pembaca dalam derasnya arus cerita!” —Anton Kurnia, penulis cerita dan editor buku sastra','2019-11-25','\r\nGramedia Pustaka Utama','Buku9.jpg',4,80.000),(9786020333359,'Tanah Surga Merah','Arafat Nur','Pengorbanan dan cinta Murad yang luar biasa terhadap Aceh, ternyata tetap tidak bisa membuatnya diterima di tanah kelahirannya sendiri. Di mana pun dia berada, nyawanya selalu terancam. Setelah menembak seorang anggota dewan, Murad menjadi buronan yang paling dicari. Selain pembunuh, dia juga dikecam sebagai penjahat paling kejam dan berbahaya. Dia juga diyakini hendak mengacau pemilihan umum dan merongrong Pemerintahan Aceh Baru. Banyak pihak kalang-kabut memburu Murad. Beberapa kali dia sempat dipukuli dan nyaris tertangkap oleh orang-orang Partai Merah yang melacak tanpa henti. Murad terpaksa melarikan diri ke sebuah kampung paling terpencil dalam rimba yang tidak terdapat dalam peta. Di sana pulalah dia terperangkap dalam dunia asing dan ganjil, sambil tetap bertahan dengan menyamar sebagai teungku pandai agama. Ketika penyamarannya nyaris terbongkar, Jemala, gadis yang diam-diam jatuh hati padanya, dengan gagah menyelamatkan Murad sesaat sebelum musuh tiba. Gadis itu melarikannya ke hutan belantara yang tidak pernah terjamah manusia. Di sanalah Murad dan Jemala menemukan sepetak surga yang membuat mereka terpana....','2019-11-25','\r\nGramedia Pustaka Utama','Buku8.jpg',3,75.000),(9786023918140,'Jalan Keempat','M Faizi','Saya sadar, menggubah puisi itu---mulai menulis, menyunting, menerbitkan, hingga menjualnya---harus melalui tahapan yang panjang dan rumit. Anmum, hal itu tetap saya lakukan dengan pertimbangan bahwa puisi merupakan himpunan gagasan paling \'orisinal\' di antara genre tulisan lain yang pernah saya tulis. Setiap penyair butuh proses panjang untuk menghasilkan puisi, mulai dari merekam realitas, mengumpulkan dan mengendapkan data, lalu menyajikannya kembali dalam wujud puisi.','2019-10-30','\r\nDivapress','Buku11.jpg',5,65.000),(9786024812034,'Asal Mula','Neil Degrasse Tyson & Donald Goldsmith','Manusia berusaha mencari tahu asal mula dirinya dan segalanya sejak dulu. Penelitian sains telah mengungkapkan bahwa asal mula manusia bukan hanya dari Bumi, melainkan juga bintang-bintang dan alam semesta. Kisah asal mula kita merentang sampai awal waktu serta kelahiran ruang dan seluruh zat. Asal Mula menceritakan bagaimana terjadinya alam semsta, bintang-bintang, planet-planet, dan kehidupan berdasarkan temuan-temuan sains, yang menunjukan betapa megahnya kosmos dan bagaimana kedudukan kita di dalamnya.','2019-08-05','\r\nKepustakaan Populer Gramedia','Buku13.jpg',6,70.000),(9786024812546,'In Between, Di Antara','Robin Block & Angelina Enny','Suatu hari,\ntelah kutanggalkan kanak-kanakku\nuntuk sampai di sebuah antara\nperjalanan menuju dewasa\nPerantauan\n-Angelina Ennt, \"Suatu Hari Aku Menyeberang\".\n\nThe colours of the heart cannot be captured on a flag.\nAnd what can science explain about your suffering?\nWhat do the numbers say about the memories\nthat haunt you in dreams?\n-Robin Block, \"Inner War.\"','2019-10-28','\r\nKepustakaan Populer Gramedia','Buku10.jpg',5,85.000),(9786028740678,'Literasi Menggerakkan Negeri','Najelaa Shihab, Komunitas Guru Belajar','“Gimana, Pak… kegiatan literasi di kelas berjalan lancar?”\r\n\r\n“Saya sudah menjalankan program membaca setiap pagi, Bu. Tapi kok kurang efektif ya, Bu…”\r\n\r\n“Lho, bukannya dari laporan anak-anak sudah bisa baca ya? Berarti berhasil kan?”\r\n\r\n“Iya, Bu. Anak-anak sudah bisa baca. Tapi waktu saya tanya tentang bacaan mereka enggak bisa jawab Bu”\r\n\r\n\r\n\r\nDalam 10 tahun terakhir, literasi hadir dari sepotong istilah menjadi sebuah gerakan yang menyebar ke berbagai penjuru. Sayangnya, di tengah keriuhan literasi masih jarang upaya refleksi terhadap kerja keras mengembangkan literasi, apalagi upaya mempromosikan praktik baik pengajaran literasi. Apakah upaya pengembangan literasi sudah efektif dan terlihat dampaknya pada murid? Mana praktik pengajaran literasi yang baik, bisa direplikasi dan disebarkan?\r\n\r\nDi tengah situasi tersebut, buku Literasi Menggerakkan Negeri hadir sebagai niatan memperkaya khazanah pengajaran literasi. Anda diajak pengalaman memahami literasi mulai dari miskonsepsi hingga menemukan esensi. Anda diajak memahami kompleksitas konsep literasi. Anda diajak menelusuri perjalanan literasi yang berawal dan berakhir pada murid. Anda diajak mengenal praktik pengajaran literasi yang mendukung kemampuan belajar pada lintas pelajaran. Anda diajak memahami praktik literasi yang mendayagunakan potensi yang ada di sekitar sekolah. Dan pada akhirnya, Anda diajak menyaksikan praktik pengajaran literasi yang membantu murid untuk berdaya dan produktif sebagai warga negara.\r\n\r\nPenulis buku ini adalah guru yang bergabung di Komunitas Guru Belajar. Penulis yang memang mendalami dan melakukan praktik pengajaran literasi tentu menjanjikan tulisan yang renyah, mudah dipahami namun tetap esensial. Praktik pengajaran literasi yang dipaparkan dapat dipelajari, diadaptasi dan dimodifikasi sesuai kebutuhan murid dan potensi di sekitar sekolah. Karena kami percaya bahwa menyebarkan praktik baik literasi adalah cara menggerakkan negeri.','2019-11-18','Lentera Hati','Buku1.jpg',0,90.000),(9786028740692,'Semua Murid Semua Guru 3 : Berpihak Kepada Anak','Najelaa Shihab','“Akhirnya, ada yang cerita tentang betapa membosankannya jadi murid di sekolah. Kalau cuma begini, mending belajar di YouTube atau beli ijazah saja,\" (Rafa, 16 tahun, Kelas XI, SMA negeri di Jakarta)\r\n\r\n\"Kadang saya kurang sepakat dengan cara sekolah mendisiplinkan anak saya. Demi anak, saya coba bantu dan luruskan lagi di rumah dan bicarakan dengan pihak guru. Buku ini membuat saya makin percaya bahwa ada cara yang lebih positif dan tanpa kekerasan yang perlu dibiasakan,” (Dhani, orangtua murid Kelas 1, SD negeri di Yogya)\r\n\r\n\"Saya sadar bahwa membuat anak gemar belajar dan saling peduli itu penting. Meskipun nggak mudah, malah kadang ditentang rekan sejawat, saya berusaha terus. Alhamdulillah banyak contoh dan buktinya setelah membaca yang ditulis Mbak Elaa,” (Endah, guru madrasah swasta di Pesisir Selatan)\r\n\r\n\"Kami berupaya membuat taman baca bagi anak sekolah, bikin kelas juga untuk orangtua, agar mendukung anaknya belajar serta terlibat aktif dalam pendidikan. Terima kasih jaringan Semua Murid Semua Guru yang sudah mengumpulkan dan menceritakan siapa saja yang selama ini bergerak di pendidikan,” (Yeye, penggiat komunitas anak dan orang- tua marginal di Makassar)\r\n\r\n\"Setiap kali Anda membaca halaman-halamannya dan kemudian merasa apa yang kita upayakan di pendidikan Indonesia terlalu susah, saya ingin Anda mengingat hal lain yang juga saya percaya. Justru karena tujuan ini susah, maka layak untuk kita perjuangkan. Kita tidak mungkin punya pilihan untuk malas bergerak atau enggan berubah. Pencapaian akses, kualitas, dan kesetaraan pendidikan untuk semua dan setiap anak Indonesia bukan sekadar mimpi yang perlu dijaga, tetapi sudah kita capai dalam wujud nyata—di sebagian daerah, sekolah, rumah, atau di mana pun ladang kerja kita. Bukti dan praktik baik di lapangan inilah yang selalu menjadi sumber energi setiap hari,\" (Najelaa Shihab, Pendidik)\r\n\r\n*Seluruh hasil penjualan buku Semua Murid Semua Guru 1, 2, dan 3 digunakan untuk pengembangan komunitas dan organisasi pendidikan di Indonesia','2019-11-18','\r\nLentera Hati','Buku2.jpg',8,115.000),(9786230007729,'Penulisan Business Report Menggunakan Microsoft Word','Adi Kusrianto','Ada keterikatan antara keterampilan menulis laporan dan penguasaan terhadap pengolah kata Microsoft Word karena banyak kegiatan dalam menyusun laporan akan sangat terbantu bila seseorang menguasi fitur-fitur yang dimiliki Word. Buku ini menjembatani kedua ilmu keterampilan (skill) yang akhir-akhir ini semakin dibutuhkan di banyak bidang pekerjaan lebih-lebih yang menyangkut manajemen. Buku ini akan membantu Anda mempelajari cara membuat berbagai jenis laporan, tak hanya di bidang bisnis namun juga di bidang akademi, guna menambah pengetahuan Anda dalam menyusun laporan yang baik. Buku ini juga disertai dengan berbagai macam contoh dan template yang akan memudahkan Anda dalam mempraktikkannya. Pembahasan dalam buku mencakup: • fungsi laporan pada sebuah organisasi; • merencanakan laporan; • mengumpulkan bahan; • merencanakan outline; • anatomi laporan; • memilih struktur kalimat; • membuat format dan layout; • memberikan alat bantu visual; • macam-macam bentuk laporan; • menyusun outline dengan Word; • membuat daftar isi, daftar pustaka, daftar indeks secara otomatis; • memanfaatkan style dan template.','2019-11-11','\r\nElex Media Komputindo','Buku7.jpg',3,200.000),(9786230009181,'Langkah Mudah Pemrograman Opencv & Python','Abdul Kadir','Buku yang membahas secara gamblang mengenai dasar-dasar visi komputer yang diwujudkan menggunakan Python dan OpenCV. Pembahasan yang dilakukan melalui teori dan praktik membuat materi-materi yang disajikan dapat dipahami dengan mudah oleh siapa saja. Topik-topik menarik dikupas di buku ini. Cara mencocokkan dua bentuk secara otomatis, cara melakukan pencarian citra berdasarkan warna, cara mendeteksi wajah dan juga mengenali wajah, dan bahkan deteksi objek berdasarkan warna kulit diterangkan dengan cara yang mudah untuk dipahami dan dipraktikkan.','2019-11-04','\r\nElex Media Komputindo','Buku6.jpg',5,175.000),(9786230009273,'Malaikat Bertanya, Nabi Menjawab','Ahmad Royhan Firdausy','Dalam sebuah hadis disebutkan ada sosok Malaikat yang bertanya kepada Nabi saw., tentang “tiga pondasi hidup” yang berkaitan dengan keberagamaan, yaitu iman, Islam, dan ihsan. Tujuan pertanyaan tersebut adalah sebagai lentera yang dapat membuka cakrawala berpikir luas dan menjadi pedoman umat manusia dalam menjalankan kehidupan sehari-hari. Buku ini dilengkapi penjelasan-penjelasam mengenai iman, Islam, dan ihsan, yang bersumber dari Al-Qur’an, hadis, dan ungkapan para ulama, serta ditulis dengan bahasa yang mudah dan ringan.','2019-11-11','\r\nElex Media Komputindo','Buku15.jpg',6,65.000),(9786230009808,'Akuntansi Kas Distributor Dengan Ms Excel','Hendra Wijaya','Buku ini membahas pembuatan laporan keuangan perusahaan distributor dengan sistem kas menggunakan MS Excel 2010. Laporan keuangan yang dibuat terdiri atas 3 form transaksi, yaitu buku Kas, Bank, dan Jurnal. Di sini dijelaskan cara mencatat jurnal pembelian dan penjualan termasuk nilai PPN masukan dan keluaran yang hasilnya bisa berupa PPN lebih bayar (piutang) atau kurang bayar (terhutang). Dari data transaksi Kas, Bank, dan Jurnal kemudian dibuatkan neraca percobaan-lajur dan dilanjutkan dengan pembuatan laporan laba rugi dan neraca. Untuk menghitung laba rugi usaha, dilakukan perhitungan harga pokok penjualan atas persediaan barang yang terjual menggunakan metode harga rata-rata sistem fisik. Dalam buku ini juga dijelaskan transaksi keuangan untuk 3 bulan (periode) berturut-turut yang setiap periodenya akan dibuat neraca percobaan-lajur, laporan laba rugi, dan neraca akhir. Di akhir periode ketiga, diberi penjelasan cara membuat neraca lajur yang nilai-nilainya merupakan total mutasi debet-kredit dari masing-masing rekening untuk setiap bulannya. Instruksi dan fungsi Excel yang digunakan mencakup Vlookup, SumIf, Dsum, What-If Analysis, dan Data Table. Keterampilan: Pemula, Menengah Kelompok: Aplikasi Perkantoran Jenis buku: Referensi, Tutorial','2019-11-18','Elex Media Komputindo','Buku4.jpg',1,125.000),(9786230009853,'101 Tip Dan Trik Adobe Photoshop','Jubilee Enterprise','Tahukah Anda bahwa ada banyak sekali perintah dan fitur tersembunyi, jalan pintas yang tak banyak diketahui, serta kreasi-kreasi unik yang ada di dalam Photoshop? Photoshop adalah aplikasi yang sangat kompleks sehingga untuk menemukan fitur-fitur tersembunyi, Anda membutuhkan tip dan trik yang dikupas secara tuntas. Buku ini menjelaskan berbagai macam tip dan trik Photoshop, mulai dari kreativitas sehari-hari, mengoptimalkan kinerja Photoshop, pengorganisasian file melalui Bridge, menyeleksi objek rumit, dan sebagainya. Anda bisa membaca buku ini apabila ingin mempercepat proses editing, olah foto, dan desain grafis secara berlipat ganda. Pengguna Photoshop CS dapat mengikuti buku ini sementara pengguna Creative Cloud tetap dapat mengambil intisari tip dan trik dengan sama baiknya. Dijamin setelah membaca tip dan trik yang dibahas, pengetahuan Anda tentang penggunaan Photoshop akan berlipat ganda!','2019-11-18','Elex Media Komputindo','Buku5.jpg',6,130.500),(9786230010460,'Semua Bisa Menjadi Programmer Laravel Basic','Yuniar Supardi & Sulaeman','Buku dengan judul “Semua Bisa Menjadi Programmer Laravel Basic” ini merupakan buku dasar dalam mempelajari framework PHP dengan Laravel yang saat ini sedang populer. Dengan buku ini, tandanya Anda sudah belajar sampai tingkat menengah. Akan dibahas pula kelebihan dari script server programming dengan Laravel, serta materi lengkap dari dasar hingga menengah. Keunggulan buku ini adalah dapat memandu Anda membuat program web dengan Laravel dengan database MySQL dengan pembahasan yang mudah dan sistematis sehingga Anda tidak akan kesulitan mempelajarinya. Buku ini dibagi menjadi 30 bab, disusun secara sistematis dari program yang sederhana hingga database sehingga memudahkan Anda menjadi programmer dengan Laravel. Dengan mengacu beberapa buku penulis yang best seller maka terciptalah buku ini. Dalam buku ini, penulis juga membahas proses instalasi XAMPP di dalam Lampiran. Buku ini juga dapat dipakai oleh praktisi pendidikan, karyawan, dan mahasiswa.','2019-11-25','\r\nElex Media Komputindo','Buku3.jpg',8,150.500),(9789790756885,'Biologi 1 Edisi 8','Campbell','Biologi 1 Edisi 8','2019-10-07','Penerbit Erlangga','Buku14.jpg',7,250.000),(9789793784892,'Aljabar Dan Kalkulus','Ayub Subandi','Belajar kalkulus dirasakan sangat susah bagi sebagian mahasiswa di perguruan tinggi. Kendala utama karena pemahaman akan soal-soal sangat kurang. Buku sebagai penunjang pembelajaran yang ada di pasaran disuguhkan teori-teori dan sedikit pembahasan soal. Untuk itu, pada buku ini disajikan teori secara singkat dan diperkaya dengan soal-soal beserta pembahasan. Selain itu pada buku ini penguna diberikan kemudahan untuk belajar\r\n\r\nkalkulus karena di awal buku diberikan ulasan matematika dasar yang diperuntukan bagi mahasiswa yang menginginkan penunjang kalkulus. Pembahasan selanjutnya sistem koordinat, garis lurus, jarak diantara dua titik, dan model persamaan umum garis. Pembahasan pertidaksamaan dan nilai mutlak, yang meliputi jenis-jenis pertidaksamaan dan penyelesaiannya bagi persamaan linear, pecahan, derajat tinggi dan nilai mutlak. Fungsi dibahas pada bagian selanjutnya, di mana semua fungsi yang ada di matematika di bahas pada bab ini. Limit dibahas dari limit substitusi, limit dengan faktorisasi, limit tak terhingga, trigonometri, dan kekontinuan fungsi. Pembahasan turunan dari mulai aturan turunan, trigonometri, turunan berantai, turunan tingkat tinggi, logaritma, eksponensial, implisit dan aturan reciprocal. Aplikasi turunan, seperti nilai maksimum dan minimum, fungsi naik dan turun, titik belok, dan mengambarkan kurva komplit.','2019-09-01','\r\nBi-Obses','Buku12.jpg',2,175.500);

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `nim` char(10) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `alamat` text,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "users"
#

INSERT INTO `users` VALUES ('1','1',NULL,'12'),('123','Satu Dua Tiga',NULL,'123'),('1234567890','Testing',NULL,'test'),('171150','Administrator',NULL,'admin'),('1711500312','Yoda',NULL,'yoda'),('1711502028','Wahyu',NULL,'wahyu');

#
# Structure for table "shopingcart"
#

DROP TABLE IF EXISTS `shopingcart`;
CREATE TABLE `shopingcart` (
  `id` int(11) NOT NULL,
  `isbn` bigint(13) DEFAULT NULL,
  `nim` char(10) DEFAULT NULL,
  `qty` int(3) DEFAULT NULL,
  `harga` double(6,3) DEFAULT NULL,
  `status` enum('proses pembayaran','belum lunas') DEFAULT 'belum lunas',
  PRIMARY KEY (`id`),
  KEY `isbn` (`isbn`),
  KEY `nim` (`nim`),
  CONSTRAINT `shopingcart_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shopingcart_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `users` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "shopingcart"
#

INSERT INTO `shopingcart` VALUES (16,9786230009273,'1711502028',1,65.000,'proses pembayaran'),(17,9786230009808,'1711502028',1,125.000,'proses pembayaran'),(18,9789793784892,'1711502028',1,175.500,'proses pembayaran'),(19,9789793784892,'1234567890',1,175.500,'belum lunas'),(22,9786024812034,'1711502028',1,70.000,'proses pembayaran'),(23,9786020317427,'1711502028',1,80.000,'proses pembayaran');

#
# Structure for table "payment"
#

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id_payment` int(11) NOT NULL AUTO_INCREMENT,
  `alamat` text,
  `kurir` varchar(30) DEFAULT NULL,
  `metode_pembayaran` varchar(30) DEFAULT NULL,
  `total_belanja` double(7,3) DEFAULT NULL,
  `nim` char(10) DEFAULT NULL,
  PRIMARY KEY (`id_payment`),
  KEY `nim` (`nim`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `users` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "payment"
#

INSERT INTO `payment` VALUES (1,'Universitas Budi Luhur','SiCepat Express','Gerai - Alfamart',515.500,'1711502028');
