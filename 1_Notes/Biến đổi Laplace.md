---
created: 2026-05-22
tags:
  - summarized
category:
  - "[[Class]]"
subject:
  - "[[Class. Tín hiệu và hệ thống - ELT2035]]"
---
---
\src:
[[Biến đổi Laplace 2026-05-22 07.52.59.excalidraw]]
[[Luyện tập biến đổi Laplace.excalidraw]]
[[Slide_7_laplace_p2.pdf]]
[[Slide_7_VI_bdLaplace ngươc.pdf]]
[[1_SnS_Ch4_P1.pdf]]

>[!important] Biến đổi Laplace chính là tổng quát hóa [[Biểu diễn Fourier|biến đổi Fourier]]
>Ở bên Fourier có [[Biểu diễn Fourier#Điều kiện tồn tại biểu diễn fourier|điều kiện khả tích]] thì mới có thể chuỗi hóa *(TH liên tục)* và biến đổi *(TH rời rạc)*
>Nhưng những tín hiệu ***LIÊN TỤC*** ko đảm bảo đk khả tích thì sao? 
>=> ***Laplace***
>
>Biến đổi Fourier chỉ là một trường hợp của biến đổi Laplace *(ở phần liên tục)*

Bản chất của nó là phép biến đổi tín hiệu từ miền thời gian sang miền tần số phức ($s$), áp dụng một ***hệ số kìm hãm***  để đảm bảo phép toán ***hội tụ*** (nằm trong vùng ROC), với mục đích cốt lõi là đại số hóa các [[Biểu diễn hệ thống liên tục trong miền thời gian#Biểu diễn dưới dạng phương trình vi phân|PTVP]] phức tạp và xử lý gọn các điều kiện ban đầu của hệ thống. 

Nó làm các việc kiểu như sau *(i mean các dạng bài tập)*:
- Biến đổi [[Biểu diễn hệ thống rời rạc trong miền thời gian#Đáp ứng xung|đáp ứng xung]] $\to$ [[Biến đổi Laplace#Hàm truyền|Hàm truyền]]
- Đề cho PTVP biểu diễn hệ thống $\to$ Hàm truyền 
  *(Laplace đại số hóa được PTVP, từ đó ta có đc pt đại số từ đó suy ra đc hàm truyền)* 
  $\to$ *(có thể chuyển về)* Đáp ứng xung 

# Biến đổi Laplace
Để cho dễ hình dung và đi vào vấn đề, mình sẽ mapping từ Fourier sang Laplace
![[3_Assets/Biến đổi Laplace 2026-05-22 07.52.59.excalidraw.md#^frame=qEZ4TiQ2|100%]]
Đặc trưng: Dùng một biến để "kìm hãm", ép nó hội tụ ở một miền xác định ([[Biến đổi Laplace#Miền hội tụ - ROC|ROC]])
Nếu trong Fourier chỉ xét đến tần số thực ($\omega$) thì Laplace xét cả cái biến "kìm hãm" đó nữa $s = \sigma + j \omega$
Ta có công thức biến đổi

###### ***Laplace thuận*** (Miền $t\to s$):
>$$ X(s) = \int_{0^-}^\infty x(t) e^{-st}dt $$

*(Lưu ý: Đây là biến đổi một phía, thường thì ta hay xét cái này vì áp vào trong thực tế, kết quả không thể xảy ra trước nguyên nhân - dòng điện không tự nhiên chạy qua trước khi bật công tắc, vì vậy $\forall t<0, x(t)=0$ nên ta ko xét. 
Nếu trong trường hợp nó **đã có gì** trc đó rồi, ta chỉ xét cận dưới $0^-$ ("gom toàn bộ quá khứ"), nhét thẳng đk ban đầu vào PTVP: $\mathcal{L}\{f'(t)\} = sF(s) - f(0^-)$*

###### ***Laplace nghịch*** (Miền $s \to t$):
>$$ x(t) = \frac{1}{2\pi j} \int_{\sigma - j\infty}^{\sigma 0+j\infty} X(s)e^{st}ds$$

Chạy dọc theo trục tung từ $-j\infty$ đến $+j\infty$. Đây không phải là tích phân hàm thực thông thường, mà là **tích phân đường trong mặt phẳng phức***

>[!Attention] !
>99% các bài toán ko bắt tự giải tay tích phân phức tạp, khó vl
>Ta phân tích thằng phân thức đơn giản:
>$$X(s)= \frac{s+1}{(s+2)(s+3)} = \dots$$
>Từ đó dùng [[Biến đổi Laplace#Bảng biến đổi Laplace|bảng]] để tra cứu

# Các khái niệm của biến đổi Laplace
Đồ thị ***biên độ trong mặt phẳng phức***:
- Mặt phẳng phức: Là cái "sàn" 2D của biến $s = \sigma + j \omega$
- Biên độ: Độ cao của đồ thị, giá trị tuyệt đối $|H(s)|$
![[Biến đổi Laplace 2026-06-24 10.12.57.excalidraw|100%]]

### Bảng biến đổi Laplace
| **Hàm thời gian f(t)** | **Hàm Laplace F(s)**                  | **Tên gọi (Ý nghĩa)**                |
| ---------------------- | ------------------------------------- | ------------------------------------ |
| $\delta(t)$            | $1$                                   | Xung Dirac (Cú búa đập tức thời)     |
| $u(t)$ hoặc $1$        | $\frac{1}{s}$                         | Bước nhảy đơn vị (Bật công tắc điện) |
| $t$                    | $\frac{1}{s^2}$                       | Hàm dốc (Ramp - Tăng dần đều)        |
| $t^n$                  | $\frac{n!}{s^{n+1}}$                  | Đa thức (với $n$ là số nguyên dương) |
| $e^{at}$               | $\frac{1}{s - a}$                     | Hàm mũ (Tắt dần hoặc bùng nổ)        |
| $\sin(\omega t)$       | $\frac{\omega}{s^2 + \omega^2}$       | Sóng dao động điều hòa               |
| $\cos(\omega t)$       | $\frac{s}{s^2 + \omega^2}$            | Sóng dao động điều hòa               |
| $e^{at}\sin(\omega t)$ | $\frac{\omega}{(s - a)^2 + \omega^2}$ | Dao động tắt dần (Giảm xóc)          |
| $e^{at}\cos(\omega t)$ | $\frac{s - a}{(s - a)^2 + \omega^2}$  | Dao động tắt dần (Giảm xóc)          |
### Hàm truyền
Hàm truyền chính là đáp ứng xung ở miền tần số
$$
H(s) = \frac{\text{Đầu ra Y(s)}}{\text{Đầu vào X(s)}} = \frac{\text{Tử số (s)}}{\text{Mẫu số(s)}}
$$
Trong đó:
- Nghiệm của tử số gọi là [[Biến đổi Laplace#Điểm không|điểm không]]
- Nghiệm của mẫu số gọi là [[Biến đổi Laplace#Điểm cực|điểm cực]]

>[!attention] Chú ý:
>Viết như công thức trên chớ có hiểu lầm rằng
>*"Nghiệm của mẫu số = Nghiệm của đầu vào $X(s)$"*
>
>Viết như vậy chỉ để ***định nghĩa mối quan hệ***, sau khi chia ra, biến đổi thì mới hiện được tử số và mẫu số, khi đó mới biết được điểm cực và điểm không
### Miền hội tụ - ROC
>aka *Region Of Convergence*

Đây là một khoảng giá trị của $s$ để đảm bảo cho biến đổi Laplace hội tụ
Ta xác định nó bằng [[Biến đổi Laplace#Điểm cực - Poles|điểm cực]] *(hình dung nó cứ như cực trị hồi c3, xác định r xét sự biến thiên)*
![[Biến đổi Laplace 2026-06-24 13.51.57.excalidraw|2000]]
##### Điểm cực - Poles
Là điểm dẫn tới biên độ Hàm truyền bùng nổ $H(s)\to \infty$
##### Điểm không - Zeros
Là điểm dẫn tới biên độ Hàm truyền = 0 ($H(s) = 0$)

>[!note] i
>Nhìn vào cách lấy cận tích phân, ta có thể biết luôn được nó sẽ lấy như nào
>- $\int_{a}^\infty$ - Nhân quả: Lấy phần ngoài cùng nhất ***bên phải***
>- $\int_{-\infty}^{a}$ - Phản nhân quả: Lấy phần ngoài cùng nhất ***bên trái***
>- $\int_{-\infty}^{+\infty}$ - Hai phía: Phần giao nhau của 2 thằng trên

>[!important] Xác định tính chất hệ thống ở miền tần số
>Ta xác định tính chất hệ thống ở miền tần số như thế nào? $\to$ ***Xét ROC***
>- Tính nhân quả *(như trên)*
>- Tính ổn định *(trục ảo $j\omega$ nằm trọn trong vùng ROC)*
# Các tính chất biến đổi Laplace
![[Biến đổi Laplace 2026-06-24 15.57.45.excalidraw|1000]]

# Bảng biến đổi Laplace
![[Biến đổi Laplace 2026-06-24 15.30.33.excalidraw|1000]]

# Bài tập
BT Cô Mai (src c Hành):[docs.google.com/document/d/1nkxzegnBsgY7WxEpc-7k\_k4EHO2QFdcc/edit](https://docs.google.com/document/d/1nkxzegnBsgY7WxEpc-7k_k4EHO2QFdcc/edit)

[[Biến đổi Laplace 2026-06-25 12.45.20.excalidraw|Bài 4.1]]
[[Biến đổi Laplace 2026-06-25 13.09.22.excalidraw|Bài 4.2]]
[[Biến đổi Laplace 2026-06-25 17.27.40.excalidraw|Bài 4.3]]
[[Biến đổi Laplace 2026-06-25 17.32.00.excalidraw|Bài 4.5]]
[[Biến đổi Laplace 2026-06-25 19.27.30.excalidraw|Bài 4.7]]
[[Biến đổi Laplace 2026-06-25 18.45.41.excalidraw|Bài 4.8]]
