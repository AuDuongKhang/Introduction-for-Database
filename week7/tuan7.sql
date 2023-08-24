USE QLGiaoVien
--a--
DROP PROCEDURE IF EXISTS helloworld
GO
CREATE PROCEDURE helloworld
AS 
	Print 'Hello World !!!'

Exec helloworld
GO
--b--
DROP PROCEDURE IF EXISTS tong2so
GO
CREATE PROCEDURE tong2so @m int, @n int
AS	
	Declare @tong int
	SET @tong = @m + @n
	Print @tong
Exec tong2so 2,3
GO
--c--
DROP PROCEDURE IF EXISTS tong2so_out 
GO
CREATE PROCEDURE tong2so_out @m int, @n int, @tong int out
AS	
	SET @tong = @m + @n

Declare @sum int
Exec tong2so_out 2,3, @sum
Print @sum
GO
--d--
DROP PROCEDURE IF EXISTS tong3so
GO
CREATE PROCEDURE tong3so @m int, @n int,@k int
AS	
	Declare @tong int
	SET @tong = 0
	Exec tong2so_out @m, @n, @tong
	SET @tong = @tong + @k
	Print @tong

Exec tong3so 2,3,4
GO
--e--
DROP PROCEDURE IF EXISTS tongmn
GO
CREATE PROCEDURE tongmn @m int, @n int
AS	
	Declare @tong int
	Declare @i int
	SET @tong = 0
	SET @i = @m
	WHILE (@i < @n)
	BEGIN
		SET @tong = @tong + @i
		SET @i = @i + 1
	END
	Print @tong

Exec tongmn 2,5
GO
--f--
DROP PROCEDURE IF EXISTS kiemtrasnt
GO
CREATE PROCEDURE kiemtrasnt @so int
AS	
	Declare @dem int
	Declare @i int
	IF (@so < 2)
		RETURN 0
	SET @dem = 0
	SET @i = 1
	WHILE (@i <= @so)
	BEGIN
		IF (@so % @i = 0)
		BEGIN
			SET @dem = @dem + 1
		END
		SET @i = @i + 1
	END
	IF (@dem = 2)
	BEGIN
		RETURN 1
	END
	ELSE 
	BEGIN
		RETURN 0
	END

Declare @check int
Exec @check = kiemtrasnt 4
IF (@check = 1)
Print N'Đây là số nguyên tố'
else 
Print N'Đây không là số nguyên tố'

Exec kiemtrasnt 4
GO
--g--
DROP PROCEDURE IF EXISTS tongsnt_mn
GO
CREATE PROCEDURE tongsnt_mn @m int, @n int
AS	
	Declare @tong int
	Declare @dem int
	Declare @i int
	SET @dem = 0
	SET @i = @m
	SET @tong = 0
	WHILE (@i <= @n)
	BEGIN
		Declare @check int
		SET @check = 0
		Exec @check = kiemtrasnt @i 
		IF (@check = 1)
		BEGIN
			SET @tong = @tong + @i
		END	
		SET @i = @i + 1
	END
	Print @tong

Exec tongsnt_mn 2,5
GO
--h--
DROP PROCEDURE IF EXISTS ucln
GO
CREATE PROCEDURE ucln @m int, @n int
AS	
	IF (@m = 0 OR @n = 0)
		RETURN @m + @n

	Declare @temp int
	SET @temp = 0
	WHILE (@n != 0)
	BEGIN
		SET @temp = @m%@n
		SET @m = @n
		SET @n = @temp
	END
	RETURN @m

Declare @ucln int
Exec @ucln = ucln 2,5
Print @ucln
GO
--i--
DROP PROCEDURE IF EXISTS bcnn
GO
CREATE PROCEDURE bcnn @m int, @n int
AS	
	Declare @lcm int
	Declare @mul int
	Declare @gcd int
	Exec @gcd = ucln @m,@n
	SET @mul = @m * @n
	SET @lcm = @mul / @gcd
	RETURN @lcm


Declare @bcnn int
Exec @bcnn = bcnn 2,5
Print @bcnn
GO
--j--
DROP PROCEDURE IF EXISTS dsgv
GO
CREATE PROCEDURE dsgv 
AS	
	SELECT * FROM GIAOVIEN

