USE QLThuVienCKY1

--1--
SELECT CS.isbn, CS.masach, DS.tensach, COUNT (DISTINCT PM.madg)
FROM CuonSach as CS, CT_PhieuMuon as CTPM, PhieuMuon as PM, DocGia as DG, DauSach as DS
WHERE DG.madg = PM.madg AND PM.mapm = CTPM.mapm AND CTPM.isbn = CS.isbn AND CTPM.masach = CS.masach AND CS.isbn = DS.isbn AND DG.madg IN 
																												   (SELECT DISTINCT DG.madg
																													FROM CT_PhieuMuon as CTPM, PhieuMuon as PM, DocGia as DG
																													WHERE DG.madg = PM.madg AND PM.mapm = CTPM.mapm
																													)
GROUP BY CS.isbn, CS.masach, DS.tensach
HAVING COUNT (DISTINCT PM.madg) = (SELECT COUNT (DISTINCT DG.madg)
								   FROM CT_PhieuMuon as CTPM, PhieuMuon as PM, DocGia as DG
					 			   WHERE DG.madg = PM.madg AND PM.mapm = CTPM.mapm
)

--2--
SELECT NV.MaNV, NV.HoTenNV, PM.NVienLapPM
FROM NhanVien_TV AS NV, PhieuMuon AS PM, CT_PhieuMuon AS CTPM
WHERE NV.MaNV = PM.NVienLapPM AND CTPM.mapm = PM.mapm AND PM.ngaymuon BETWEEN '2023-03-01' AND '2023-03-31' 
GROUP BY NV.MaNV, NV.HoTenNV, PM.NVienLapPM, PM.mapm
HAVING COUNT (PM.mapm) >= ALL (SELECT COUNT (CTPM.mapm)
							   FROM NhanVien_TV AS NV, PhieuMuon AS PM, CT_PhieuMuon AS CTPM
							   WHERE NV.MaNV = PM.NVienLapPM AND CTPM.mapm = PM.mapm AND PM.ngaymuon BETWEEN '2023-03-01' AND '2023-03-31' 
							   )

--3--
DROP PROCEDURE update_luong_nv
GO

CREATE PROCEDURE update_luong_nv @MANV varchar(5)
AS
BEGIN
	Declare @i int = 1
	Declare @SLNV int
	Declare @NGAYHUONGLUONG datetime
	Declare @HESOLUONG float
	Declare @MUCLUONG float
	Declare @PHUCAP float
	Declare @LUONGHIENTAI float
	Declare @LUONGMOI float

	IF (@MANV NOT IN (SELECT MaNV FROM NhanVien_TV))
	BEGIN
		Print ('Ma nhan vien khong hop le!')
		RETURN;
	END 
	ELSE 
	BEGIN
		SELECT TOP (@i) @MANV = QT.MaNV, @NGAYHUONGLUONG = QT.NgayHuongLuong, @HESOLUONG = QT.HeSoLuong, @MUCLUONG = QT.MucLuongCoBan, @PHUCAP = QT.PhuCap 
		FROM QuaTrinhLuongNV as QT
		WHERE QT.MaNV = @MANV 
		ORDER BY QT.NgayHuongLuong DESC;

		IF YEAR(GETDATE()) -  YEAR(@NGAYHUONGLUONG) < 0
		BEGIN
			Print ('Chua du 3 nam ke tu ngay huong luong')
			RETURN;
		END
		ELSE 
		BEGIN
			SET @LUONGMOI = (@HESOLUONG + 0.3) * @MUCLUONG + @PHUCAP + 300000

			SELECT TOP (@i) @LUONGHIENTAI = NV.LuongHienTai 
			FROM NhanVien_TV AS NV
			WHERE @MANV = NV.MaNV
			IF (@LUONGHIENTAI < @LUONGMOI)
			BEGIN
				UPDATE NhanVien_TV SET LuongHienTai = @LUONGMOI WHERE MaNV = @MANV 
				INSERT INTO QuaTrinhLuongNV VALUES(@MANV,GETDATE(),@HESOLUONG,@MUCLUONG,@PHUCAP)
			END
		END
	END
END
GO

Exec update_luong_nv '001'
GO
