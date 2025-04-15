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
## 1.Bảng giảng viên
MaGV(FK)
![image](https://github.com/user-attachments/assets/4eb64bee-8b5b-42ea-b502-646862f7cc64)
## 2.Bảng lớp học
MaLop(PK)
![image](https://github.com/user-attachments/assets/c999b787-15f4-4ed5-971b-a7533b58699a)
## 3.Bảng môn học
MaMon(PK)
![image](https://github.com/user-attachments/assets/c2b0f313-5db5-4cfe-9306-ed67e6fba447)
## 4.Bảng phòng học
MaPhong(PK)
![image](https://github.com/user-attachments/assets/48517e7c-6948-42f7-8ee1-b990b9d9d578)
## 5.Bảng quy định tiết
Tiet(PK)
![image](https://github.com/user-attachments/assets/8f3a93d9-698f-46df-8cb1-689db7254bc6)
## 6. Bảng tiết học
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
## 7.Thêm thông tin cho các bảng
Truy cập vào TMS.tnut.edu.vn để lấy dữ liệu
![image](https://github.com/user-attachments/assets/bdf56cce-d636-4d91-9f17-80d642398d7f)
Coppy các dữ liệu cần dùng cho vào excel
![image](https://github.com/user-attachments/assets/ccd2dc7e-87cb-4b4a-aa7c-94441c4c4e23)
Để tên giáo viên không bị trùng lặp: lick vào cột GV ->chọn Data -> chọn Remove Duplicates
Sau đó thêm cột MaGV 
![image](https://github.com/user-attachments/assets/b46f8acd-7d75-4b96-9d4c-33add1d5b495)
![image](https://github.com/user-attachments/assets/e80339f3-d514-4762-b664-1132a2df9d4b)



