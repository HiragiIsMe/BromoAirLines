CREATE DATABASE [BromoAirlines]
GO

USE [BromoAirlines]
GO

-- Tabel Akun
CREATE TABLE [Akun]
(
	[ID]							INT				PRIMARY KEY		IDENTITY(1, 1),
	[Username]						VARCHAR(200)	NOT NULL,
	[Password]						VARCHAR(200)	NOT NULL,
	[Nama]							VARCHAR(200)	NOT NULL,
	[TanggalLahir]					DATE			NOT NULL,
	[NomorTelepon]					VARCHAR(20)		NOT NULL,
	[MerupakanAdmin]				BIT				NOT NULL
);

-- Tabel Negara
CREATE TABLE [Negara]
(
	[ID]				INT				PRIMARY KEY		IDENTITY(1, 1),
	[Nama]				VARCHAR(200)	NOT NULL,
	[IbukotaNegara]		VARCHAR(200)	NOT NULL
);

-- Tabel Bandara
CREATE TABLE [Bandara]
(
	[ID]							INT				PRIMARY KEY		IDENTITY(1, 1),
	[Nama]							VARCHAR(200)	NOT NULL,
	[KodeIATA]						VARCHAR(5)		NOT NULL,
	[Kota]							VARCHAR(200)	NOT NULL,
	[NegaraID]						INT				NOT NULL,
	[JumlahTerminal]				INT				NOT NULL,
	[Alamat]						TEXT			NOT NULL,

	CONSTRAINT FK_NegaraID_Bandara_Negara FOREIGN KEY ([NegaraID]) REFERENCES [Negara]([ID])
);

-- Tabel Maskapai
CREATE TABLE [Maskapai]
(
	[ID]							INT				PRIMARY KEY		IDENTITY(1, 1),
	[Nama]							VARCHAR(200)	NOT NULL,
	[Perusahaan]					VARCHAR(200)	NOT NULL,
	[JumlahKru]						INT				NOT NULL,
	[Deskripsi]						TEXT			NOT NULL
);

-- Tabel Jadwal Penerbangan
CREATE TABLE [JadwalPenerbangan]
(
	[ID]							INT				PRIMARY KEY		IDENTITY(1, 1),
	[KodePenerbangan]				VARCHAR(10)		NOT NULL,
	[BandaraKeberangkatanID]		INT				NOT NULL,
	[BandaraTujuanID]				INT				NOT NULL,
	[MaskapaiID]					INT				NOT NULL,
	[TanggalWaktuKeberangkatan]		DATETIME		NOT NULL,
	[DurasiPenerbangan]				INT				NOT NULL,
	[HargaPerTiket]					FLOAT			NOT NULL,

	CONSTRAINT FK_BandaraKeberangkatanID_JadwalPenerbangan_Bandara FOREIGN KEY ([BandaraKeberangkatanID]) REFERENCES [Bandara]([ID]),
	CONSTRAINT FK_BandaraTujuanID_JadwalPenerbangan_Bandara FOREIGN KEY ([BandaraTujuanID]) REFERENCES [Bandara]([ID]),
	CONSTRAINT FK_MaskapaiID_JadwalPenerbangan_Maskapai FOREIGN KEY ([MaskapaiID]) REFERENCES [Maskapai]([ID])
);

-- Tabel Kode Promo
CREATE TABLE [KodePromo]
(
	[ID]							INT				PRIMARY KEY		IDENTITY(1, 1),
	[Kode]							VARCHAR(100)	NOT NULL,
	[PersentaseDiskon]				FLOAT			NOT NULL,
	[MaksimumDiskon]				FLOAT			NOT NULL,
	[BerlakuSampai]					DATE			NOT NULL,
	[Deskripsi]						TEXT			NOT NULL
);

-- Tabel Status Penerbangan
CREATE TABLE [StatusPenerbangan]
(
	[ID]							INT				PRIMARY KEY		IDENTITY(1, 1),
	[Nama]							VARCHAR(200)	NOT NULL
);

-- Tabel Perubahan Jadwal Penerbangan
CREATE TABLE [PerubahanStatusJadwalPenerbangan]
(
	[ID]							INT				PRIMARY KEY		IDENTITY(1, 1),
	[JadwalPenerbanganID]			INT				NOT NULL,
	[StatusPenerbanganID]			INT				NOT NULL,
	[WaktuPerubahanTerjadi]			DATETIME		NOT NULL,
	[PerkiraanDurasiDelay]			INT				NULL,

	CONSTRAINT FK_JadwalPenerbanganID_PerubahanStatusJadwalPenerbangan_JadwalPenerbangan FOREIGN KEY ([JadwalPenerbanganID]) REFERENCES [JadwalPenerbangan]([ID]),
	CONSTRAINT FK_StatusPenerbanganID_PerubahanStatusJadwalPenerbangan_StatusPenerbangan FOREIGN KEY ([StatusPenerbanganID]) REFERENCES [StatusPenerbangan]([ID])
);

-- Tabel Transaksi Header
CREATE TABLE [TransaksiHeader]
(
	[ID]							INT				PRIMARY KEY		IDENTITY(1, 1),
	[AkunID]						INT				NOT NULL,
	[TanggalTransaksi]				DATETIME		NOT NULL,
	[JadwalPenerbanganID]			INT				NOT NULL,
	[JumlahPenumpang]				INT				NOT NULL,
	[TotalHarga]					FLOAT			NOT NULL,
	[KodePromoID]					INT				NULL,

	CONSTRAINT FK_AkunID_TransaksiHeader_Akun FOREIGN KEY ([AkunID]) REFERENCES [Akun]([ID]),
	CONSTRAINT FK_JadwalPenerbanganID_TransaksiHeader_JadwalPenerbangan FOREIGN KEY ([JadwalPenerbanganID]) REFERENCES [JadwalPenerbangan]([ID]),
	CONSTRAINT FK_KodePromoID_TransaksiHeader_KodePromo FOREIGN KEY ([KodePromoID]) REFERENCES [KodePromo]([ID])
);

-- Tabel Transaksi Detail
CREATE TABLE [TransaksiDetail]
(
	[ID]							INT				PRIMARY KEY		IDENTITY(1, 1),
	[TransaksiHeaderID]				INT				NOT NULL,
	[TitelPenumpang]				VARCHAR(20)		NOT NULL,
	[NamaLengkapPenumpang]			VARCHAR(200)	NOT NULL,

	CONSTRAINT FK_TransaksiHeaderID_TransaksiDetail_TransaksiHeader FOREIGN KEY ([TransaksiHeaderID]) REFERENCES [TransaksiHeader]([ID])
);





