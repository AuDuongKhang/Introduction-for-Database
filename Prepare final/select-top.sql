﻿-- SU DUNG CSDL-TH: "QUAN LY DE TAI"
USE QLGiaoVien

DROP PROCEDURE sp_select_top
GO

-- Yêu cầu in ra danh sách giáo viên (MaGV, HoTen) theo thứ tự tăng dần MaGV của 1 Bộ môn cụ thể
CREATE PROCEDURE sp_select_top (@MABM nchar(4))
AS
BEGIN

	DECLARE @count int, @i int = 1;

	-- Xác định số dòng dữ liệu trong câu lệnh select
	SELECT @count = count(*)
		FROM GIAOVIEN
		WHERE MABM = @MABM;

	DECLARE @MaGV nchar(10), @TenGV nvarchar(100), @TenBM nvarchar(50);

	-- Lặp cho đến khi tất cả dòng dữ liệu trong câu lệnh select được xử lý hết
	WHILE ( @i <= @count )
	BEGIN
		-- Chọn ra dòng dữ liệu thứ i bằng cú pháp SELECT TOP
		SELECT TOP (@i) @MaGV = MaGV, @TenGV = HOTEN, @TenBM = BM.TENBM
			FROM GIAOVIEN GV, BOMON BM
			WHERE GV.MABM = BM.MABM AND GV.MABM = @MABM
			ORDER BY GV.MaGV;

		-- Thực hiện các xử lý cho những dữ liệu được lấy ra
		print @MaGV + ' : ' + @TenGV + ' @ ' + @TenBM;

		-- Tăng biến đếm i lên 1
		SET @i = @i + 1;
	END
END
GO

-- Gọi hàm thi hành để kiểm tra kết quả

EXEC sp_select_top 'HTTT'
print '-------'
EXEC sp_select_top N'VLĐT'
print '-------'
EXEC sp_select_top 'HPT'