Exec dsgv
GO
--k--
DROP PROCEDURE IF EXISTS sl_dt_gv
GO
CREATE PROCEDURE sl_dt_gv 
AS	
	SELECT GV.MAGV, GV.HOTEN, COUNT(DISTINCT TG.MADT) 
	FROM GIAOVIEN AS GV, THAMGIADT AS TG 
	WHERE TG.MAGV = GV.MAGV 
	GROUP BY GV.MAGV, GV.HOTEN

Exec sl_dt_gv
GO
--l--
DROP PROCEDURE IF EXISTS ttct
GO
CREATE PROCEDURE ttct @MAGV char(3)
AS	
	Declare @HOTEN nvarchar(30)
	Declare @LUONG int
	Declare @PHAI nvarchar(3)
	Declare @NGAYSINH datetime
	Declare @DIACHI nvarchar(50)
	Declare @SLDT int
	Declare @SLTN int

	SELECT @HOTEN = HOTEN, @LUONG = LUONG, @PHAI = PHAI, @NGAYSINH = NGSINH, @DIACHI = DIACHI 
	FROM GIAOVIEN 
	WHERE MAGV = @MAGV

	SELECT @SLDT = COUNT(TG.MADT)
	FROM GIAOVIEN AS GV, THAMGIADT AS TG
	WHERE TG.MAGV = GV.MAGV

	SELECT @SLTN = COUNT(NT.TEN)
	FROM GIAOVIEN AS GV, NGUOITHAN AS NT
	WHERE NT.MAGV = GV.MAGV

	Print N'Họ tên: ' + @HOTEN
	Print N'Lương: ' + CONVERT (VARCHAR(100), @LUONG)
	Print N'Phái: ' + @PHAI
	Print N'Ngày sinh: ' + CONVERT (VARCHAR(100), @NGAYSINH)
	Print N'Địa chỉ: ' + @DIACHI
	Print N'Số lượng đề tài: ' + CONVERT (VARCHAR(100), @SLDT)
	Print N'Số lượng thân nhân: ' + CONVERT (VARCHAR(100), @SLTN)

Exec ttct '001'
GO
--m--
DROP PROCEDURE IF EXISTS kiemtra_tontai_gv
GO
CREATE PROCEDURE kiemtra_tontai_gv @MAGV char(3), @check int out
AS	
	IF EXISTS (SELECT * FROM GIAOVIEN WHERE MAGV = @MAGV)
		BEGIN
			Print N'Tồn tại giáo viên ' + @MAGV
			SET @check = 1
		END
	ELSE
	BEGIN
		Print N'Không tồn tại giáo viên ' + @MAGV
		SET @check = 0
	END
Declare @check_tmp int
Exec kiemtra_tontai_gv '001', @check_tmp out
GO

--n--
DROP PROCEDURE IF EXISTS sp_n
GO
CREATE PROCEDURE sp_n @MAGV char(3), @check int out
AS
BEGIN
	SET @check = 0

	IF (EXISTS(
		SELECT DISTINCT GV1.*, DT1.TENDT
		FROM GIAOVIEN AS GV1
		JOIN THAMGIADT AS TG1
		ON TG1.MAGV = GV1.MAGV
		LEFT JOIN DETAI AS DT1
		ON TG1.MADT = DT1.MADT
		LEFT JOIN GIAOVIEN AS GV2
		ON DT1.GVCNDT = GV2.MAGV
		WHERE GV1.MABM = GV2.MABM
		AND GV1.MAGV = @MAGV
	))
	BEGIN
		PRINT 'Giao vien thoa dieu kien'
		SET @check = 1
	END
	ELSE
	BEGIN
		PRINT 'Giao vien khong thoa dieu kien'
		SET @check = 0
	END
END
GO

DECLARE @temp int
Exec sp_n '001', @temp out
print @temp

