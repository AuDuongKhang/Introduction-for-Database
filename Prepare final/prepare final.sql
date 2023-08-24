USE QLGiaoVien
--1--
SELECT BM.MABM, BM.TENBM
FROM GIAOVIEN AS GV, BOMON AS BM, GV_DT AS GVDT
WHERE GV.MABM = BM.MABM AND GVDT.MAGV = GV.MAGV
GROUP BY BM.MABM, BM.TENBM
HAVING COUNT(GVDT.DIENTHOAI) >= ALL (SELECT COUNT(GVDT.DIENTHOAI)
									FROM GV_DT AS GVDT
									GROUP BY GVDT.MAGV)
--2--									
SELECT GV.HOTEN
FROM DETAI AS DT, GIAOVIEN AS GV, THAMGIADT AS TG
WHERE DT.MADT = TG.MADT AND TG.MAGV = GV.MAGV AND TG.MADT IN (SELECT DT.MADT	
															  FROM DETAI AS DT, GIAOVIEN AS GV
															  WHERE DT.GVCNDT = GV.MAGV AND GV.HOTEN = N'Trương Nam Sơn')
GROUP BY GV.HOTEN
HAVING COUNT (DISTINCT DT.MADT) >= 
(SELECT COUNT(DT.MADT)	
 FROM DETAI AS DT, GIAOVIEN AS GV
 WHERE DT.GVCNDT = GV.MAGV AND GV.HOTEN = N'Trương Nam Sơn'
)

--3--
SELECT GV.*
FROM GIAOVIEN AS GV
WHERE GV.MAGV IN(
SELECT GV.MAGV
FROM DETAI AS DT, GIAOVIEN AS GV, THAMGIADT AS TG
WHERE DT.MADT = TG.MADT AND TG.MAGV = GV.MAGV AND TG.MADT IN (SELECT DT.MADT	
															  FROM DETAI AS DT
															  WHERE DT.KINHPHI >=80)
GROUP BY GV.MAGV
HAVING COUNT (DISTINCT DT.MADT) = (SELECT COUNT(DISTINCT TG.MADT)	
									FROM THAMGIADT AS TG
									WHERE TG.MAGV = GV.MAGV
									)
)
--4--


DROP PROCEDURE IF EXISTS spHienThi_DSGV_ThamGia_DeTai
GO

CREATE PROCEDURE spHienThi_DSGV_ThamGia_DeTai @tu_ngay date, @den_ngay date, @check int out
AS
	Declare @madt char(3)
	Declare @i int = 1
	Declare @count int
	Declare @count_dt int = 0
	SET @check = 1;
	IF datediff(y,@tu_ngay,@den_ngay) < 0
	BEGIN
		Print N'Ngày nhập vào không hợp lệ'
		SET @check = 0;
		RETURN @check
	END
	ELSE 
	BEGIN
		IF datediff(m,@tu_ngay,@den_ngay) < 0  
		BEGIN
			Print N'Ngày nhập vào không hợp lệ'
			SET @check = 0;
			RETURN @check
		END
		ELSE 
		BEGIN
			IF datediff(d,@tu_ngay,@den_ngay) < 0
			BEGIN
				Print N'Ngày nhập vào không hợp lệ'
				SET @check = 0;
				RETURN @check
			END
		END
	END

	SELECT @count = count(*)
	FROM DETAI

	WHILE (@i <= @count)
	BEGIN
		SELECT TOP(@i) @madt = DT.MADT
		FROM DETAI AS DT
		WHERE NGAYBD >= @tu_ngay AND NGAYKT <= @den_ngay
		Print @madt
		IF EXISTS (SELECT DT.MADT
				   FROM DETAI AS DT
				   WHERE NGAYBD >= @tu_ngay AND NGAYKT <= @den_ngay)
		BEGIN
			SET @count_dt= @count_dt + 1
		END
		SET @i = @i + 1
	END
	IF @count_dt = 0
	BEGIN
		SET @check = 0
		RETURN @check
	END
	ELSE 
		Print N'Số lượng đề tài thỏa yêu cầu: ' + CONVERT (VARCHAR(100), @count_dt)
	
	

	RETURN @check

Declare @from date, @to date, @check_temp int
Exec spHienThi_DSGV_ThamGia_DeTai '2000-10-12','2021-10-28',@check_temp out
Print @check_temp
GO