-- Insert Data
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('admin', 'admin123', 'Gavriel', '2003-12-18', '081347923851', 1);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('edally0', 'mzTUku', 'Eulalie Dally', '2001-11-16', '7035740962', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('abumpus1', 'HV7H7f7s1H09', 'Antoine Bumpus', '2002-12-18', '8372424609', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('tskerme2', 'q1wkM7Br', 'Timothy Skerme', '1999-10-10', '8146704986', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('acarneck3', 'v11u5GCZKdc', 'Arman Carneck', '2000-06-30', '5472617318', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('pfenne4', 'KYtgSDTo', 'Philomena Fenne', '2002-05-17', '3374713290', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('mmowles5', 'S8JB3x', 'Manfred Mowles', '2002-11-05', '9482375400', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('mfarryn6', 'AdrHZ9', 'Micky Farryn', '1999-10-05', '3338018207', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('jcolbertson7', 'lFt23tpznDyN', 'Jessey Colbertson', '2001-10-29', '9711067251', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('kordelt8', 'ReEUCJDzY47', 'Katy Ordelt', '2002-06-11', '2159968307', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('cchansonne9', 'WMOyn86vQ9g', 'Cati Chansonne', '2000-08-04', '2108369638', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('ncallfa', 'omDSkPGscdBY', 'Nye Callf', '2002-07-19', '9712556046', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('grohanb', 'MiCeHGKEv', 'Guillaume Rohan', '2002-10-20', '9007444460', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('bgelsthorpec', 'S8dvWolP4X', 'Babs Gelsthorpe', '2002-02-19', '2413290020', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('vattkinsd', 'NVYexX', 'Virgie Attkins', '1999-05-03', '9598082707', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('cioannoue', 'jRpcoC', 'Carey Ioannou', '2003-03-05', '1436485024', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('bkilfedderf', 'A6GIVD5Joi5s', 'Bobbi Kilfedder', '2002-08-22', '1343442038', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('nberndseng', 'iuSuNn4Ljfk', 'Ninetta Berndsen', '2001-05-30', '6363366891', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('acrierh', 'BvXARKZyHUL', 'Adria Crier', '2001-06-23', '9973647974', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('mtorrenti', '1fVUkD1Fed', 'Marlena Torrent', '2002-02-25', '4482111369', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('wseelbachj', 'TnQarl', 'Walton Seelbach', '2001-12-10', '9568674688', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('htretterk', '4udUZgR7CVEk', 'Hoebart Tretter', '2003-04-02', '4528126183', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('mbirdwhistlel', 'awMBTR950', 'Myrilla Birdwhistle', '2003-02-28', '6208024260', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('lduddenm', 'WegGQ4LGGuM', 'Lock Dudden', '1999-05-21', '9799678150', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('ybutchersn', 'fUuO6wTkTZXR', 'Yehudit Butchers', '2000-08-14', '3909408927', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('lstormo', '6WKN16Bo', 'Lucius Storm', '2000-04-08', '8164399181', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('crydingsp', 'uF7FAHS', 'Chris Rydings', '2001-07-01', '2551696861', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('lrackhamq', 'OMOFLFtGgw', 'Lynett Rackham', '2001-09-21', '8159923247', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('zalebrooker', 'pRQZhvaMnbpV', 'Zulema Alebrooke', '2000-04-21', '7512472539', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('jbernadots', '5YoNOyIXyf', 'Jordan Bernadot', '2002-07-31', '5762305653', 0);
INSERT INTO [Akun] ([Username], [Password], [Nama], [TanggalLahir], [NomorTelepon], [MerupakanAdmin]) VALUES ('btidburyt', 'N6raABgr', 'Barbara-anne Tidbury', '2002-08-09', '4069143878', 0);




INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Afganistan', 'Kabul');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Albania', 'Tirana');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Aljazair', 'Aljir');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Amerika Serikat', 'Washington, DC');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Andorra', 'Andorra la Vella');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Angola', 'Luanda');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Antigua dan Barbuda', 'Saint John''s');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Arab Saudi', 'Riyadh');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Argentina', 'Buenos Aires');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Armenia', 'Yerevan');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Australia', 'Canberra');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Austria', 'Wina');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Azerbaijan', 'Baku');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Bahama', 'Nassau');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Bahrain', 'Manama');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Bangladesh', 'Dhaka');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Barbados', 'Bridgetown');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Belanda', 'Amsterdam');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Belarus', 'Minsk');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Belgia', 'Brusel');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Belize', 'Belmopan');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Benin', 'Porto Novo, Cotonou');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Bhutan', 'Thimphu');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Bolivia', 'La Paz, Sucre');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Bosnia Herzegovina', 'Sarajevo');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Botswana', 'Gaborone');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Brasil', 'Brasília');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Brunei', 'Bandar Seri Begawan');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Bulgaria', 'Sofia');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Burkina Faso', 'Ouagadougou');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Burundi', 'Bujumbura');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Chad', 'N''Djamena');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Chili', 'Santiago, Valparaiso');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Denmark', 'Kopenhagen');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Djibouti', 'Djibouti');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Dominika', 'Roseau');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Ekuador', 'Quito');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('El Salvador', 'San Salvador');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Eritrea', 'Asmara');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Estonia', 'Tallinn');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Eswatini', 'Mbabane');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Ethiopia', 'Addis Ababa');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Fiji', 'Suva');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Filipina', 'Manila');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Finlandia', 'Helsinki');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Gabon', 'Libreville');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Gambia', 'Banjul');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Georgia', 'Tbilisi');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Ghana', 'Accra');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Grenada', 'Saint George''s');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Guatemala', 'Guatemala');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Guiana', 'Cayennye');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Guinea Bissau', 'Bissau');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Guinea Ekuatorial', 'Malabo');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Guinea', 'Conakry');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Guyana', 'Georgetown');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Haiti', 'Port-au-Prince');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Honduras', 'Tegucigalpa');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Hungaria', 'Budapest');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('India', 'New Delhi');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Indonesia', 'Jakarta');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Irak', 'Bagdad');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Iran', 'Teheran');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Irlandia', 'Dublin');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Islandia', 'Reykjavik');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Jamaika', 'Kingston');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Jepang', 'Tokyo');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Jerman', 'Berlin');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Israel', 'Tel Aviv');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Italia', 'Roma');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Kamboja', 'Phnom Penh');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Kamerun', 'Yaoundé');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Kanada', 'Ottawa');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Kazakhstan', 'Astana');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Kenya', 'Nairobi');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Kepulauan Marshall', 'Majuro');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Kepulauan Solomon', 'Honiara');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Kyrgyzstan', 'Bishkek');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Kiribati', 'Tarawa');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Kolombia', 'Bogotá');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Komoro', 'Moroni');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Korea Selatan', 'Seoul');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Korea Utara', 'Pyongyang');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Kosovo', 'Pristina');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Kosta Rika', 'San José');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Kroasia', 'Zagreb');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Kuba', 'Havana');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Kuwait', 'Kuwait City');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Laos', 'Vientiane');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Latvia', 'Riga');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Lebanon', 'Beirut');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Lesotho', 'Maseru');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Liberia', 'Monrovia');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Libya', 'Tripoli');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Liechtenstein', 'Vaduz');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Lithuania', 'Vilnius');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Luxemburg', 'Luxemburg (kota)');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Madagaskar', 'Antananarivo');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Makedonia', 'Skopje');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Maladewa', 'Male');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Malawi', 'Lilongwe');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Malaysia', 'Kuala Lumpur');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Mali', 'Bamako');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Malta', 'Valletta');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Maroko', 'Rabat');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Martinique', 'Fort de France');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Mauritania', 'Nouakchott');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Mauritius', 'Port Louis');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Meksiko', 'Kota Mexico');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Mesir', 'Kairo');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Mikronesia', 'Palikir');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Moldova', 'Chisinau');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Monako', 'Monaco');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Mongolia', 'Ulan Bator');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Montenegro', 'Podgorica');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Mozambik', 'Maputo');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Namibia', 'Windhoek');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Nauru', 'Yaren');
INSERT INTO [Negara] ([Nama], [IbukotaNegara]) VALUES ('Nepal', 'Kathmandu');




INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Sultan Iskandar Muda', 'BTJ', 'Banda Aceh', 61, 2, 'Banda Aceh');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Polonia', 'MES', 'Medan', 61, 2, 'Medan');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Hang Nadim', 'BTH', 'Batam', 61, 2, 'Batam');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Raja Haji Fisabilillah', 'TNJ', 'Tanjung Pinang', 61, 2, 'Tanjung Pinang');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Sultan Syarif Kasim II', 'PKU', 'Pekanbaru', 61, 2, 'Pekanbaru');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Minangkabau', 'PDG', 'Padang', 61, 2, 'Padang');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Sultan Mahmud Badaruddin II', 'PLM', 'Palembang', 61, 2, 'Palembang');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Fatmawati Soekarno', 'BKS', 'Bengkulu', 61, 2, 'Bengkulu');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Radin Inten II', 'TKG', 'Bandar Lampung', 61, 2, 'Bandar Lampung');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Soekarno-Hatta', 'CGK', 'Banten', 61, 2, 'Banten. Singkatan CGK merujuk kepada Cengkareng');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Halim Perdanakusuma', 'HLP', 'Jakarta', 61, 2, 'Jakarta');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Juanda', 'SUB', 'Surabaya', 61, 2, 'Surabaya');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Adisumarmo', 'SOC', 'Solo', 61, 2, 'Solo');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Adi Sucipto', 'JOG', 'Yogyakarta', 61, 2, 'Yogyakarta');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Achmad Yani', 'SRG', 'Semarang', 61, 2, 'Semarang');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Husein Sastranegara', 'BDO', 'Bandung', 61, 2, 'Bandung');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Ngurah Rai', 'DPS', 'Denpasar', 61, 2, 'Denpasar');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Selaparang', 'AMI', 'Mataram', 61, 2, 'Mataram');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('El Tari', 'KOE', 'Kupang', 61, 2, 'Kupang');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Sepinggan', 'BPN', 'Balikpapan', 61, 2, 'Balikpapan');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Supadio', 'PNK', 'Pontianak', 61, 2, 'Pontianak');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Juwata', 'TRK', 'Tarakan', 61, 2, 'Tarakan');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Sultan Hasanuddin', 'UPG', 'Makassar', 61, 2, 'Makassar');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Sam Ratulangi', 'MDC', 'Manado', 61, 2, 'Manado');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Pattimura', 'AMQ', 'Ambon', 61, 2, 'Ambon');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Sentani', 'DJJ', 'Jayapura', 61, 2, 'Jayapura');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Frans Kaisiepo', 'BIK', 'Biak', 61, 2, 'Biak');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Mozes Kilangin', 'TIM', 'Tembagapura', 61, 2, 'Tembagapura');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Mopah', 'MKQ', 'Merauke', 61, 2, 'Merauke');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Maimun Saleh', 'SBG', 'Sabang', 61, 2, 'Sabang');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Lhok Sukon', 'LSX', 'Aceh Utara', 61, 2, 'Aceh Utara');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Malikus Saleh', 'LSW', 'Lhokseumawe', 61, 2, 'Lhokseumawe');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Cut Nyak Dhien', 'MEQ', 'Nagan Raya', 61, 2, 'Nagan Raya');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Teuku Cut Ali', 'TPK', 'Tapaktuan', 61, 2, 'Tapaktuan');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Syekh Hamzah Fansyuri', 'SKL', 'Singkil', 61, 2, 'Singkil');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Lasikin', 'SNB', 'Sinabang', 61, 2, 'Sinabang');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Sibisa', 'SIW', 'Toba Samosir', 61, 2, 'Toba Samosir');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Silangit', 'SQT', 'Siborong-borong', 61, 2, 'Siborong-borong');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Dr. Ferdinand Lumban Tobing', 'SIX', 'Sibolga', 61, 2, 'Sibolga');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Aek Godang', 'AEG', 'Padang Sidempuan', 61, 2, 'Padang Sidempuan');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Binaka', 'GNS', 'Gunung Sitoli', 61, 2, 'Gunung Sitoli');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Lasondre', 'LSE', 'Pulau-pulau Batu', 61, 2, 'Pulau-pulau Batu');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Pinang Kampai', 'DUM', 'Dumai', 61, 2, 'Dumai');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Sungai Pakning', 'SEQ', 'Bengkalis', 61, 2, 'Bengkalis');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Pasir Pengaraian', 'PPR', 'Pasir Pengaraian', 61, 2, 'Pasir Pengaraian');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Dabo', 'SIQ', 'Singkep', 61, 2, 'Singkep');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Japura', 'RGT', 'Rengat', 61, 2, 'Rengat');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Sei Bati', 'TJB', 'Karimun', 61, 2, 'Karimun');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Ranai', 'NTX', 'Natuna', 61, 2, 'Natuna');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Matak', 'MWK', 'Pal Matak', 61, 2, 'Pal Matak');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Rokot', 'RKO', 'Sipura', 61, 2, 'Sipura');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Sultan Thaha Syarifuddin', 'DJB', 'Jambi', 61, 2, 'Jambi');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Depati Parbo', 'KRC', 'Kerinci', 61, 2, 'Kerinci');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Fatmawati Soekarno', 'BKS', 'Bengkulu', 61, 2, 'Bengkulu');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Mukomuko', 'MPC', 'Mukomuko', 61, 2, 'Mukomuko');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Depati Amir', 'PGK', 'Pangkalpinang', 61, 2, 'Pangkalpinang');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('H. A. S. Hanandjoeddin', 'TJQ', 'Tanjung Pandan', 61, 2, 'Tanjung Pandan');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Silampari', 'LLG', 'Lubuklinggau', 61, 2, 'Lubuklinggau');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Pendopo', 'PDO', 'Empat Lawang', 61, 2, 'Empat Lawang');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Pondok Cabe', 'PCB', 'Pamulang', 61, 2, 'Pamulang');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Pulau Panjang', 'PPJ', 'Kepulauan Seribu', 61, 2, 'Kepulauan Seribu');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Cibeureum', 'TSY', 'Tasikmalaya', 61, 2, 'Tasikmalaya');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Cakrabhuwana', 'CBN', 'Cirebon', 61, 2, 'Cirebon');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Tunggul Wulung', 'CXP', 'Cilacap', 61, 2, 'Cilacap');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Wirasaba', 'PWL', 'Purbalingga', 61, 2, 'Purbalingga');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Dewa Daru', 'KWB', 'Karimunjawa', 61, 2, 'Karimunjawa');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Ngloram', 'CPF', 'Cepu', 61, 2, 'Cepu');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Abdul Rachman Saleh', 'MLG', 'Malang', 61, 2, 'Malang');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Trunojoyo', 'SUP', 'Sumenep', 61, 2, 'Sumenep');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Masalembo', 'MSI', 'Masalembo', 61, 2, 'Masalembo');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Brangbiji', 'SWQ', 'Sumbawa Besar', 61, 2, 'Sumbawa Besar');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Lunyuk', 'LYK', 'Sumbawa', 61, 2, 'Sumbawa');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Muhammad Salahuddin', 'BMU', 'Bima', 61, 2, 'Bima');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('El Tari', 'KOE', 'Kupang', 61, 2, 'Kupang');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Komodo', 'LBJ', 'Manggarai Barat', 61, 2, 'Manggarai Barat');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Frans Sales Lega', 'RTG', 'Ruteng', 61, 2, 'Ruteng');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Tambolaka', 'TMC', 'Waikabubak', 61, 2, 'Waikabubak');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Mau Hau', 'WGP', 'Waingapu', 61, 2, 'Waingapu');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Soa', 'BJW', 'Bajawa', 61, 2, 'Bajawa');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('H Hasan Aroeboesman', 'ENE', 'Ende', 61, 2, 'Ende');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Wai Oti', 'MOF', 'Maumere', 61, 2, 'Maumere');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Gewayantana', 'LKA', 'Larantuka', 61, 2, 'Larantuka');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Wonopito', 'LWE', 'Lewoleba', 61, 2, 'Lewoleba');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Mali', 'ARD', 'Alor', 61, 2, 'Alor');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Lekunik', 'RTI', 'Rote', 61, 2, 'Rote');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Tardamu', 'SAU', 'Pulau Sawu', 61, 2, 'Pulau Sawu');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Haliwen', 'ABU', 'Atambua', 61, 2, 'Atambua');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Rahadi Oesman', 'KTG', 'Ketapang', 61, 2, 'Ketapang');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Susilo', 'SQG', 'Sintang', 61, 2, 'Sintang');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Nanga Pinoh', 'NPO', 'Nanga Pinoh', 61, 2, 'Nanga Pinoh');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Pangsuma', 'PSU', 'Putussibau', 61, 2, 'Putussibau');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Tjilik Riwut', 'PKY', 'Palangka Raya', 61, 2, 'Palangka Raya');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Iskandar', 'PKN', 'Pangkalan Bun', 61, 2, 'Pangkalan Bun');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Tumbang Samba', 'TBM', 'Katingan', 61, 2, 'Katingan');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('H. Asan', 'SMQ', 'Sampit', 61, 2, 'Sampit');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Beringin', 'MTW', 'Muara Teweh', 61, 2, 'Muara Teweh');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Syamsuddin Noor', 'BDJ', 'Banjarmasin', 61, 2, 'Banjarmasin');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Warukin', 'TJG', 'Tanjung', 61, 2, 'Tanjung');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Bersujud', 'BTW', 'Batulicin', 61, 2, 'Batulicin');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Stagen', 'KBU', 'Kotabaru', 61, 2, 'Kotabaru');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Temindung', 'SRI', 'Samarinda', 61, 2, 'Samarinda');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Nunukan', 'NNX', 'Nunukan', 61, 2, 'Nunukan');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Yuvai Semaring', 'LBW', 'Krayan', 61, 2, 'Krayan');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Bunyu', 'BYQ', 'Pulau Bunyu', 61, 2, 'Pulau Bunyu');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('R.A. Bessing', 'MLN', 'Malinau', 61, 2, 'Malinau');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Long Ampung', 'LPU', 'Kayan Selatan', 61, 2, 'Kayan Selatan');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Tanjung Harapan', 'TJS', 'Tanjung Selor', 61, 2, 'Tanjung Selor');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Banaina', 'NAF', 'Bulungan', 61, 2, 'Bulungan');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Kalimarau', 'BEJ', 'Tanjung Redeb', 61, 2, 'Tanjung Redeb');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Sangkimah', 'SGQ', 'Sangatta', 61, 2, 'Sangatta');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Bontang', 'BXT', 'Bontang', 61, 2, 'Bontang');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Tanjung Santan', 'TSX', 'Marang Kayu', 61, 2, 'Marang Kayu');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Kotabangun', 'KOD', 'Kutai Kartanegara', 61, 2, 'Kutai Kartanegara');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Senipah', 'SZH', 'Kutai Kartanegara', 61, 2, 'Kutai Kartanegara');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Melalan', 'MLK', 'Melak', 61, 2, 'Melak');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Datah Dawai', 'DTD', 'Kutai Barat', 61, 2, 'Kutai Barat');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Tanah Grogot', 'TNB', 'Tanah Grogot', 61, 2, 'Tanah Grogot');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Andi Djemma', 'MXB', 'Masamba', 61, 2, 'Masamba');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Betoambari', 'BUW', 'Bau-bau', 61, 2, 'Bau-bau');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Jalaluddin', 'GTO', 'Gorontalo', 61, 2, 'Gorontalo');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Inco Soroako Waws', 'SQR', 'Sorowako', 61, 2, 'Sorowako');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Kasiguncu', 'PSJ', 'Poso', 61, 2, 'Poso');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Lalos', 'TLI', 'Tolitoli', 61, 2, 'Tolitoli');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Tampa Padang', 'MJU', 'Mamuju', 61, 2, 'Mamuju');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Melonguane', 'MNA', 'Melonguane', 61, 2, 'Melonguane');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Mopait', 'BJG', 'Bolaang Mongondow', 61, 2, 'Bolaang Mongondow');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Mutiara', 'PLW', 'Palu', 61, 2, 'Palu');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Naha', 'NAH', 'Tahuna', 61, 2, 'Tahuna');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Pogugol', 'UOL', 'Buol', 61, 2, 'Buol');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Pomalaa', 'PUM', 'Pomalaa', 61, 2, 'Pomalaa');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Pongtiku', 'TTR', 'Tana Toraja', 61, 2, 'Tana Toraja');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Sugimanuru', 'RAQ', 'Raha', 61, 2, 'Raha');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Syukuran Aminuddin Amir', 'LUW', 'Luwuk', 61, 2, 'Luwuk');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Haluoleo', 'KDI', 'Kendari', 61, 2, 'Kendari');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Amahai', 'AHI', 'Masohi', 61, 2, 'Masohi');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Bandaneira', 'NDA', 'Banda', 61, 2, 'Banda');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Dobo', 'DOB', 'Kepulauan Aru', 61, 2, 'Kepulauan Aru');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Dumatubun', 'LUV', 'Langgur', 61, 2, 'Langgur');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Emalamo', 'SQN', 'Sanana', 61, 2, 'Sanana');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Gamarmalamo', 'GLX', 'Galela', 61, 2, 'Galela');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Gebe', 'GEB', 'Gebe', 61, 2, 'Gebe');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Kuabang', 'KAZ', 'Tobelo', 61, 2, 'Tobelo');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Mangole', 'MAL', 'Mangole', 61, 2, 'Mangole');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Namlea', 'NAM', 'Namlea', 61, 2, 'Namlea');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Namrole', 'NRE', 'Namrole', 61, 2, 'Namrole');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Nangasuri', 'BJK', 'Benjina', 61, 2, 'Benjina');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Oesman Sadik', 'LAH', 'Labuha', 61, 2, 'Labuha');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Olilit', 'SXK', 'Saumlaki', 61, 2, 'Saumlaki');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Pitu', 'OTI', 'Morotai', 61, 2, 'Morotai');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Sultan Babullah', 'TTE', 'Ternate', 61, 2, 'Ternate');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Taliabu', 'TAX', 'Taliabu', 61, 2, 'Taliabu');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Wahai', 'WHI', 'Pulau Seram', 61, 2, 'Pulau Seram');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Abresso', 'RSK', 'Manokwari', 61, 2, 'Manokwari');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Anggi', 'AGD', 'Anggi', 61, 2, 'Anggi');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Apalapsili', 'AAS', 'Jayawijaya', 61, 2, 'Jayawijaya');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Arso', 'ARJ', 'Arso', 61, 2, 'Arso');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Ayawasi', 'AYW', 'Sorong', 61, 2, 'Sorong');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Babo', 'BXB', 'Babo', 61, 2, 'Babo');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Bade', 'BXD', 'Merauke', 61, 2, 'Merauke');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Batom', 'BXM', 'Pegunungan Bintang', 61, 2, 'Pegunungan Bintang');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Bintuni', 'NTI', 'Bintuni', 61, 2, 'Bintuni');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Bokondini', 'BUI', 'Jayawijaya', 61, 2, 'Jayawijaya');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Dabra', 'DRH', 'Puncak Jaya', 61, 2, 'Puncak Jaya');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Elilim', 'ELR', 'Jayawijaya', 61, 2, 'Jayawijaya');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Enarotali', 'EWI', 'Enarotali', 61, 2, 'Enarotali');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Ewer', 'EWE', 'Merauke', 61, 2, 'Merauke');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Illaga', 'ILA', 'Paniai', 61, 2, 'Paniai');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Ilu', 'IUL', 'Puncak Jaya', 61, 2, 'Puncak Jaya');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Inanwatan', 'INX', 'Inanwatan', 61, 2, 'Inanwatan');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Jeffman', 'SOQ', 'Sorong', 61, 2, 'Sorong');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Yemburwo.', 'FOO', 'Numfor Timur', 61, 2, 'Numfor Timur');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Kambuaya', 'KBX', 'Sorong Selatan', 61, 2, 'Sorong Selatan');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Kamur', 'KCD', 'Asmat', 61, 2, 'Asmat');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Karubaga', 'KBF', 'Jayawijaya', 61, 2, 'Jayawijaya');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Kebar', 'KEQ', 'Manokwari', 61, 2, 'Manokwari');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Kelila', 'LLN', 'Jayawijaya', 61, 2, 'Jayawijaya');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Kepi', 'KEI', 'Merauke', 61, 2, 'Merauke');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Kimaan', 'KMM', 'Merauke', 61, 2, 'Merauke');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Kokonao', 'KOX', 'Mimika', 61, 2, 'Mimika');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Lereh', 'LHI', 'Jayapura', 61, 2, 'Jayapura');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Mararena', 'ZRM', 'Sarmi', 61, 2, 'Sarmi');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Merdey', 'RDE', 'Manokwari', 61, 2, 'Manokwari');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Mindiptana', 'MDP', 'Boven Digoel', 61, 2, 'Boven Digoel');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Moanamani', 'ONI', 'Dogiyai', 61, 2, 'Dogiyai');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Mulia', 'LII', 'Puncak Jaya', 61, 2, 'Puncak Jaya');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Muting', 'MUF', 'Merauke', 61, 2, 'Merauke');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Nabire', 'NBX', 'Nabire', 61, 2, 'Nabire');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Obano', 'OBD', 'Nabire', 61, 2, 'Nabire');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Okaba', 'OKQ', 'Puncak Jaya', 61, 2, 'Puncak Jaya');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Oksibil', 'OKL', 'Pegunungan Bintang', 61, 2, 'Pegunungan Bintang');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Pulau Gag', 'GAV', 'Raja Ampat', 61, 2, 'Raja Ampat');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Rendani', 'MKW', 'Manokwari', 61, 2, 'Manokwari');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Senggeh', 'SEH', 'Keerom', 61, 2, 'Keerom');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Senggo', 'ZEG', 'Mappi', 61, 2, 'Mappi');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Sinak', 'NKD', 'Puncak Jaya', 61, 2, 'Puncak Jaya');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Sudjarwo Tjondronegoro', 'ZRI', 'Serui', 61, 2, 'Serui');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Tanah Merah', 'TMH', 'Tanah Merah', 61, 2, 'Tanah Merah');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Teminabuan', 'TXM', 'Teminabuan', 61, 2, 'Teminabuan');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Tiom', 'TMY', 'Jayawijaya', 61, 2, 'Jayawijaya');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Torea', 'FKQ', 'Fakfak', 61, 2, 'Fakfak');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Ubrub', 'UBR', 'Keerom', 61, 2, 'Keerom');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Utarom', 'KNG', 'Kaimana', 61, 2, 'Kaimana');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Waghete', 'WET', 'Deiyai', 61, 2, 'Deiyai');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Wamena', 'WMX', 'Wamena', 61, 2, 'Wamena');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Waris', 'WAR', 'Keerom', 61, 2, 'Keerom');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Wasior', 'WSR', 'Wasior', 61, 2, 'Wasior');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Yuruf', 'RUF', 'Jayawijaya', 61, 2, 'Jayawijaya');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Zugapa', 'UGU', 'Paniai', 61, 2, 'Paniai');
INSERT INTO [Bandara] ([Nama], [KodeIATA], [Kota], [NegaraID], [JumlahTerminal], [Alamat]) VALUES ('Domine Eduard Osok', 'SOQ', 'Sorong', 61, 2, 'Sorong');



INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Adam Air', 'PT Adam Air', 16, 'Adam Air adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Aviastar', 'PT Aviastar', 12, 'Aviastar adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Batavia Air', 'PT Batavia Air', 6, 'Batavia Air adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Batik Air', 'PT Batik Air', 17, 'Batik Air adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Bouraq Indonesia Airlines', 'PT Bouraq Indonesia Airlines', 19, 'Bouraq Indonesia Airlines adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Citilink', 'PT Citilink', 12, 'Citilink adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Garuda Indonesia', 'PT Garuda Indonesia', 5, 'Garuda Indonesia adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Indonesia AirAsia', 'PT Indonesia AirAsia', 17, 'Indonesia AirAsia adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Indonesia AirAsia X', 'PT Indonesia AirAsia X', 16, 'Indonesia AirAsia X adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Indonesia Airlines', 'PT Indonesia Airlines', 10, 'Indonesia Airlines adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Indonesia Metro Aviation', 'PT Indonesia Metro Aviation', 10, 'Indonesia Metro Aviation adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Jatayu Airlines', 'PT Jatayu Airlines', 11, 'Jatayu Airlines adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Kalstar Aviation', 'PT Kalstar Aviation', 13, 'Kalstar Aviation adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Kartika Airlines', 'PT Kartika Airlines', 5, 'Kartika Airlines adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Lion Air', 'PT Lion Air', 11, 'Lion Air adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Mandala Tigerair', 'PT Mandala Tigerair', 11, 'Mandala Tigerair adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Merpati Nusantara Airlines', 'PT Merpati Nusantara Airlines', 5, 'Merpati Nusantara Airlines adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('NAM Air', 'PT NAM Air', 14, 'NAM Air adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Pelita Air Service', 'PT Pelita Air Service', 15, 'Pelita Air Service adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Sky Aviation', 'PT Sky Aviation', 14, 'Sky Aviation adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Sempati Air', 'PT Sempati Air', 7, 'Sempati Air adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Sriwijaya Air', 'PT Sriwijaya Air', 7, 'Sriwijaya Air adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Star Air', 'PT Star Air', 11, 'Star Air adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Super Air Jet', 'PT Super Air Jet', 12, 'Super Air Jet adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Susi Air', 'PT Susi Air', 18, 'Susi Air adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('TransNusa', 'PT TransNusa', 9, 'TransNusa adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Trigana Air', 'PT Trigana Air', 16, 'Trigana Air adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Wings Air', 'PT Wings Air', 18, 'Wings Air adalah salah satu maskapai penerbangan terbaik di Indonesia');
INSERT INTO [Maskapai] ([Nama], [Perusahaan], [JumlahKru], [Deskripsi]) VALUES ('Xpress Air', 'PT Xpress Air', 13, 'Xpress Air adalah salah satu maskapai penerbangan terbaik di Indonesia');




INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0696', 10, 21, 24, '2023-04-21 07:25:00', 95, 1522700);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0697', 21, 10, 24, '2023-04-27 09:40:00', 85, 1268500);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7508', 12, 11, 4, '2023-05-22 05:00:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7510', 12, 11, 4, '2023-05-22 07:45:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7516', 12, 11, 4, '2023-05-22 10:45:00', 75, 1343152);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7514', 12, 11, 4, '2023-05-22 14:50:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7512', 12, 11, 4, '2023-05-22 15:40:00', 75, 893837);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7518', 12, 11, 4, '2023-05-22 19:55:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0201', 12, 10, 19, '2023-05-22 08:20:00', 95, 735000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0205', 12, 10, 19, '2023-05-22 13:20:00', 95, 1035000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0209', 12, 10, 19, '2023-05-22 15:10:00', 95, 835000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0203', 12, 10, 19, '2023-05-22 19:50:00', 95, 685000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6589', 12, 10, 4, '2023-05-22 05:00:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6597', 12, 10, 4, '2023-05-22 07:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6581', 12, 10, 4, '2023-05-22 09:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6585', 12, 10, 4, '2023-05-22 10:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6593', 12, 10, 4, '2023-05-22 11:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6573', 12, 10, 4, '2023-05-22 14:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6401', 12, 10, 4, '2023-05-22 15:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6587', 12, 10, 4, '2023-05-22 16:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7579', 12, 10, 4, '2023-05-22 17:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0990', 12, 10, 15, '2023-05-22 09:10:00', 55, 1257180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0706', 12, 10, 15, '2023-05-22 10:25:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0882', 12, 10, 15, '2023-05-22 07:00:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0333', 12, 10, 24, '2023-05-22 06:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0331', 12, 10, 24, '2023-05-22 08:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0343', 12, 10, 24, '2023-05-22 16:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0341', 12, 10, 24, '2023-05-22 17:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-22 06:00:00', 55, 1060980);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IN-0192', 12, 10, 18, '2023-05-22 12:30:00', 70, 2631720);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IN-0192', 12, 10, 18, '2023-05-22 12:30:00', 70, 2631720);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0711', 12, 10, 6, '2023-05-22 17:45:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0717', 12, 10, 6, '2023-05-22 14:20:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0719', 12, 10, 6, '2023-05-22 19:30:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0737', 12, 10, 6, '2023-05-22 18:40:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0723', 12, 10, 6, '2023-05-22 10:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0713', 12, 10, 6, '2023-05-22 08:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0725', 12, 10, 6, '2023-05-22 06:00:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0715', 12, 10, 6, '2023-05-22 09:50:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0253', 12, 10, 6, '2023-05-22 09:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0591', 12, 10, 15, '2023-05-22 06:15:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0573', 12, 10, 15, '2023-05-22 07:40:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0693', 12, 10, 15, '2023-05-22 07:55:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0697', 12, 10, 15, '2023-05-22 11:20:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0749', 12, 10, 15, '2023-05-22 14:20:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0581', 12, 10, 15, '2023-05-22 17:40:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0786', 12, 10, 15, '2023-05-22 05:00:00', 90, 2705680);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0646', 12, 10, 15, '2023-05-22 05:55:00', 65, 1454080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0305', 12, 10, 7, '2023-05-22 07:05:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0311', 12, 10, 7, '2023-05-22 09:30:00', 90, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0327', 12, 10, 7, '2023-05-22 11:35:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0317', 12, 10, 7, '2023-05-22 13:35:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0315', 12, 10, 7, '2023-05-22 16:30:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0325', 12, 10, 7, '2023-05-22 18:40:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-22 06:00:00', 55, 1227180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0173', 12, 11, 6, '2023-05-22 19:00:00', 90, 826284);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0175', 12, 11, 6, '2023-05-22 08:05:00', 90, 826284);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0171', 12, 11, 6, '2023-05-22 13:45:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0179', 12, 11, 6, '2023-05-22 17:30:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0177', 12, 11, 6, '2023-05-22 09:00:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0990', 12, 10, 15, '2023-05-23 09:10:00', 55, 1257180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0706', 12, 10, 15, '2023-05-23 10:25:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0882', 12, 10, 15, '2023-05-23 07:00:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0591', 12, 10, 15, '2023-05-23 06:15:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0573', 12, 10, 15, '2023-05-23 07:40:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0693', 12, 10, 15, '2023-05-23 07:55:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0697', 12, 10, 15, '2023-05-23 11:20:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0749', 12, 10, 15, '2023-05-23 14:20:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0581', 12, 10, 15, '2023-05-23 17:40:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0786', 12, 10, 15, '2023-05-23 05:00:00', 90, 2705680);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0646', 12, 10, 15, '2023-05-23 05:55:00', 65, 1454080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0173', 12, 11, 6, '2023-05-23 19:00:00', 90, 772601);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0175', 12, 11, 6, '2023-05-23 08:05:00', 90, 772601);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0171', 12, 11, 6, '2023-05-23 13:45:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0179', 12, 11, 6, '2023-05-23 17:30:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0177', 12, 11, 6, '2023-05-23 09:00:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0305', 12, 10, 7, '2023-05-23 07:05:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0317', 12, 10, 7, '2023-05-23 13:35:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0449', 12, 10, 7, '2023-05-23 15:55:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0325', 12, 10, 7, '2023-05-23 18:40:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-23 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-23 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-23 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-23 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-23 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-23 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-23 06:00:00', 55, 1227180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7508', 12, 11, 4, '2023-05-23 05:00:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7510', 12, 11, 4, '2023-05-23 07:45:00', 75, 765845);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7516', 12, 11, 4, '2023-05-23 10:45:00', 75, 1343152);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7514', 12, 11, 4, '2023-05-23 14:50:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7512', 12, 11, 4, '2023-05-23 15:40:00', 75, 893837);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7518', 12, 11, 4, '2023-05-23 19:55:00', 75, 765845);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6589', 12, 10, 4, '2023-05-23 05:00:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6597', 12, 10, 4, '2023-05-23 07:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6581', 12, 10, 4, '2023-05-23 09:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6585', 12, 10, 4, '2023-05-23 10:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6593', 12, 10, 4, '2023-05-23 11:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6573', 12, 10, 4, '2023-05-23 14:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6401', 12, 10, 4, '2023-05-23 15:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6587', 12, 10, 4, '2023-05-23 16:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7579', 12, 10, 4, '2023-05-23 17:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0201', 12, 10, 19, '2023-05-23 08:20:00', 95, 734000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0205', 12, 10, 19, '2023-05-23 13:20:00', 95, 1034000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0203', 12, 10, 19, '2023-05-23 19:50:00', 95, 684000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0333', 12, 10, 24, '2023-05-23 06:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0331', 12, 10, 24, '2023-05-23 08:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0343', 12, 10, 24, '2023-05-23 16:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0341', 12, 10, 24, '2023-05-23 17:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-23 06:00:00', 55, 1060980);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0711', 12, 10, 6, '2023-05-23 17:45:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0717', 12, 10, 6, '2023-05-23 14:20:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0719', 12, 10, 6, '2023-05-23 19:30:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0737', 12, 10, 6, '2023-05-23 18:40:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0723', 12, 10, 6, '2023-05-23 11:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0713', 12, 10, 6, '2023-05-23 08:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0725', 12, 10, 6, '2023-05-23 06:00:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0715', 12, 10, 6, '2023-05-23 09:50:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0253', 12, 10, 6, '2023-05-23 09:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6589', 12, 10, 4, '2023-05-24 05:00:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6597', 12, 10, 4, '2023-05-24 07:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6581', 12, 10, 4, '2023-05-24 09:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6585', 12, 10, 4, '2023-05-24 10:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6593', 12, 10, 4, '2023-05-24 11:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6573', 12, 10, 4, '2023-05-24 14:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6401', 12, 10, 4, '2023-05-24 15:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6587', 12, 10, 4, '2023-05-24 16:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7579', 12, 10, 4, '2023-05-24 17:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0333', 12, 10, 24, '2023-05-24 06:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0331', 12, 10, 24, '2023-05-24 08:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0343', 12, 10, 24, '2023-05-24 16:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0341', 12, 10, 24, '2023-05-24 17:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-24 06:00:00', 55, 1128680);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IN-0192', 12, 10, 18, '2023-05-24 12:30:00', 70, 2631720);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0711', 12, 10, 6, '2023-05-24 17:45:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0737', 12, 10, 6, '2023-05-24 18:40:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0719', 12, 10, 6, '2023-05-24 19:30:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0717', 12, 10, 6, '2023-05-24 14:20:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0713', 12, 10, 6, '2023-05-24 08:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0253', 12, 10, 6, '2023-05-24 09:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0715', 12, 10, 6, '2023-05-24 09:50:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0201', 12, 10, 19, '2023-05-24 08:20:00', 95, 834000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0205', 12, 10, 19, '2023-05-24 13:20:00', 95, 1034000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0209', 12, 10, 19, '2023-05-24 15:10:00', 95, 634000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0203', 12, 10, 19, '2023-05-24 19:50:00', 95, 684000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0990', 12, 10, 15, '2023-05-24 09:10:00', 55, 1257180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0706', 12, 10, 15, '2023-05-24 10:25:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0882', 12, 10, 15, '2023-05-24 07:00:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0173', 12, 11, 6, '2023-05-24 19:00:00', 90, 772601);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0175', 12, 11, 6, '2023-05-24 08:05:00', 90, 826284);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0171', 12, 11, 6, '2023-05-24 13:45:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0179', 12, 11, 6, '2023-05-24 17:30:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0177', 12, 11, 6, '2023-05-24 09:00:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0305', 12, 10, 7, '2023-05-24 07:05:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0327', 12, 10, 7, '2023-05-24 11:35:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0317', 12, 10, 7, '2023-05-24 13:35:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0315', 12, 10, 7, '2023-05-24 16:30:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0325', 12, 10, 7, '2023-05-24 19:55:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-24 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-24 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-24 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-24 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-24 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0591', 12, 10, 15, '2023-05-24 06:15:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0573', 12, 10, 15, '2023-05-24 07:40:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0693', 12, 10, 15, '2023-05-24 07:55:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0697', 12, 10, 15, '2023-05-24 11:20:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0749', 12, 10, 15, '2023-05-24 14:20:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0581', 12, 10, 15, '2023-05-24 17:40:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0786', 12, 10, 15, '2023-05-24 05:00:00', 90, 2705680);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0646', 12, 10, 15, '2023-05-24 05:55:00', 65, 1454080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-24 06:00:00', 55, 1227180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7508', 12, 11, 4, '2023-05-24 05:00:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7510', 12, 11, 4, '2023-05-24 07:45:00', 75, 765845);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7516', 12, 11, 4, '2023-05-24 10:45:00', 75, 1343152);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7514', 12, 11, 4, '2023-05-24 14:50:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7512', 12, 11, 4, '2023-05-24 15:40:00', 75, 893837);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7518', 12, 11, 4, '2023-05-24 19:55:00', 75, 765845);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0990', 12, 10, 15, '2023-05-25 09:10:00', 55, 1257180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0706', 12, 10, 15, '2023-05-25 10:25:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0882', 12, 10, 15, '2023-05-25 07:00:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0305', 12, 10, 7, '2023-05-25 07:05:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0327', 12, 10, 7, '2023-05-25 11:35:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0317', 12, 10, 7, '2023-05-25 13:35:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0449', 12, 10, 7, '2023-05-25 15:55:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0315', 12, 10, 7, '2023-05-25 16:30:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0173', 12, 11, 6, '2023-05-25 19:00:00', 90, 826284);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0175', 12, 11, 6, '2023-05-25 08:05:00', 90, 881063);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0177', 12, 11, 6, '2023-05-25 09:00:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0171', 12, 11, 6, '2023-05-25 13:45:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0591', 12, 10, 15, '2023-05-25 06:15:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0573', 12, 10, 15, '2023-05-25 07:40:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0693', 12, 10, 15, '2023-05-25 07:55:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0697', 12, 10, 15, '2023-05-25 11:20:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0749', 12, 10, 15, '2023-05-25 14:20:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0581', 12, 10, 15, '2023-05-25 17:40:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0786', 12, 10, 15, '2023-05-25 05:00:00', 90, 2705680);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0646', 12, 10, 15, '2023-05-25 05:55:00', 65, 1454080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7508', 12, 11, 4, '2023-05-25 05:00:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7510', 12, 11, 4, '2023-05-25 07:45:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7516', 12, 11, 4, '2023-05-25 10:45:00', 75, 1343152);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7514', 12, 11, 4, '2023-05-25 14:50:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7512', 12, 11, 4, '2023-05-25 15:40:00', 75, 893837);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7518', 12, 11, 4, '2023-05-25 19:55:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6589', 12, 10, 4, '2023-05-25 05:00:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6597', 12, 10, 4, '2023-05-25 07:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6581', 12, 10, 4, '2023-05-25 09:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6585', 12, 10, 4, '2023-05-25 10:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6593', 12, 10, 4, '2023-05-25 11:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6573', 12, 10, 4, '2023-05-25 14:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6401', 12, 10, 4, '2023-05-25 15:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6587', 12, 10, 4, '2023-05-25 16:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7579', 12, 10, 4, '2023-05-25 17:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-25 06:00:00', 55, 1257180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0333', 12, 10, 24, '2023-05-25 06:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0331', 12, 10, 24, '2023-05-25 08:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0343', 12, 10, 24, '2023-05-25 16:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0341', 12, 10, 24, '2023-05-25 17:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-25 06:00:00', 55, 1158680);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0711', 12, 10, 6, '2023-05-25 17:45:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0717', 12, 10, 6, '2023-05-25 14:20:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0719', 12, 10, 6, '2023-05-25 19:30:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0737', 12, 10, 6, '2023-05-25 18:40:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0723', 12, 10, 6, '2023-05-25 10:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0713', 12, 10, 6, '2023-05-25 08:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0725', 12, 10, 6, '2023-05-25 06:00:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0715', 12, 10, 6, '2023-05-25 09:50:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0253', 12, 10, 6, '2023-05-25 09:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0201', 12, 10, 19, '2023-05-25 08:20:00', 95, 934000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0205', 12, 10, 19, '2023-05-25 13:20:00', 95, 1134000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0203', 12, 10, 19, '2023-05-25 19:50:00', 95, 834000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6589', 12, 10, 4, '2023-05-26 05:00:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6597', 12, 10, 4, '2023-05-26 07:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6581', 12, 10, 4, '2023-05-26 09:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6585', 12, 10, 4, '2023-05-26 10:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6593', 12, 10, 4, '2023-05-26 11:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6573', 12, 10, 4, '2023-05-26 14:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6401', 12, 10, 4, '2023-05-26 15:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6587', 12, 10, 4, '2023-05-26 16:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7579', 12, 10, 4, '2023-05-26 17:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-26 06:00:00', 55, 1287080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0201', 12, 10, 19, '2023-05-26 08:20:00', 95, 1034000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0209', 12, 10, 19, '2023-05-26 15:10:00', 95, 834000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0203', 12, 10, 19, '2023-05-26 19:50:00', 95, 834000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0711', 12, 10, 6, '2023-05-26 17:45:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0717', 12, 10, 6, '2023-05-26 14:20:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0719', 12, 10, 6, '2023-05-26 19:30:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0737', 12, 10, 6, '2023-05-26 18:40:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0723', 12, 10, 6, '2023-05-26 10:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0713', 12, 10, 6, '2023-05-26 08:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0725', 12, 10, 6, '2023-05-26 06:00:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0715', 12, 10, 6, '2023-05-26 09:50:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0253', 12, 10, 6, '2023-05-26 09:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IN-0192', 12, 10, 18, '2023-05-26 12:30:00', 70, 2631720);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0333', 12, 10, 24, '2023-05-26 06:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0331', 12, 10, 24, '2023-05-26 08:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0343', 12, 10, 24, '2023-05-26 16:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0341', 12, 10, 24, '2023-05-26 17:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-26 06:00:00', 55, 1120980);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0990', 12, 10, 15, '2023-05-26 09:10:00', 55, 1317080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0706', 12, 10, 15, '2023-05-26 10:25:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0882', 12, 10, 15, '2023-05-26 07:00:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0591', 12, 10, 15, '2023-05-26 06:15:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0573', 12, 10, 15, '2023-05-26 07:40:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0693', 12, 10, 15, '2023-05-26 07:55:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0697', 12, 10, 15, '2023-05-26 11:20:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0749', 12, 10, 15, '2023-05-26 14:20:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0581', 12, 10, 15, '2023-05-26 17:40:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0786', 12, 10, 15, '2023-05-26 05:00:00', 90, 2705680);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0646', 12, 10, 15, '2023-05-26 05:55:00', 65, 1454080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0305', 12, 10, 7, '2023-05-26 07:05:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0327', 12, 10, 7, '2023-05-26 11:35:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0317', 12, 10, 7, '2023-05-26 13:35:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0315', 12, 10, 7, '2023-05-26 16:30:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0325', 12, 10, 7, '2023-05-26 18:40:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-26 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-26 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-26 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-26 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-26 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-26 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0173', 12, 11, 6, '2023-05-26 19:00:00', 90, 881063);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0175', 12, 11, 6, '2023-05-26 08:05:00', 90, 881063);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0177', 12, 11, 6, '2023-05-26 09:00:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0171', 12, 11, 6, '2023-05-26 13:45:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7508', 12, 11, 4, '2023-05-26 05:00:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7510', 12, 11, 4, '2023-05-26 07:45:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7516', 12, 11, 4, '2023-05-26 10:45:00', 75, 1343152);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7514', 12, 11, 4, '2023-05-26 14:50:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7512', 12, 11, 4, '2023-05-26 15:40:00', 75, 893837);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7518', 12, 11, 4, '2023-05-26 19:55:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0591', 12, 10, 15, '2023-05-27 06:15:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0573', 12, 10, 15, '2023-05-27 07:40:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0693', 12, 10, 15, '2023-05-27 07:55:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0697', 12, 10, 15, '2023-05-27 11:20:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0749', 12, 10, 15, '2023-05-27 14:20:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0581', 12, 10, 15, '2023-05-27 17:40:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0786', 12, 10, 15, '2023-05-27 05:00:00', 90, 2705680);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0646', 12, 10, 15, '2023-05-27 05:55:00', 65, 1454080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0173', 12, 11, 6, '2023-05-27 19:00:00', 90, 826284);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0175', 12, 11, 6, '2023-05-27 08:05:00', 90, 934746);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0171', 12, 11, 6, '2023-05-27 13:45:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0179', 12, 11, 6, '2023-05-27 17:30:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0177', 12, 11, 6, '2023-05-27 09:00:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0990', 12, 10, 15, '2023-05-27 09:10:00', 55, 1257180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0706', 12, 10, 15, '2023-05-27 10:25:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0882', 12, 10, 15, '2023-05-27 07:00:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0305', 12, 10, 7, '2023-05-27 07:05:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0327', 12, 10, 7, '2023-05-27 11:35:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0317', 12, 10, 7, '2023-05-27 13:35:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0449', 12, 10, 7, '2023-05-27 15:55:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0315', 12, 10, 7, '2023-05-27 16:30:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0325', 12, 10, 7, '2023-05-27 18:40:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-27 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-27 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-27 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-27 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-27 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-27 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-27 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7508', 12, 11, 4, '2023-05-27 05:00:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7510', 12, 11, 4, '2023-05-27 07:45:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7516', 12, 11, 4, '2023-05-27 10:45:00', 75, 1343152);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7514', 12, 11, 4, '2023-05-27 14:50:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7512', 12, 11, 4, '2023-05-27 15:40:00', 75, 893837);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7518', 12, 11, 4, '2023-05-27 19:55:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-27 06:00:00', 55, 1227180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0711', 12, 10, 6, '2023-05-27 17:45:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0737', 12, 10, 6, '2023-05-27 18:40:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0719', 12, 10, 6, '2023-05-27 19:30:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0717', 12, 10, 6, '2023-05-27 14:20:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0713', 12, 10, 6, '2023-05-27 08:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0253', 12, 10, 6, '2023-05-27 09:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0715', 12, 10, 6, '2023-05-27 09:50:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0333', 12, 10, 24, '2023-05-27 06:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0331', 12, 10, 24, '2023-05-27 08:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0343', 12, 10, 24, '2023-05-27 16:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0341', 12, 10, 24, '2023-05-27 17:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-27 06:00:00', 55, 1060980);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6589', 12, 10, 4, '2023-05-27 05:00:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6597', 12, 10, 4, '2023-05-27 07:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6581', 12, 10, 4, '2023-05-27 09:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6585', 12, 10, 4, '2023-05-27 10:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6593', 12, 10, 4, '2023-05-27 11:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6573', 12, 10, 4, '2023-05-27 14:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6401', 12, 10, 4, '2023-05-27 15:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6587', 12, 10, 4, '2023-05-27 16:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7579', 12, 10, 4, '2023-05-27 17:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0205', 12, 10, 19, '2023-05-27 13:20:00', 95, 1034000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0203', 12, 10, 19, '2023-05-27 19:50:00', 95, 734000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-28 06:00:00', 55, 1697780);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0333', 12, 10, 24, '2023-05-28 06:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0331', 12, 10, 24, '2023-05-28 08:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0343', 12, 10, 24, '2023-05-28 16:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0341', 12, 10, 24, '2023-05-28 17:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-28 06:00:00', 55, 1262980);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IN-0192', 12, 10, 18, '2023-05-28 12:30:00', 70, 2631720);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0711', 12, 10, 6, '2023-05-28 17:45:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0717', 12, 10, 6, '2023-05-28 14:20:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0719', 12, 10, 6, '2023-05-28 19:30:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0737', 12, 10, 6, '2023-05-28 18:40:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0723', 12, 10, 6, '2023-05-28 10:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0713', 12, 10, 6, '2023-05-28 08:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0725', 12, 10, 6, '2023-05-28 06:00:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0715', 12, 10, 6, '2023-05-28 09:50:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0253', 12, 10, 6, '2023-05-28 09:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0201', 12, 10, 19, '2023-05-28 08:20:00', 95, 734000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0209', 12, 10, 19, '2023-05-28 15:10:00', 95, 834000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0203', 12, 10, 19, '2023-05-28 19:50:00', 95, 834000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6589', 12, 10, 4, '2023-05-28 05:00:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6597', 12, 10, 4, '2023-05-28 07:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6581', 12, 10, 4, '2023-05-28 09:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6585', 12, 10, 4, '2023-05-28 10:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6593', 12, 10, 4, '2023-05-28 11:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6573', 12, 10, 4, '2023-05-28 14:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6401', 12, 10, 4, '2023-05-28 15:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6587', 12, 10, 4, '2023-05-28 16:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7579', 12, 10, 4, '2023-05-28 17:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0591', 12, 10, 15, '2023-05-28 06:15:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0573', 12, 10, 15, '2023-05-28 07:40:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0693', 12, 10, 15, '2023-05-28 07:55:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0697', 12, 10, 15, '2023-05-28 11:20:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0749', 12, 10, 15, '2023-05-28 14:20:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0581', 12, 10, 15, '2023-05-28 17:40:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0786', 12, 10, 15, '2023-05-28 05:00:00', 90, 2705680);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0646', 12, 10, 15, '2023-05-28 05:55:00', 65, 1454080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0305', 12, 10, 7, '2023-05-28 07:05:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0327', 12, 10, 7, '2023-05-28 11:35:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0317', 12, 10, 7, '2023-05-28 13:35:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0315', 12, 10, 7, '2023-05-28 16:30:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0325', 12, 10, 7, '2023-05-28 18:40:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-28 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-28 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-28 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-28 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-28 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-28 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-28 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-28 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-28 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0175', 12, 11, 6, '2023-05-28 08:05:00', 90, 881063);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0173', 12, 11, 6, '2023-05-28 19:00:00', 90, 1096890);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0177', 12, 11, 6, '2023-05-28 09:00:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0171', 12, 11, 6, '2023-05-28 13:45:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0990', 12, 10, 15, '2023-05-28 09:10:00', 55, 1727780);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0706', 12, 10, 15, '2023-05-28 10:25:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0882', 12, 10, 15, '2023-05-28 07:00:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7508', 12, 11, 4, '2023-05-28 05:00:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7510', 12, 11, 4, '2023-05-28 07:45:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7516', 12, 11, 4, '2023-05-28 10:45:00', 75, 1343152);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7514', 12, 11, 4, '2023-05-28 14:50:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7512', 12, 11, 4, '2023-05-28 15:40:00', 75, 893837);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7518', 12, 11, 4, '2023-05-28 19:55:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0591', 12, 10, 15, '2023-05-29 06:15:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0573', 12, 10, 15, '2023-05-29 07:40:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0693', 12, 10, 15, '2023-05-29 07:55:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0697', 12, 10, 15, '2023-05-29 11:20:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0749', 12, 10, 15, '2023-05-29 14:20:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0581', 12, 10, 15, '2023-05-29 17:40:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0786', 12, 10, 15, '2023-05-29 05:00:00', 90, 2705680);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0646', 12, 10, 15, '2023-05-29 05:55:00', 65, 1454080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0173', 12, 11, 6, '2023-05-29 19:00:00', 90, 772601);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0175', 12, 11, 6, '2023-05-29 08:05:00', 90, 881063);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0171', 12, 11, 6, '2023-05-29 13:45:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0179', 12, 11, 6, '2023-05-29 17:30:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0177', 12, 11, 6, '2023-05-29 09:00:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0990', 12, 10, 15, '2023-05-29 09:10:00', 55, 1257180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0706', 12, 10, 15, '2023-05-29 10:25:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0882', 12, 10, 15, '2023-05-29 07:00:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0305', 12, 10, 7, '2023-05-29 07:05:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0311', 12, 10, 7, '2023-05-29 09:30:00', 90, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0327', 12, 10, 7, '2023-05-29 11:35:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0317', 12, 10, 7, '2023-05-29 13:35:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0315', 12, 10, 7, '2023-05-29 16:30:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0325', 12, 10, 7, '2023-05-29 18:40:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IN-0192', 12, 10, 18, '2023-05-29 12:30:00', 70, 2631720);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7508', 12, 11, 4, '2023-05-29 05:00:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7510', 12, 11, 4, '2023-05-29 07:45:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7516', 12, 11, 4, '2023-05-29 10:45:00', 75, 1343152);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7514', 12, 11, 4, '2023-05-29 14:50:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7512', 12, 11, 4, '2023-05-29 15:40:00', 75, 893837);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7518', 12, 11, 4, '2023-05-29 19:55:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0333', 12, 10, 24, '2023-05-29 06:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0331', 12, 10, 24, '2023-05-29 08:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0343', 12, 10, 24, '2023-05-29 16:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0341', 12, 10, 24, '2023-05-29 17:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-29 06:00:00', 55, 1060980);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-29 06:00:00', 55, 1227180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0711', 12, 10, 6, '2023-05-29 17:45:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0717', 12, 10, 6, '2023-05-29 14:20:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0719', 12, 10, 6, '2023-05-29 19:30:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0737', 12, 10, 6, '2023-05-29 18:40:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0723', 12, 10, 6, '2023-05-29 10:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0713', 12, 10, 6, '2023-05-29 08:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0725', 12, 10, 6, '2023-05-29 06:00:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0715', 12, 10, 6, '2023-05-29 09:50:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0253', 12, 10, 6, '2023-05-29 09:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6589', 12, 10, 4, '2023-05-29 05:00:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6597', 12, 10, 4, '2023-05-29 07:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6581', 12, 10, 4, '2023-05-29 09:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6585', 12, 10, 4, '2023-05-29 10:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6593', 12, 10, 4, '2023-05-29 11:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6573', 12, 10, 4, '2023-05-29 14:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6401', 12, 10, 4, '2023-05-29 15:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6587', 12, 10, 4, '2023-05-29 16:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7579', 12, 10, 4, '2023-05-29 17:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0201', 12, 10, 19, '2023-05-29 08:20:00', 95, 734000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0205', 12, 10, 19, '2023-05-29 13:20:00', 95, 1034000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0209', 12, 10, 19, '2023-05-29 15:10:00', 95, 634000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0203', 12, 10, 19, '2023-05-29 19:50:00', 95, 684000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0990', 12, 10, 15, '2023-05-30 09:10:00', 55, 1257180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0706', 12, 10, 15, '2023-05-30 10:25:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0882', 12, 10, 15, '2023-05-30 07:00:00', 90, 2658080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0591', 12, 10, 15, '2023-05-30 06:15:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0573', 12, 10, 15, '2023-05-30 07:40:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0693', 12, 10, 15, '2023-05-30 07:55:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0697', 12, 10, 15, '2023-05-30 11:20:00', 85, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0749', 12, 10, 15, '2023-05-30 14:20:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0581', 12, 10, 15, '2023-05-30 17:40:00', 90, 726331);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0786', 12, 10, 15, '2023-05-30 05:00:00', 90, 2705680);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('JT-0646', 12, 10, 15, '2023-05-30 05:55:00', 65, 1454080);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0173', 12, 11, 6, '2023-05-30 19:00:00', 90, 772601);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0175', 12, 11, 6, '2023-05-30 08:05:00', 90, 772601);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0171', 12, 11, 6, '2023-05-30 13:45:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0179', 12, 11, 6, '2023-05-30 17:30:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0177', 12, 11, 6, '2023-05-30 09:00:00', 90, 1312717);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0305', 12, 10, 7, '2023-05-30 07:05:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0317', 12, 10, 7, '2023-05-30 13:35:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0449', 12, 10, 7, '2023-05-30 15:55:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0325', 12, 10, 7, '2023-05-30 18:40:00', 95, 1536880);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-30 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-30 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-30 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-30 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-30 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('GA-0342', 12, 10, 7, '2023-05-30 09:15:00', 60, 2656180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0201', 12, 10, 19, '2023-05-30 08:20:00', 95, 734000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0205', 12, 10, 19, '2023-05-30 13:20:00', 95, 1034000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IP-0203', 12, 10, 19, '2023-05-30 19:50:00', 95, 684000);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0333', 12, 10, 24, '2023-05-30 06:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0331', 12, 10, 24, '2023-05-30 08:00:00', 85, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0343', 12, 10, 24, '2023-05-30 16:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0341', 12, 10, 24, '2023-05-30 17:00:00', 90, 725966);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-30 06:00:00', 55, 1060980);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0711', 12, 10, 6, '2023-05-30 17:45:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0717', 12, 10, 6, '2023-05-30 14:20:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0719', 12, 10, 6, '2023-05-30 19:30:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0737', 12, 10, 6, '2023-05-30 18:40:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0723', 12, 10, 6, '2023-05-30 11:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0713', 12, 10, 6, '2023-05-30 08:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0725', 12, 10, 6, '2023-05-30 06:00:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0715', 12, 10, 6, '2023-05-30 09:50:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('QG-0253', 12, 10, 6, '2023-05-30 09:10:00', 90, 1317538);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6589', 12, 10, 4, '2023-05-30 05:00:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6597', 12, 10, 4, '2023-05-30 07:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6581', 12, 10, 4, '2023-05-30 09:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6585', 12, 10, 4, '2023-05-30 10:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6593', 12, 10, 4, '2023-05-30 11:10:00', 85, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6573', 12, 10, 4, '2023-05-30 14:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6401', 12, 10, 4, '2023-05-30 15:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-6587', 12, 10, 4, '2023-05-30 16:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7579', 12, 10, 4, '2023-05-30 17:10:00', 90, 833670);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('IU-0706', 12, 10, 24, '2023-05-30 06:00:00', 55, 1227180);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7508', 12, 11, 4, '2023-05-30 05:00:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7510', 12, 11, 4, '2023-05-30 07:45:00', 75, 765845);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7516', 12, 11, 4, '2023-05-30 10:45:00', 75, 1343152);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7514', 12, 11, 4, '2023-05-30 14:50:00', 75, 829891);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7512', 12, 11, 4, '2023-05-30 15:40:00', 75, 893837);
INSERT INTO [JadwalPenerbangan] ([KodePenerbangan], [BandaraKeberangkatanID], [BandaraTujuanID], [MaskapaiID], [TanggalWaktuKeberangkatan], [DurasiPenerbangan], [HargaPerTiket]) VALUES ('ID-7518', 12, 11, 4, '2023-05-30 19:55:00', 75, 829891);







