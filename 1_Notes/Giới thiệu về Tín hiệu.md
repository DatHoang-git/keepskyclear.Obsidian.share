---
created: 2026-03-07
tags:
  - summarized
category: "[[Class]]"
subject:
  - "[[Class. Tín hiệu và hệ thống - ELT2035]]"
---
---
\src:
[[Lấy gốc tín hiệu hệ thống tuần 1, 2 2026-03-07 21.30.06.excalidraw]]
# 1. Tín hiệu
##### KN
Là một đại lượng vật lý mang theo thông tin
Dưới góc độ toán, TH là một hàm số phụ thuộc vào một hoặc nhiều biến số độc lập
##### Phân loại các loại tín hiệu *(Các tính chất -> Từ đó đưa ra phân loại)*
1. Tín hiệu theo thời gian
	- Liên tục: Liên tục về thời gian, liên tục về biên độ
	- Rời rạc: Rời rạc về thời gian, liên tục về biên độ
2. Tín hiệu tương tự: Rời rạc về thời gian và biên độ, thông qua quá trình [[Giới thiệu về Tín hiệu#^686262|lượng tử hóa và lấy mẫu]] ^4dd9bc

##### Các tính chất của tín hiệu
1. Tính chẵn lẻ: 
	- Đối xứng qua Oy -> Chẵn
	- Đối xứng qua Ox -> Lẻ
2. Tính [[Giới thiệu về Tín hiệu#^686262|nhân quả]]: 0 có đầu vào thì k có đầu ra (Xác định qua điểm 0)
$$x(t)=\begin{cases}f(t),&t\ge0\\0,&t<0\end{cases}$$
3. Tính tuần hoàn: Lặp lại sau chu kì T *(sin, cos,...)*
4. Tính xác định / Ngẫu nhiên:
	Ngẫu nhiên là sự không chắc chắc khi nó xảy ra
	Ngẫu nhiên -> Không có hàm toán học để biểu diễn
5. Tín hiệu năng lượng / Công suất
	1. TH Năng lượng:
	   Năng lượng: Tổng bình phương biên độ tín hiệu theo thời gian
	   TH năng lượng chính là năng lượng nhưng hữu hạn $0 < E_x < \infty$
	   $$E = \lim_{T \to \infty} \int_{-T}^{T} |x(t)|^2 dt = \int_{-\infty}^{\infty} |x(t)|^2 dt$$
	   $$E = \lim_{N \to \infty} \sum_{n=-N}^{N} |x[n]|^2 = \sum_{n=-\infty}^{\infty} |x[n]|^2$$
	2. TH Công suất:
	   Công suất: Năng lượng trung bình trong 1 chu kì
	   Tín hiệu công suất: Là công suất nhưng hữu hạn $0<P_x<\infty$
	   $$P = \lim_{T \to \infty} \frac{1}{2T} \int_{-T}^{T} |x(t)|^2 dt$$
	   $$P = \lim_{N \to \infty} \frac{1}{2N+1} \sum_{n=-N}^{N} |x[n]|^2$$

##### Các loại tín hiệu sơ cấp (cơ bản)
1. Xung đơn vị (aka xung $\delta$ - delta)
$$\delta(n) = \begin{cases}
	1 & t = 0 \\
	0 & t \neq 0
	\end{cases}$$
2. TH nhảy bậc đơn vị ($u$)
$$u(t) = \begin{cases}
1 & t\geq 0 \\
0  & t < 0
\end{cases}$$
3. TH dốc đơn vị (Giống với ReLU)
$$r(t) = \begin{cases}
t  & t \geq 0 \\
0  &  t< 0
\end{cases}$$

# 2. Phép toán trên tín hiệu *(Xem các bài tập liên quan)*
![[Lấy gốc tín hiệu hệ thống tuần 1, 2 2026-03-25 22.24.20.excalidraw|1000]]
![[Giải bài tập chương 1 2026-03-26 21.54.06.excalidraw]]

# N. Appendix

| Lượng tử hóa                                       | ![[Pasted image 20260404083903.png\|400]] |
| -------------------------------------------------- | ----------------------------------------- |
| Tính nhân quả                                      | ![[Pasted image 20260404084738.png\|400]] |
| Tại sao lại sử dụng số phức để biểu diễn tín hiệu? | ![[Pasted image 20260404085537.png\|879]] |
| Tính TH năng lượng - Visualized                    | ![[Pasted image 20260404090526.png]]      |
| Các tín hiệu cơ bản                                | ![[Pasted image 20260404091815.png]]      |

^686262