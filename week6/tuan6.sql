﻿USE QLGiaoVien
--Q58--
SELECT GV.HOTEN
FROM THAMGIADT AS TGDT1, GIAOVIEN AS GV, DETAI AS DT
WHERE TGDT1.MAGV = GV.MAGV AND TGDT1.MADT = DT.MADT AND NOT EXISTS ( 
																	(SELECT CD.MACD 
																	FROM CHUDE AS CD) 
																	EXCEPT
																	(SELECT DT2.MACD
																	 FROM THAMGIADT AS TGDT2, DETAI AS DT2
																	 WHERE TGDT2.MAGV = TGDT1.MAGV AND TGDT2.MADT = DT2.MADT)
)
--Q59--
SELECT DT1.TENDT
FROM DETAI AS DT1
WHERE NOT EXISTS (
				  (SELECT MAGV
				   FROM GIAOVIEN
				   WHERE MABM='HTTT') EXCEPT	
											(SELECT TG.MAGV
											 FROM DETAI AS DT2, THAMGIADT AS TG
											 WHERE TG.MADT = DT1.MADT)
)
--Q60--
SELECT DT1.TENDT
FROM DETAI AS DT1
WHERE NOT EXISTS (
				  (SELECT GV.MAGV
				   FROM GIAOVIEN AS GV, BOMON AS BM
				   WHERE GV.MABM = BM.MABM AND BM.TENBM = N'Hệ thống thông tin') EXCEPT	
																					   (SELECT TG.MAGV
																					    FROM DETAI AS DT2, THAMGIADT AS TG
																					    WHERE TG.MADT = DT1.MADT)

)
--Q61--
SELECT DISTINCT GV.HOTEN
FROM THAMGIADT AS TGDT1, GIAOVIEN AS GV, DETAI AS DT
WHERE TGDT1.MAGV = GV.MAGV AND TGDT1.MADT = DT.MADT AND NOT EXISTS ( 
																	(SELECT MADT
																	FROM DETAI
																	WHERE MACD = 'QLGD'
																	) 
																	EXCEPT
																	(SELECT TGDT2.MADT
																	 FROM THAMGIADT AS TGDT2, DETAI AS DT2
																	 WHERE TGDT2.MAGV = TGDT1.MAGV AND TGDT2.MADT = DT2.MADT AND DT2.MACD = 'QLGD')
)
--Q62--
SELECT DISTINCT GV1.HOTEN
FROM THAMGIADT AS TG1, GIAOVIEN AS GV1
WHERE TG1.MAGV = GV1.MAGV AND GV1.HOTEN != N'Trần Trà Hương'  AND NOT EXISTS (
																			  (SELECT MADT
																			   FROM THAMGIADT AS TG2, GIAOVIEN AS GV2
																			   WHERE TG2.MAGV = GV2.MAGV AND GV2.HOTEN = N'Trần Trà Hương') 
																			   EXCEPT	
																			   (SELECT TG3.MADT
																				FROM THAMGIADT AS TG3
																				WHERE TG3.MAGV = TG1.MAGV)
)
--Q63--
SELECT DT.TENDT
FROM THAMGIADT AS TG, DETAI AS DT
WHERE DT.MADT= TG.MADT AND TG.MAGV IN (SELECT GV1.MAGV
									   FROM GIAOVIEN AS GV1, BOMON AS BM1
									   WHERE GV1.MABM = BM1.MABM AND BM1.TENBM = N'Hóa hữu cơ')
GROUP BY DT.TENDT
HAVING COUNT (DISTINCT TG.MAGV)= (
SELECT COUNT (GV1.MAGV)
FROM GIAOVIEN AS GV1, BOMON AS BM1
WHERE GV1.MABM = BM1.MABM AND BM1.TENBM = N'Hóa hữu cơ'
)
--Q64--
SELECT GV.HOTEN
FROM THAMGIADT AS TG, GIAOVIEN AS GV
WHERE TG.MAGV = GV.MAGV AND TG.MADT = '006'
GROUP BY GV.HOTEN
HAVING COUNT (TG.MAGV) = (SELECT COUNT (CV.TENCV)
						  FROM CONGVIEC AS CV
						  WHERE CV.MADT = '006'
)
--Q65--
SELECT TG.MAGV
FROM THAMGIADT AS TG
WHERE TG.MADT IN (SELECT DT.MADT
				  FROM DETAI AS DT, CHUDE AS CD 
				  WHERE DT.MACD = CD.MACD AND CD.TENCD = N'Ứng dụng công nghệ')
GROUP BY TG.MAGV
HAVING COUNT (DISTINCT TG.MADT) = (
SELECT COUNT (DISTINCT DT.MADT)
FROM DETAI AS DT, CHUDE AS CD
WHERE DT.MACD = CD.MACD AND CD.TENCD = N'Ứng dụng công nghệ'
)

