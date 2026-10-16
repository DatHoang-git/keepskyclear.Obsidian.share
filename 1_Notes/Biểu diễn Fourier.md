---
created: 2026-06-23
tags:
  - "#lecture_note"
category:
  - "[[Class]]"
subject:
  - "[[Class. Tín hiệu và hệ thống - ELT2035]]"
---
---
\src:
[[1_SnS_Ch3_P1.pdf]]
[[1_SnS_Ch3_P2.pdf]]
[[1_SnS_Ch3_P3.pdf]]
[[1_SnS_Ch3_P4.pdf]]

[[Slide_5_Fourier_p1.pdf]]
[[Slide_5_Fourier_p2.pdf]]
[[Slide-5_vi_p3-shortversion.pdf]]

[[Luyện tập chương 3 - Biến đổi Fourier]]
[[Week 7 - Biểu diễn tín hiệu trong miền tần số 2026-04-10 09.57.13.excalidraw]]

>[!important] !
>Bài này sẽ học về cách biểu diễn các hệ thống từ *miền thời gian* sang miền tần số. 
>*But how? Fourier said:*
>"Mọi tín hiệu tuần hoàn đều có thể phân tích thành **tổ hợp tuyến tính** của các TH **dạng sin** có **số nguyên lần** tần số cơ bản"
>
>Chia ra làm 2 loại để xử lý, [[Biểu diễn Fourier#Với TH tuần hoàn sử dụng Chuỗi Fourier - Fourier Series|tuần hoàn]] và [[Biểu diễn Fourier#Với TH không tuần toàn Biến đổi Fourier - Fourier Transform|không tuần hoàn]]
>![[3_Assets/Week 7 - Biểu diễn tín hiệu trong miền tần số 2026-04-10 09.57.13.excalidraw.md#^frame=02|100%]]

### Điều kiện tồn tại biểu diễn fourier:
![[Biểu diễn Fourier 2026-06-24 06.46.45.excalidraw]]


# Miền tần số
![[3_Assets/Week 7 - Biểu diễn tín hiệu trong miền tần số 2026-04-10 09.57.13.excalidraw.md#^frame=01|100%]]
Lí do chuyển sang miền tần số:
Để phân tách, phân tích tín hiệu *(nếu tồn tại ở miền thời gian, nó là một mixture của các yếu tố tác động khác nhau)*

### Phổ *(spectrum)*
Miền tần số được xác định bởi các thành phần **tần số** và **biên độ**. Gọi là phổ biên độ và phổ pha
![[3_Assets/Week 7 - Biểu diễn tín hiệu trong miền tần số 2026-04-10 09.57.13.excalidraw.md#^frame=04|100%]]
Nói cách khác, nếu ai đó bảo "em hãy biểu diễn hệ thống này ở miền tần số đi", ngoài việc viết phương trình, thì để vẽ được cần các thông tin của *phổ pha* và *phổ tần số*

>[!important] !
> Đi tìm biểu diễn của hệ thống trên miền tần số chính là đi tìm phổ pha và phổ tần số
> 
> Vẽ đồ thị các hệ số $X[k]$ = Vẽ phổ của tín hiệu = Biểu diễn tín hiệu ở miền tần số

### Bổ túc toán
![[3_Assets/Week 7 - Biểu diễn tín hiệu trong miền tần số 2026-04-10 09.57.13.excalidraw.md#^frame=03|100%]]

# Biểu diễn Fourier 

## Với TH tuần hoàn sử dụng Chuỗi Fourier - *Fourier Serieso*
Áp dụng cho các tín hiệu tuần hoàn với chu kì $\omega$
![[3_Assets/Week 7 - Biểu diễn tín hiệu trong miền tần số 2026-04-10 09.57.13.excalidraw.md#^frame=05|100%]]

> Công thức thủy tổ: $$x(t) = a_{0} + \sum_{k=0}^\infty[a_{k}\cos(k \omega_{0}t)+ b_{k}\sin(k\omega_{0} t)]$$
> Áp dụng *công thức Euler*, ta được các công thức sau:
### Liên tục - FS
Miền ***thời gian***
$$
x(t) = \sum_{k=-\infty} ^\infty X(k) \cdot e^{jk\omega_{0}t}
$$
 Miền ***tần số***
>$$X(k) = \frac{1}{T} \cdot \int _{T} x(t) \cdot e^{-jk\omega_{0} t}dt$$
### Rời rạc - DTFS
Miền ***thời gian***
$$
x[n] = \sum_{K}  X(k) \cdot e^{jk\omega_{0}n}
$$
 Miền ***tần số***
>$$X[k] = \frac{1}{N} \sum_{N} x[n] \cdot e^{-jk\omega_{0}n}$$

### Phổ biên độ và phổ pha
![[Slide_5_Fourier_p1.pdf#page=44&rect=65,50,351,184|Slide_5_Fourier_p1, p.22]]

### Các tính chất của chuỗi Fourier
1. ***Tuyến tính*** (như tính chất [[Giới thiệu về hệ thống#Linear - Hệ thống tuyến tính|tuyến tính của hệ thống]])
2. ***Dịch thời gian***: $x(t-t_{0}) \implies X(k).e^{-j\omega_{0}t_{0}}$
   *(dịch thời gian = dịch pha)*
3. ***Công suất***

###### Định lý Parseval
**Công suất** trung bình của tín hiệu tuần hoàn = Tổng bình phương **các hệ số khai triển** của chuỗi
$$
P(x(t)) = \frac{1}{T} \int_{T} |x(t)|^2dt = \sum_{k = -\infty}^{+\infty} |X(k)|^2 
$$

## Với TH không tuần toàn Biến đổi Fourier - *Fourier Transform*
Với các ***TH không tuần hoàn***, ta coi nó như một tín hiệu có chu kì $T \to \infty$
Khi đó, vạch phổ bị ép vào nhau thành một phổ liên tục
![[3_Assets/Week 7 - Biểu diễn tín hiệu trong miền tần số 2026-04-10 09.57.13.excalidraw.md#^frame=06|100%]]
### Liên tục - FT
Miền ***thời gian***:
$$
x(t) = \frac{1}{2\pi} \int_{\omega=-\infty}^{+\infty} X(\omega)e^{j\omega t}d\omega
$$

Miền ***tần số***
>$$ X(\omega) = \int_{-\infty}^{+\infty} x(t). e^{-j\omega t}dt$$

$X(\omega)$ gọi là biến đổi Fourier của $x(t)$
### Rời rạc - DTFT
Miền ***thời gian***: Rời rạc và không tuần hoàn
$$
 x[n] = \frac{1}{2\pi} \int_{2\pi} X(\omega)e^{j\omega n}d\omega
$$
Miền ***tần số***: Liên tục và tuần hoàn 
$$
X(\omega) = \sum_{n=-\infty}^{\infty} x[n]e^{-j\omega n}
$$


### Phổ tần số và biên độ
![[Slide_5_Fourier_p2.pdf#page=33&rect=71,66,325,183|Slide_5_Fourier_p2, p.15]]

### Tính chất biến đổi Fourier
>[!attention]!
>Rời rạc (ở miền này) $\iff$ Tuần hoàn (ở miền kia)
>Liên tục (ở miền này) $\iff$ Không tuần hoàn (ở miền kia)

###### Điều kiện hội tụ Dirichlet: 
Chỉ ***tồn tại*** biểu diễn tần số của tín hiệu ***ko tuần hoàn*** khi và chỉ khi ***$x(t)$ là tín hiệu năng lượng***
$$
\int_{-\infty}^{+\infty} |x(t)|^2dt < \infty \ OR \ \sum_{-\infty}^\infty | x[n]|^2 < \infty
$$
1. ***Tính tuyến tính***: *Như trên*
2. ***Dịch thời gian***: $x(t-t_{0}) \implies X(\omega) e^{-j\omega t_{0}}$ *(Biến đổi Fourier)*
3. ***Dịch tần số***: $X(\omega-\omega_{0})$ $\implies$ $x(t)e^{j\omega t}$ *(Biến đổi Fourier ngược)*
4. ***Co giãn***: $x(at)$ $\implies$ $\frac{1}{|a|}X\left( \frac{\omega}{a} \right)$
5. ***Đạo hàm trong miền thời gian***: $\frac{dx(t)}{dt} \implies j\omega X(\omega)$
6. ***Đạo hàm trong miền tần số***: $-jtx(t) \implies \frac{d}{d\omega}X(\omega)$

# Bài tập

BT Cô Mai (src c Hành):[docs.google.com/document/d/1vAlrj6NEh1tljxP3t7NUdtamgHLJikeX/edit](https://docs.google.com/document/d/1vAlrj6NEh1tljxP3t7NUdtamgHLJikeX/edit)
[docs.google.com/document/d/120a3n0XbZ4vh-U4LWkARoWW04lmUUQQF/edit?rtpof=true&tab=t.0](https://docs.google.com/document/d/120a3n0XbZ4vh-U4LWkARoWW04lmUUQQF/edit?rtpof=true&tab=t.0)