INSERT INTO [KodePromo] ([Kode], [PersentaseDiskon], [MaksimumDiskon], [BerlakuSampai], [Deskripsi]) VALUES ('BROMOAJAYUK', 15, 100000, '2023-09-09', 'Yuk pakai diskon ini');
INSERT INTO [KodePromo] ([Kode], [PersentaseDiskon], [MaksimumDiskon], [BerlakuSampai], [Deskripsi]) VALUES ('NAIKBROMOAIRLINES', 10, 150000, '2023-09-09', 'Bromo Airlines??? Si Paling Terbang!!!');





INSERT INTO [StatusPenerbangan] ([Nama]) VALUES ('Sesuai Jadwal');
INSERT INTO [StatusPenerbangan] ([Nama]) VALUES ('Telah Berangkat');
INSERT INTO [StatusPenerbangan] ([Nama]) VALUES ('Delay');
INSERT INTO [StatusPenerbangan] ([Nama]) VALUES ('Cancel');




INSERT INTO [TransaksiHeader] ([AkunID], [TanggalTransaksi], [JadwalPenerbanganID], [JumlahPenumpang], [TotalHarga], [KodePromoID]) VALUES (2, '2023-04-01', 1, 3, 4568100, NULL);
INSERT INTO [TransaksiHeader] ([AkunID], [TanggalTransaksi], [JadwalPenerbanganID], [JumlahPenumpang], [TotalHarga], [KodePromoID]) VALUES (3, '2023-04-01', 2, 5, 6342500, 2);