--Q66--
SELECT GV.HOTEN
FROM THAMGIADT AS TG, GIAOVIEN AS GV
WHERE TG.MAGV = GV.MAGV AND GV.HOTEN !=  N'Trần Trà Hương' AND TG.MADT IN (SELECT DT.MADT
																		   FROM DETAI AS DT, GIAOVIEN AS GV
																		   WHERE DT.GVCNDT = GV.MAGV AND GV.HOTEN = N'Trần Trà Hương'
)
GROUP BY GV.HOTEN
HAVING COUNT (DISTINCT TG.MADT) = (SELECT COUNT (DISTINCT DT.MADT)
								   FROM DETAI AS DT, GIAOVIEN AS GV
								   WHERE DT.GVCNDT = GV.MAGV AND GV.HOTEN = N'Trần Trà Hương'
)
--Q67--
SELECT DT.TENDT
FROM THAMGIADT AS TG, DETAI AS DT
WHERE TG.MADT = DT.MADT AND TG.MAGV IN (SELECT GV.MAGV 
										FROM  GIAOVIEN AS GV, BOMON AS BM, KHOA AS K
										WHERE GV.MABM = BM.MABM AND BM.MAKHOA = K.MAKHOA AND K.TENKHOA = N'Công nghệ thông tin')
GROUP BY DT.TENDT
HAVING COUNT (DISTINCT TG.MAGV) = (
SELECT COUNT (DISTINCT GV.MAGV)
FROM GIAOVIEN AS GV, BOMON AS BM, KHOA AS K
WHERE GV.MABM = BM.MABM AND GV.MABM IN (SELECT BM.MABM 
										FROM  BOMON AS BM, KHOA AS K
										WHERE BM.MAKHOA = K.MAKHOA AND K.TENKHOA =  N'Công nghệ thông tin')
)
--Q68--
SELECT GV.HOTEN
FROM THAMGIADT AS TG, GIAOVIEN AS GV, DETAI AS DT
WHERE TG.MAGV = GV.MAGV AND TG.MADT = DT.MADT AND TG.MADT IN (SELECT DT.MADT
															  FROM DETAI AS DT, CONGVIEC AS CV
															  WHERE CV.MADT = DT.MADT AND DT.TENDT = N'Nghiên cứu tế bào gốc')
GROUP BY GV.HOTEN
HAVING COUNT (TG.MAGV) = (SELECT COUNT (CV.TENCV)
						  FROM CONGVIEC AS CV, DETAI AS DT
						  WHERE CV.MADT = DT.MADT AND DT.TENDT = N'Nghiên cứu tế bào gốc'
)
--Q69--
SELECT GV.HOTEN
FROM THAMGIADT AS TG, GIAOVIEN AS GV, DETAI AS DT
WHERE TG.MAGV = GV.MAGV AND TG.MADT = DT.MADT AND TG.MADT IN (SELECT DT.MADT
															  FROM DETAI AS DT
															  WHERE DT.KINHPHI > 100)
GROUP BY GV.HOTEN
HAVING COUNT (DISTINCT TG.MADT) = (SELECT COUNT (DISTINCT DT.MADT)
								   FROM DETAI AS DT
								   WHERE DT.KINHPHI > 100
)
--Q70--
SELECT DT.TENDT
FROM THAMGIADT AS TG, DETAI AS DT
WHERE TG.MADT = DT.MADT AND TG.MAGV IN (SELECT GV.MAGV 
										FROM  GIAOVIEN AS GV, BOMON AS BM, KHOA AS K
										WHERE GV.MABM = BM.MABM AND BM.MAKHOA = K.MAKHOA AND K.TENKHOA = N'Sinh học')
GROUP BY DT.TENDT
HAVING COUNT (DISTINCT TG.MAGV) = (
SELECT COUNT (DISTINCT GV.MAGV)
FROM GIAOVIEN AS GV, BOMON AS BM, KHOA AS K
WHERE GV.MABM = BM.MABM AND GV.MABM IN (SELECT BM.MABM 
										FROM  BOMON AS BM, KHOA AS K
										WHERE BM.MAKHOA = K.MAKHOA AND K.TENKHOA =  N'Sinh học')
)
--Q71--
SELECT GV.MAGV, GV.HOTEN, GV.NGSINH
FROM THAMGIADT AS TG, GIAOVIEN AS GV, DETAI AS DT
WHERE TG.MAGV = GV.MAGV AND TG.MADT = DT.MADT AND TG.MADT IN (SELECT DT.MADT
															  FROM DETAI AS DT, CONGVIEC AS CV
															  WHERE CV.MADT = DT.MADT AND DT.TENDT = N'Ứng dụng hóa học xanh')
GROUP BY GV.MAGV, GV.HOTEN, GV.NGSINH
HAVING COUNT (TG.MAGV) = (SELECT COUNT (CV.TENCV)
						  FROM CONGVIEC AS CV, DETAI AS DT
						  WHERE CV.MADT = DT.MADT AND DT.TENDT = N'Ứng dụng hóa học xanh'
)
--Q72--
SELECT GV.MAGV, GV.HOTEN, BM.TENBM, GVQLCM.GVQLCM
FROM THAMGIADT AS TG, GIAOVIEN AS GV, GIAOVIEN AS GVQLCM, BOMON AS BM
WHERE TG.MAGV= GV.MAGV AND GVQLCM.GVQLCM = GV.MAGV AND GV.MABM = BM.MABM AND TG.MADT IN (SELECT DT.MADT
																						 FROM DETAI AS DT, CHUDE AS CD 
																						 WHERE DT.MACD = CD.MACD AND CD.TENCD = N'Nghiên cứu phát triển')
GROUP BY GV.MAGV,GV.HOTEN,BM.TENBM,GVQLCM.GVQLCM
HAVING COUNT (DISTINCT TG.MADT) = (
SELECT COUNT (DISTINCT DT.MADT)
FROM DETAI AS DT, CHUDE AS CD
WHERE DT.MACD = CD.MACD AND CD.TENCD = N'Nghiên cứu phát triển'
)

