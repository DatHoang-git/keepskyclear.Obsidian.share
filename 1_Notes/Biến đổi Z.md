---
created: 2026-05-29
tags:
  - summarized
category:
  - "[[Class]]"
subject:
  - "[[Class. Tín hiệu và hệ thống - ELT2035]]"
---
---
\src:
[[1_SnS_Ch5_P1.pdf]]
[[Biến đổi Z 2026-05-29 11.26.49.excalidraw]]

>[!important] Biến đổi Z chính là [[Biến đổi Laplace]] nhưng cho tín hiệu rời rạc
>Cũng có thể nói là phiên bản khái quát hóa của [[Biểu diễn Fourier#Rời rạc - DTFT|DTFT]]
>Đây chính là thế giới thực, thời gian cứ trôi nhưng máy tính không hiểu được sự liên tục, mà nó chỉ biết [[Giới thiệu về Tín hiệu#^4dd9bc|lấy mẫu (sampling)]]

# Biến đổi Z
Do thời gian không còn liên tục, ta không thể sử dụng phép tích phân nữa
Xuất hiện thêm một biến mới: Chu kỳ lấy mẫu $T_s$ - Là tốc độ lấy mẫu, cứ mỗi $T_s$ giây lại lấy một lần

Để biến từ thời gian liên tục, ta có thể xét thời gian liên tục là n các cột mốc rời rạc:
$$
\huge
\begin{align}
	& t = n \cdot T_{s}  \implies e^{-st} = e^{-s(nT_{s})} = (e^{sT_{s}})^{-n} \\
	& \text{Đặt } z = e^{sT_{s}}
\end{align}
$$

Từ đó, ta được: 
$$
\huge
X(z) = \sum_{n=-\infty}^\infty x[n]z^{-n}
$$
Thay vì quét hàm mũ liên tục $e^{-st}$, thì ta đem từng mẫu $x[n]$ nhân với trọng số $z^{-n}$ rồi cộng tất cả lại

# Các khái niệm của biến đổi Z
### Miền hội tụ - ROC
![[Biến đổi Z 2026-06-24 20.57.14.excalidraw|800]]
ROC không còn là các dải băng chạy từ trái sang phải, mà biến thành các ***hình vành khăn*** hoặc ***hình tròn*** đồng tâm. Các TH:
- **Nhân quả ($n\geq {0})$**: Bung ra ngoài cùng
- **Phản nhân quả** ($n<0$): Chạy ngược vào trong
- **Hai phía**: Giao của 2 thằng trên, tạo hình vành khăn
##### Điểm cực - Poles
Vẫn là các điểm khi mẫu số = 0, làm cho hàm $\to \infty$
##### Điểm không - Zeros
Vẫn vậy thoai, tử số = 0. Hàm $\to$ 0

>[!attention] Cái khác của Z về tính ổn định
>Nếu ở Laplace để xác định tính ổn định thì cần trục ảo nằm trọn vẹn trong ROC
>
>Ở Z thì cần ***MỌI ĐIỂM CỰC NẰM TRONG*** vòng tròn đơn vị $|z| <1$

# Các tính chất của biến đổi 
![[Biến đổi Z 2026-06-24 21.00.05.excalidraw|1000]]

# Bảng biến đổi Z
[[Biến đổi Z 2026-06-24 21.04.28.excalidraw]]
![[3_Assets/Biến đổi Z 2026-06-24 21.04.28.excalidraw.md#^frame=01|100%]]
![[Pasted image 20260624223659.png]]


# Bài tập
BT Cô Mai (src c Hành):
[docs.google.com/document/d/1ycDuNQGe-xa92yrPF0rr7v8C18bDaiSX/edit](https://docs.google.com/document/d/1ycDuNQGe-xa92yrPF0rr7v8C18bDaiSX/edit)
Giải:
[[Biến đổi Z 2026-06-24 23.32.45.excalidraw|Bài 5.1]]
[[Biến đổi Z 2026-06-25 00.30.48.excalidraw|Bài 5.2, 5.3]]
[[Biến đổi Z 2026-06-25 07.16.45.excalidraw|Bài 5.4]]
[[Biến đổi Z 2026-06-25 09.08.21.excalidraw|Bài 5.5]]
[[Biến đổi Z 2026-06-25 09.20.55.excalidraw|Bài 5.6]]
[[Biến đổi Z 2026-06-25 09.48.27.excalidraw|Bài 5.7]]
[[Biến đổi Z 2026-06-25 10.04.09.excalidraw|Bài 5.8]]
[[Biến đổi Z 2026-06-25 10.22.49.excalidraw|Bài 5.9]]