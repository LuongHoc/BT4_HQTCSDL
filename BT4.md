# BT4_HQTCSDL
# Họ và tên: Lương Văn Học - Mssv:K225480106025
# Yêu cầu bài toán:
 - Tạo csdl cho hệ thống TKB (đã nghe giảng, đã xem cách làm)
 - Nguồn dữ liệu: TMS.tnut.edu.vn
 - Tạo các bảng tuỳ ý (3nf)
 - Tạo được query truy vấn ra thông tin gồm 4 cột: họ tên gv, môn dạy, giờ vào lớp, giờ ra.
   trả lời câu hỏi: trong khoảng thời gian từ datetime1 tới datetime2 thì có những gv nào đang bận giảng dạy.
# Gợi ý:
  sử dung tms => dữ liệu thô => tiền xử lý => dữ liệu như ý (3nf)
  tạo các bảng với struct phù hợp
  insert nhiều rows từ excel vào cửa sổ edit dữ liệu 1 table (quan sát thì sẽ làm đc)
# Bài làm:
GiangVien(#MaGV,HoTen)
LopHoc(#MaLop)
MonHoc(#MaMon,TenMon)
PhongHoc(#MaPhong)
QuyDinhTiet(#Tiet,GioVao,GioRa)
TietHoc(#Stt,@MaGV,@MaLop,@MaMon,@MaPhong,Thu,TietBD,SoTiet,NgayHoc)
# 1. Tạo các bảng
## Bảng giảng viên
MaGV(FK)
![image](https://github.com/user-attachments/assets/4eb64bee-8b5b-42ea-b502-646862f7cc64)
## Bảng lớp học
MaLop(PK)
![image](https://github.com/user-attachments/assets/c999b787-15f4-4ed5-971b-a7533b58699a)
## Bảng môn học
MaMon(PK)
![image](https://github.com/user-attachments/assets/c2b0f313-5db5-4cfe-9306-ed67e6fba447)
## Bảng phòng học
MaPhong(PK)
![image](https://github.com/user-attachments/assets/48517e7c-6948-42f7-8ee1-b990b9d9d578)
## Bảng quy định tiết
Tiet(PK)
![image](https://github.com/user-attachments/assets/8f3a93d9-698f-46df-8cb1-689db7254bc6)
## Bảng tiết học
Tiet(PK)
![image](https://github.com/user-attachments/assets/6af9b4a6-706e-40fa-9dc4-04caa204c896)
MaGV(FK): Tham chiếu đến bảng GiangVien liên kết cột MaGV của bảng TietHoc và bảng GiangVien
![image](https://github.com/user-attachments/assets/78a20b3a-a34e-4b2d-aff2-9c1a3fb3f805)
MaLop(FK): Tham chiếu đến bảng LopHoc liên kết cột MaLop của bảng TietHoc và bảng LopHoc
![image](https://github.com/user-attachments/assets/8e4b0c40-0537-49d0-a756-04487ce37881)
MaMon(FK): Tham chiếu đến bảng MonHoc liên kết cột MaMon của bảng TietHoc và bảng MonHoc
![image](https://github.com/user-attachments/assets/683bcc29-6e08-4f4a-b804-5c3102f55d4e)
MaPhong(FK): Tham chiếu đến bảng PhongHoc liên kết cột MaPhong của bảng TietHoc và bảng PhongHoc
![image](https://github.com/user-attachments/assets/ad989059-c283-4f89-82e0-c203fdaf6024)
# 2.Thêm thông tin cho các bảng
Truy cập vào TMS.tnut.edu.vn để lấy dữ liệu
![image](https://github.com/user-attachments/assets/bdf56cce-d636-4d91-9f17-80d642398d7f)
Coppy các dữ liệu cần dùng cho vào excel
![image](https://github.com/user-attachments/assets/ccd2dc7e-87cb-4b4a-aa7c-94441c4c4e23)
Để tên giáo viên không bị trùng lặp: lick vào cột GV ->chọn Data -> chọn Remove Duplicates
Sau đó thêm cột MaGV 
![image](https://github.com/user-attachments/assets/b46f8acd-7d75-4b96-9d4c-33add1d5b495)
![image](https://github.com/user-attachments/assets/782ed0e7-051e-4fe7-8f59-039b435aa430)
# 3.Sao chép dữ liệu và paste vào các bảng
Bảng GiangVien
![image](https://github.com/user-attachments/assets/ce260feb-fba9-42ef-9ea3-4cacea875dfa)
Bảng LopHoc
![image](https://github.com/user-attachments/assets/2949f18d-871a-419c-93fa-a5a87dad10c8)
Bảng MonHoc
![image](https://github.com/user-attachments/assets/cc42d33f-0c32-4eeb-88c6-c592df4d3b3e)
Bảng PhongHoc
![image](https://github.com/user-attachments/assets/3d993553-ff9b-4a71-8420-04007987f338)
Bảng QuyDinhTiet
![image](https://github.com/user-attachments/assets/687e1a47-38ee-4c1b-88ef-da98f787ed68)
Bảng TietHoc
![image](https://github.com/user-attachments/assets/d857551c-c977-4dab-ad4b-d6a65ebdd21d)
# 4.Lệnh truy vấn
```
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
```
Kết quả truy vấn
![image](https://github.com/user-attachments/assets/e27a63fa-1268-4394-92bb-62420cd7811b)