INSERT INTO [TransaksiDetail] ([TransaksiHeaderID], [TitelPenumpang], [NamaLengkapPenumpang]) VALUES (1, 'Nyonya', 'Ruthanne Daveley');
INSERT INTO [TransaksiDetail] ([TransaksiHeaderID], [TitelPenumpang], [NamaLengkapPenumpang]) VALUES (1, 'Tuan', 'Isaak Wessell');
INSERT INTO [TransaksiDetail] ([TransaksiHeaderID], [TitelPenumpang], [NamaLengkapPenumpang]) VALUES (1, 'Nyonya', 'Winny McCabe');
INSERT INTO [TransaksiDetail] ([TransaksiHeaderID], [TitelPenumpang], [NamaLengkapPenumpang]) VALUES (2, 'Tuan', 'Larry Spowage');
INSERT INTO [TransaksiDetail] ([TransaksiHeaderID], [TitelPenumpang], [NamaLengkapPenumpang]) VALUES (2, 'Tuan', 'Eirena Rosekilly');
INSERT INTO [TransaksiDetail] ([TransaksiHeaderID], [TitelPenumpang], [NamaLengkapPenumpang]) VALUES (2, 'Tuan', 'Heinrick Bestwall');
INSERT INTO [TransaksiDetail] ([TransaksiHeaderID], [TitelPenumpang], [NamaLengkapPenumpang]) VALUES (2, 'Tuan', 'Benedicta Giacoboni');
INSERT INTO [TransaksiDetail] ([TransaksiHeaderID], [TitelPenumpang], [NamaLengkapPenumpang]) VALUES (2, 'Nyonya', 'Nyssa Weddeburn - Scrimgeour');