--o--
DROP PROCEDURE IF EXISTS sp_o
GO
CREATE PROCEDURE sp_o @MAGV char(3), @MADT char(3), @STT char(3), @time int
AS
BEGIN
	DECLARE @check1 int
	DECLARE @check2 int
	DECLARE @check3 int
	SET @check1 = 0
	SET @check2 = 0
	SET @check3 = 0
	EXEC sp_n @MAGV, @check1
	Exec kiemtra_tontai_gv @MAGV, @check2 out
	IF(EXISTS(
		SELECT *
		FROM CONGVIEC
		WHERE CONGVIEC.MADT = @MADT
		AND CONGVIEC.STT = @STT
	))
		SET @check3 = 1
	ELSE
		SET @check3 = 0
	IF(@check1 = 1 AND @check2 = 1 AND @check3 = 1)
	BEGIN
		INSERT INTO THAMGIADT VALUES
		(@MAGV, @MADT, @STT, NULL, NULL)
	END
END
GO

--Qp--
DROP PROCEDURE IF EXISTS sp_p
GO
CREATE PROCEDURE sp_p @MAGV char(3)
AS
BEGIN
	BEGIN TRY
		DELETE FROM GIAOVIEN WHERE GIAOVIEN.MAGV = @MAGV
	END TRY
	BEGIN CATCH
		PRINT 'Error'
	END CATCH
END
GO

EXEC sp_p '001'

--Qq--
DROP PROCEDURE IF EXISTS sp_q
GO
CREATE PROCEDURE sp_q @MAGV char(3)
AS
BEGIN
	DECLARE @hoten nvarchar(100)
	DECLARE @luong int
	DECLARE @phai nvarchar(3)
	DECLARE @ngaysinh date
	DECLARE @sldt int
	DECLARE @slnt int
	DECLARE @diachi nvarchar (50)
	DECLARE @sgv int

	SELECT @hoten = GIAOVIEN.HOTEN, @luong = GIAOVIEN.LUONG, 
		@phai = GIAOVIEN.PHAI, @ngaysinh = GIAOVIEN.NGSINH, 
		@diachi = GIAOVIEN.DIACHI
	FROM GIAOVIEN
	WHERE GIAOVIEN.MAGV = @MAGV
	
	SELECT @sldt = COUNT(DISTINCT THAMGIADT.MADT)
	FROM GIAOVIEN
	LEFT JOIN THAMGIADT
	ON GIAOVIEN.MAGV = THAMGIADT.MAGV
	WHERE GIAOVIEN.MAGV = @MAGV
	GROUP BY GIAOVIEN.MAGV, GIAOVIEN.HOTEN

	SELECT @slnt = COUNT(DISTINCT NGUOITHAN.TEN)
	FROM GIAOVIEN
	LEFT JOIN NGUOITHAN
	ON GIAOVIEN.MAGV = NGUOITHAN.MAGV
	WHERE GIAOVIEN.MAGV = @MAGV

	SELECT @sgv = COUNT(GV2.MAGV)
	FROM GIAOVIEN AS GV1
	LEFT JOIN GIAOVIEN AS GV2
	ON GV1.MAGV = GV2.GVQLCM
	WHERE GV1.MAGV = @MAGV
	GROUP BY GV1.MAGV

	print 'Ho ten: ' + @hoten
	print 'Gioi tinh: ' + @phai
	print 'Ngay sinh: ' + CONVERT(VARCHAR(100), @ngaysinh)
	print 'Dia chi: ' + @diachi
	print 'So luong de tai: ' + CONVERT(VARCHAR(1000), @sldt)
	print 'So luong nguoi than: ' + CONVERT(VARCHAR(1000), @slnt)
	print 'So luong giao vien dang quan ly: ' + CONVERT(VARCHAR(1000), @sgv)
END
GO

exec sp_q '001'

