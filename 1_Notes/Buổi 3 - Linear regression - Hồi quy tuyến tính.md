---
created: 2026-09-23
tags:
  - "#lecture_note"
category:
  - "[[Class]]"
subject:
  - "[[Class. Học máy + Machine learning|ML]]"
---
---
/src:
[[Buổi 3 - Linear regression .excalidraw]]
[[HW03-ML.pdf]]
[[Lecture03_Linear Regression.pdf]]

# Học có giám sát
*Đây là định nghĩa sẽ xuyên suốt quá trình học các thuật toán học máy về sau*
![[3_Assets/Buổi 3 - Linear regression .excalidraw.md#^frame=01|100%]]
Dựa vào [[Lecture03_Linear Regression.pdf#page=4&rect=53,14,574,330|định nghĩa]], với đầu vào là tập X, đầu ra là tập Y, data là tập D chứa các mẫu. Mục tiêu là tìm một hàm ánh xạ *f* sao cho $X \to Y$ *(hàm này ko biết rõ được, chỉ có thể tạo ra một hàm **h** có thể xấp xỉ được với f)*

Có 2 yếu tố cần xem xét khi động vào một bài toán ML:
1. Tìm ra một *cách biểu diễn kiến thức* mà ta đã *biết trước* để mô hình có thể sử dụng (vd: grammar, mô hình xác suất) 
2. Tìm ra những ==không gian giả thuyết== *linh hoạt*

> *Tại sao lại cần "linh hoạt"?*
> Không gian giả thuyết nhỏ có **capacity thấp hơn**, nên nguy cơ overfit thấp hơn, nhưng bias cao hơn và dễ underfit.
> Không gian lớn có **capacity cao hơn**, có thể fit quan hệ phức tạp hơn, nhưng variance cao hơn và nguy cơ overfit lớn hơn nếu dữ liệu/regularization không đủ.
> ==> Cần chọn một cái không gian linh hoạt, vừa đủ
>Đây chính là <mark style="background: #FF5582A6;">bias-variance trade-off</mark>
>
> *Vậy làm sao co hẹp nó để tìm một cách ước lượng (hàm h) chính xác hơn?* 
> Dựa vào *prior knowledge*, là các kiến thức về cái miền / cái data đó, có thể được lấy từ bước EDA dữ liệu, domain expertise, nghiên cứu trc đó,...

> [!PDF|red] [[Lecture03_Linear Regression.pdf#page=11&selection=19,0,25,53&color=red|Lecture03_Linear Regression, p.11]]
> > For either case, the key is to  Developing efficient algorithms for finding a Hypothesis that best approximates the target function for fitting the data
> 
> 

# Hồi quy tuyến tính Đơn biến

### Mô hình hóa bài toán
Mục tiêu: Hàm $f$ được ước lượng bằng hàm tuyến tính 
$$
h(x) = ax + b \approx f(x)
$$
Input: 1 số
Output: 1 số
![[3_Assets/Buổi 3 - Linear regression .excalidraw.md#^frame=02|100%]]
**Bài toán:** Tìm $h(x)$ sao cho cái hàm loss $J(w_0, w_1)$ kia là nhỏ nhất --> Quay trở về bài toán tối ưu hóa / tìm cực đại cực tiểu...

>[!tip]- Tại sao lại tìm được hàm MSE ("Mean Square Error") như thế kia? Nó dựa trên giả định nào? Ý nghĩa của hàm này là gì?
>Ý nghĩa của hàm: ![[3_Assets/Buổi 3 - Linear regression .excalidraw.md#^frame=04|100%]]
>
>Nói đôi chút về **noise**, noise được coi là những cái *không nằm trong $x$*, nghĩa là thuần về phân bố và cái tính chất của dữ liệu. $x$ luôn phải theo một cái giả định nào đó. 
>
>Nếu 2 điểm dữ liệu $x$ có cùng một giá trị thì bạn sẽ nghĩ như nào? Là chỉ đơn thuần 2 giá trị giống nhau thôi ư? Thực ra có thể còn do nhiều yếu tố tác động, như cái thứ nhất có thể hôm nay trái gió trở trời, hay bị mẹ gank làm ảnh hưởng đến kq. Người ta gọi đó là **noise** 
>
>Còn MSE dựa trên cái *"residual"*, là sai số của mô hình dự đoán: residual ($e_{i}$) = noise($\epsilon_i$) + error
>- Nếu model đúng hoàn toàn: $e_i=noise$ ($y_i$ nằm trên line)
>- Nếu model có sai khác: $e_i = noise + error$
>
>Vì có noise nên $x$ không xác định duy nhất một giá trị $y$. Thay vào đó, với mỗi $x$, ta xem $(Y|X=x)$ là một biến ngẫu nhiên phân bố quanh giá trị “thật” $(f(x))$. Nếu giả sử noise là Gaussian $(\epsilon\sim N(0,\sigma^2)),$ thì $(Y|X=x\sim N(f(x),\sigma^2)).$ Model $(h(x))$ cố gắng ước lượng mean $(f(x))$ của distribution này. Với giả định các noise IID, likelihood của toàn bộ dataset là *tích likelihood* của từng điểm; maximize Gaussian likelihood tương đương với minimize tổng squared residuals, tức MSE.
>![[3_Assets/Buổi 3 - Linear regression .excalidraw.md#^frame=03|100%]]
>
>
### Bài toán tối ưu hóa 
 Trước hết, ta biến đổi / đạo hàm sao cho nó đơn giản hơn chút
 ![[Lecture03_Linear Regression.pdf#page=17&rect=97,20,622,333&color=red|Lecture03_Linear Regression, p.17]]
 Thuật toán sử dụng để tối ưu hóa: **Gradient Descent**
 ![[3_Assets/Buổi 3 - Linear regression .excalidraw.md#^frame=05|100%]]
![[3_Assets/Buổi 3 - Linear regression .excalidraw.md#^frame=06|100%]]

# Hồi quy tuyến tính Đa biến


```python
print("hello world")
```


# Làm bài tập về nhà
![[Buổi 3 - Linear regression - Hồi quy tuyến tính .excalidraw]]

![[Buổi 3 - Linear regression - Hồi quy tuyến tính _0.excalidraw]]

![[Buổi 3 - Linear regression - Hồi quy tuyến tính _1.excalidraw]]