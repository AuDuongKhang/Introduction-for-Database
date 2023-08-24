USE QLKHOHANG
--1--
SELECT HH.MaHangHoa, HH.TenHangHoa
FROM HangHoa AS HH001, HangHoa AS HH
WHERE HH.TongSoLuong > HH001.TongSoLuong AND HH001.MaHangHoa = N'NCĐ001'
--2--
SELECT NV.MaNhanVien, NV.TenNhanVien
FROM NhanVien AS NV, HangHoa AS HH,  PhieuBienNhan AS PBN, ChiTietBienNhan AS CTBN
WHERE NV.MaNhanVien = PBN.MaNhanVien AND PBN.MaBienNhan = CTBN.MaBienNhan AND HH.MaHangHoa = CTBN.MaHangHoa AND CTBN.MaHangHoa IN 
																																(SELECT DISTINCT HH.MaHangHoa
																																 FROM HangHoa AS HH, ChiTietBienNhan AS CTBN
																																 WHERE HH.ThuongHieu = 'Sony' AND CTBN.MaHangHoa = HH.MaHangHoa)
GROUP BY NV.MaNhanVien, NV.TenNhanVien
HAVING COUNT (DISTINCT CTBN.MaHangHoa) = (
										  SELECT COUNT (DISTINCT HH.MaHangHoa)
										  FROM HangHoa AS HH, ChiTietBienNhan AS CTBN
										  WHERE HH.ThuongHieu = 'Sony' AND CTBN.MaHangHoa = HH.MaHangHoa
										  )
--3--
DROP PROCEDURE sp_KiemDiem_HangHoa 
GO
CREATE PROCEDURE sp_KiemDiem_HangHoa  @MAHANGHOA nvarchar(10), @SoLuongHangHoa int out
AS
BEGIN
	Declare @SLHH int = 0
	Declare @TONGSOLUONG int = 0

	--3.b1--
	IF (@MAHANGHOA = NULL OR @MAHANGHOA NOT IN (SELECT MaHangHoa FROM HangHoa)) RETURN 0;
	--3.b2--
	SELECT @SLHH = SUM(CTBN.SoLuong)
	FROM HangHoa AS HH, ChiTietBienNhan AS CTBN
	WHERE HH.MaHangHoa = @MAHANGHOA AND HH.MaHangHoa = CTBN.MaHangHoa
	Print ('So luong hang hoa con trong kho: ' + @MAHANGHOA)
	Print(@SLHH)
	--3.b3--
	SELECT TOP (1) @TONGSOLUONG = HH.TongSoLuong
	FROM HangHoa AS HH, PhieuBienNhan AS PBN, ChiTietBienNhan AS CTBN
	WHERE HH.MaHangHoa = CTBN.MaHangHoa AND PBN.MaBienNhan = CTBN.MaBienNhan AND HH.MaHangHoa = @MAHANGHOA
	ORDER BY PBN.NgayGioXuatPhieu DESC;
	IF (@TONGSOLUONG = @SLHH)	RETURN 0;	
	--3.b4--
	UPDATE HangHoa SET NgayKiemKe = GETDATE() WHERE MaHangHoa = @MAHANGHOA
	UPDATE HangHoa SET TongSoLuong = @SLHH WHERE MaHangHoa = @MAHANGHOA
	SET @SoLuongHangHoa = @SLHH
	RETURN 1;
END
GO
Declare @Soluong int
Exec sp_KiemDiem_HangHoa 'TV001', @Soluong
Print (@Soluong)
GO
--4--
DROP PROCEDURE sp_KiemDiem_All_HangHoa
GO
CREATE PROCEDURE sp_KiemDiem_All_HangHoa
AS
BEGIN
	Declare @i int = 1
	Declare @TONGHANGHOA int
	Declare @SLHH int
	Declare @MAHH nvarchar(10)
	SELECT @TONGHANGHOA = COUNT(*)
	FROM HangHoa
	--4.b1--
	WHILE (@i <= @TONGHANGHOA)
	BEGIN
		SELECT TOP (@i) @MAHH = MaHangHoa
		FROM HangHoa
		Exec sp_KiemDiem_HangHoa @MAHH, @SLHH
		--4.b2--
		Print ('So luong hang hoa cua ma hang hoa sau khi cap nhat: ' + @MAHH)
		Print (@SLHH)
		SET @i = @i + 1
	END
END
GO
Exec sp_KiemDiem_All_HangHoa
GO