--Qr--
DROP PROCEDURE IF EXISTS sp_r
GO
CREATE PROCEDURE sp_r @MAGV1 char(3), @MAGV2 char(3)
AS
BEGIN
	DECLARE @matruongbomon char(3)
	DECLARE @luong1 float
	DECLARE @luong2 float

	SELECT @luong1 = GV.LUONG
	FROM GIAOVIEN AS GV
	WHERE GV.MAGV = @MAGV1

	SELECT @luong2 = GV.LUONG
	FROM GIAOVIEN AS GV
	WHERE GV.MAGV = @MAGV2

	SELECT @matruongbomon = GV2.MAGV
	FROM GIAOVIEN AS GV1
	LEFT JOIN BOMON AS BM1
	ON GV1.MABM = BM1.MABM
	LEFT JOIN GIAOVIEN AS GV2
	ON BM1.TRUONGBM = GV2.MAGV
	WHERE GV1.MAGV = @MAGV2

	IF (@matruongbomon = @MAGV1 AND @luong1 > @luong2)
		print N'Lương đúng quy định'
	IF (@matruongbomon = @MAGV1 AND @luong1 <= @luong2)
		print N'Lương không đúng quy định'
	IF (@matruongbomon = @MAGV2 AND @luong2 > @luong1)
		print N'Lương đúng quy định'
	IF (@matruongbomon = @MAGV2 AND @luong1 >= @luong2)
		print N'Lương không đúng quy định'
END
GO

EXEC sp_r '001', '009'
EXEC sp_r '002', '003'

--Qs--
DROP PROCEDURE IF EXISTS sp_s
GO
CREATE PROCEDURE sp_s @MAGV char(5), @HOTEN nvarchar(40), @LUONG float, @PHAI nvarchar(3), @NGSINH date, @DIACHI nvarchar(50), @GVQLCM char(5), @MABM char(5)
AS
BEGIN
	DECLARE @check1 int
	DECLARE @check2 int
	DECLARE @check3 int
	SET @check1 = 0
	SET @check2 = 0
	SET @check3 = 0
	IF(NOT EXISTS(SELECT GIAOVIEN.HOTEN FROM GIAOVIEN WHERE GIAOVIEN.HOTEN = @HOTEN))
	BEGIN
		SET @check1 = 1
	END
	ELSE
	BEGIN
		PRINT N'Trùng tên'
	END

	IF(2023 - YEAR(@NGSINH) >= 18)
	BEGIN
		SET @check2 = 1
	END
	ELSE
	BEGIN
		PRINT N'Nhỏ hơn 18 tuổi'
	END
	IF(@LUONG > 0)
	BEGIN
		SET @check3 = 1
	END
	ELSE
	BEGIN
		PRINT N'Lương âm'
	END

	IF(@check1 = 1 AND @check2 = 1 AND @check3 = 1)
	BEGIN
		INSERT INTO GIAOVIEN VALUES
		(@MAGV, @HOTEN, @LUONG, @PHAI, @NGSINH, @DIACHI, @GVQLCM, @MABM)
	END
END
GO

EXEC sp_s '011', N'Nguyễn Hoài An', -1, N'Nam', '2010-02-15', N'25/3 Lạc Long Quân, Q.10, TP HCM', NULL, NULL
EXEC sp_s '011', N'Âu Dương Khang', 1700, N'Nam', '2003-10-28', N'1106/4 Lạc Long Quân, Q.TB, TP HCM', NULL, 'CNTT'

--Qt--
DROP PROCEDURE IF EXISTS sp_t
GO
CREATE PROCEDURE sp_t @HOTEN nvarchar(40), @LUONG float, @PHAI nvarchar(3), @NGSINH date, @DIACHI nvarchar(50), @GVQLCM char(5), @MABM char(5)
AS
BEGIN
    DECLARE @MaGiaoVien CHAR(3)
    DECLARE @MaxMaGiaoVien CHAR(3)
    SET @MaxMaGiaoVien = (SELECT MAX(GIAOVIEN.MAGV) FROM GIAOVIEN)

    IF @MaxMaGiaoVien IS NULL
        SET @MaGiaoVien = '001'
    ELSE
        SET @MaGiaoVien = RIGHT('000' + CAST((CAST(@MaxMaGiaoVien AS INT) + 1) AS VARCHAR(3)), 3)

    INSERT INTO GIAOVIEN VALUES (@MaGiaoVien, @HOTEN, @LUONG, @PHAI, @NGSINH, @DIACHI, @GVQLCM, @MABM)
END
GO
EXEC sp_t N'Võ Thu Trang', 1800, N'Nữ', '2003-06-20', N'Bảo Lộc, Lâm Đồng', NULL, 'VS'