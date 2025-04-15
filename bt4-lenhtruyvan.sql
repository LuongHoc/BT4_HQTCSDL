CREATE VIEW V_LichDay AS
SELECT 
    GV.HoTen AS HoTenGV,
    MH.TenMon,
    CONVERT(varchar(5), QT1.GioVao, 108) AS GioVao,
    CONVERT(varchar(5), QT2.GioRa, 108) AS GioRa,
    FORMAT(TH.NgayHoc, 'dd-MM-yyyy') AS NgayHoc
FROM TietHoc TH
JOIN GiangVien GV ON TH.MaGV = GV.MaGV
JOIN MonHoc MH ON TH.MaMon = MH.MaMon
JOIN QuyDinhTiet QT1 ON QT1.Tiet = TH.TietBD
JOIN QuyDinhTiet QT2 ON QT2.Tiet = TH.TietBD + TH.SoTiet - 1;

DECLARE @from DATETIME = '2025-03-17 7:30';
DECLARE @to   DATETIME = '2025-03-20 10:00';

SELECT DISTINCT HoTenGV,TenMon,GioVao, GioRa, NgayHoc
FROM V_LichDay
WHERE 
    CAST(CONVERT(datetime, NgayHoc + ' ' + GioVao, 105) AS datetime) <= @to
    AND CAST(CONVERT(datetime, NgayHoc + ' ' + GioRa, 105) AS datetime) >= @from;