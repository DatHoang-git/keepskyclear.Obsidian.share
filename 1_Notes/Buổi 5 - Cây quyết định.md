---
created: 2026-10-13
tags:
  - "#lecture_note"
  - summarized
category:
  - "[[Class]]"
subject:
  - "[[Class. Học máy + Machine learning|ML]]"
---
---
/src: 
[[Lecture 5_Decision Tree.pdf]]
[[HW_05.pdf]]
# Cây quyết định
![[Lecture 5_Decision Tree.pdf#page=4&rect=102,22,643,329&color=yellow|Lecture 5_Decision Tree, p.4]]
Có 2 loại node:
- Decision nodes / Root nodes
- Leaf nodes

Hiểu đơn giản là mô hình này hỏi một *chuỗi các câu hỏi có rẽ nhánh*, rồi cuối cùng đưa ra dự đoán ở leaf nodes

# Sài và dùng như nào ?
![[Lecture 5_Decision Tree.pdf#page=12&rect=142,20,570,326&color=yellow|Lecture 5_Decision Tree, p.12]]
> *induction*: suy luận quy nạp (chính là quá trình training)
> *deduction*: áp dụng mô hình tổng quát (chính là inference)

 Các thuật toán được sử dụng để xây dựng decision tree:
 > [!PDF|yellow] [[Lecture 5_Decision Tree.pdf#page=13&selection=4,0,20,12&color=yellow|Lecture 5_Decision Tree, p.13]]
> > Various Algorithms ○ Hunt’s Algorithm (one of the earliest) ○ CART ○ ID3, C4.5 ○ SLIQ, SPRINT
> 
> Hunt là sơ khai, nền tảng, CART / ID3 / C4.5 cải tiến từ Hunt
> Dòng SLIQ, SPRINT thuộc thuật toán chuyên biệt hơn để xử lý data lớn

### Thuật toán Hunt
![[Lecture 5_Decision Tree.pdf#page=18&rect=59,22,675,330&color=yellow|Lecture 5_Decision Tree, p.18]]
> Thuật toán này là thuật toán đệ quy.
1. *Điều kiện dừng*: Nếu all điểm dữ liệu $D_t$ nằm cùng trong 1 nhãn, thì node t thành nút lá
2. *Điều kiện chia*: Nếu thuộc nhiều nhãn, chọn ra một thuộc tính để tách $D_t$ thành các tập nhỏ hơn
3. Tạo một nút con cho mỗi tập con và lặp lại bước 1 cho từng nút con.

>**Vấn đề:** 
>- Đây là một thuật toán mù, chia bừa vì ko biết thuộc tính nào là tốt nhất để chọn
>- Cuối cùng sẽ dẫn tới overfit. Do nó xét đến cả noise cũng bắt buộc phải vào một nhãn nào đó
>  Xem ở [[Lecture 5_Decision Tree.pdf#page=19&rect=57,34,670,381&color=yellow|Lecture 5_Decision Tree, p.19]] đến p27 để xem các quyết định thiết kế khả dụng *(về việc handle các attribute liên tục, xem thêm ở môn Datamining về [[Buổi 3 - Tiền xử lý dữ liệu|rời rạc hóa]])*

Hướng giải quyết:
1. Thiết kế sao cho xác định đc node tốt để chọn. (dựa vào việc tính [[Buổi 5 - Cây quyết định#CART (Gini)|Gini]] hoặc [[Buổi 5 - Cây quyết định#ID3 (Information Gain / Entropy)|IF / Entropy]])
2. Thêm các cơ chế early stopping / pruning để thêm tính generlization

#### Node Impurity
> Vậy làm sao để biết được node tốt mà chọn? Phải có một cái metric nào đó chứ?
> Ngta thiết kế ra *Purity - Độ "Tinh khiết"*

Node purity là khi người ta nói về *phân phối của nhãn đó*. Ý tưởng là càng lẫn nhiều thì càng tạp (impurity)
![[Lecture 5_Decision Tree.pdf#page=27&rect=115,68,599,201&color=yellow|Lecture 5_Decision Tree, p.27]]

Từ đó tạo được các công thức
>[!note] Gini
>$$Gini \ Index = 1 - \sum_{i=0}^{c-1}p_{i}(t)^2$$
>Trong đó $p_i(t)$ là tần xuất của class $i$ trong node $t$ đó
>Gini = 0 (Tinh khiết = 100% khi $p_k = 1\text{ cho lớp đó, =0 mọi lớp khác}$)
>, và ngược lại

>[!note] Entropy
>$$Entropy = -\sum_{i=0}^{c-1}p_{i}(t)\log_{2}p_{i}(t)$$
>Tư tưởng cũng giống Gini, cũng để đo độ hỗn loanj trong hệ thống thông tin

>[!note] Classification error
>$$Classification error = 1 - max[p_i(t)]$$
>CT này thường để cắt tỉa là chính, ko sài để dựng cây vì thiếu độ nhạy toán học
>*Tại sao ko sài?*
>

#### Information Gain
Có 2 đại lượng:
- $P$: Purity trước khi chia
- $M$: Purity sau khi chia
$$
Gain = P -  M
$$

Dựa vào công thức này, việc tìm ra Split đẹp nhất đã hoàn chỉnh
![[Lecture 5_Decision Tree.pdf#page=30&rect=99,25,606,335&color=yellow|Lecture 5_Decision Tree, p.30]]
Với mỗi lựa chọn khả dụng, ta chỉ cần tính Gain khi mà áp dụng cái split đó để chọn thằng split tốt nhất
### CART (Gini) - Tối thiểu hóa độ vẩn đục
![[Lecture 5_Decision Tree.pdf#page=33&rect=71,141,552,332&color=yellow|Lecture 5_Decision Tree, p.33]]
Công thức này đc gọi là *Weighted Gini*

CART sài công thức này cho mọi phương án chẻ nhánh có thể xảy ra. Cái nào cho $GINI_{split}$ thấp nhất thì được chọn làm nhát chính thức

### ID3 (Information Gain / Entropy) - Tối đa hóa Gain
![[Lecture 5_Decision Tree.pdf#page=38&rect=126,187,591,331&color=yellow|Lecture 5_Decision Tree, p.38]]
Chọn split mà có Gain lớn nhất
CT này sài cho ID3 và C4.5 Decision tree algorithm

*Nhưng có một vấn đề, là khi với [[Lecture 5_Decision Tree.pdf#page=39&rect=35,71,695,393&color=yellow|các TH như kiểu CCCD hoặc ID]], IF Gain sẽ chẻ ra mỗi nhánh con một phần tử. Khi đó Gini của mọi nhánh đều = 0 (Tinh khiết tuyeejt đối), Gain tối đa*

Vì vậy, ta xử lý bằng
![[Lecture 5_Decision Tree.pdf#page=40&rect=146,164,617,326&color=yellow|Lecture 5_Decision Tree, p.40]]
- Điều chỉnh được IF Gain bằng entropy của việc phân tách
- Entropy việc phân tách ($Split \ Info$) càng cao thì phạt càng nặng

# Ưu và nhược
### Ưu
- Dễ dựng, rẻ
- Nhanh classify với các dữ liệu lạ
- Linh hoạt với nhiễu
- Có thể đocj hiểu được (White-box)
- Tự động lojc đặc trưng

### Nhược
Do tính chất tham lam
- Điểm mù với các thuộc tính tương tác chéo (cái mà đứng một mình thì classify dở, nhưng khi xét cùng nhau lại tốt)
- Decision boundery là moojjt đường thẳng, vuông góc với trục tọa độ, ko học được kiểu của đường chéo
  (vì chỉ xét giá trị >, < giá trị nào đó)
  ![[Pasted image 20261013091331.png|486]]


# Appendix
Các câu hỏi trên lớp
>[!question]- *Tại sao người ta thường sài cắt đôi, chứ ko cắt 3 cắt 4...?* ![[Lecture 5_Decision Tree.pdf#page=35&rect=84,34,617,257&color=yellow|Lecture 5_Decision Tree, p.35]] 
>Thực chất chia 3, 4,... làm tăng độ tinh khiết, giảm vẩn đục (Gini)!
>Và chia 2 như trên hình làm tăng độ vẩn đục vì vốn dĩ nó trộn 2 phân phối dữ liệu vào với nhau.
>
>Nhưng tuy nhiên, người ta vẫn chọn chia 2 vì điều đó đảm bảo cho các bước sau có đủ dữ liệu để sài mà chẻ tiếp. Mô hình có thể tiếp tục đào sâu để tìm quy luật
>Nếu chia 3, 4 ngay từ đầu, dữ liệu của mỗi bước sẽ quá ít, khi đó mình duyệt hết cây sẽ xảy ra hiện tượng overfit
>
>Điều này có thể tính toán và đo lường được thông qua [[Lecture 5_Decision Tree.pdf#page=41&rect=37,86,648,324&color=yellow|tính Split Info]], cho biết mức độ phân mảnh của phép cắt


>[!question]- *Dựa vào đây có thể trả lời câu hỏi của việc tại sao ko sài Classification Error*
>Nó chỉ ghi nhận sự cải thiện khi nhát cắt làm thay đổi _lớp chiếm đa số ($max(p_i(t))$)_ của nút. 
>Nếu lớp đa số không đổi (sau khi cắt), nó sẽ đánh giá nhát cắt đó là vô dụng (Information Gain = 0) *Thử tính Gain mà xem*


>[!question]- *Đã gini rồi còn entropy? Biết chọn cái nào???*
>**Gem:** "Dù có những khác biệt về lý thuyết và tính toán, các nghiên cứu thực nghiệm đã chứng minh rằng: Trong khoảng 98% trường hợp, việc dùng Gini hay Entropy tạo ra các cây quyết định gần như y hệt nhau, và chênh lệch hiệu suất (accuracy) hiếm khi vượt quá 2%."
>
>Có vẻ hồi xưa đây là 2 nhánh nghiên cứu riêng:
>- Gini: Từ Thống kê
>- Entropy: Lý thuyết thông tin
>  
>  Tính toán thì Gini nhanh hơn Entropy, vì Entropy sài log 
>  ![[Lecture 5_Decision Tree.pdf#page=45&rect=206,20,527,285&color=yellow|Lecture 5_Decision Tree, p.45]]
>  
>  Cái đáng để tập trung hơn là nhìn đường cong của 2 hàm.
>  - Entropy béo hơn Gini --> Phạt nặng hơn --> Cây tạo bằng entropy sẽ cân bằng và tõe ra nhiều hơn
>  - Cả 2 hàm đều mượt --> Dễ đạo hàm (nhưng DT ko sài GD). Ko như Classification Error (tuyến tính từng khúc)

>[!question]- Biết Số lượng điểm dữ liệu / mẫu huấn luyện là $N$, $2^D$ là kích thước không gian đặc trưng. Khi nào $N>2^D$ và ngược lại? Khi đó decision tree hoạt động như nào?
>1. Khi $N>2^D$ - Dữ liệu dồi dào, đăc trưng ít
>   Mô hình hoạt động ổn định do lặp lại cho cùng một tổ hợp đăc trưng. Khái quát hóa tốt
>2. Khi $N < 2^D$ - Dữ liệu ít, quá nhiều đặc trưng
>   Không gian trạng thái của đặc trưng nở ra siêu nhiều.
>   Decision tree chịu chết vì quá overfitting, học từng cái tiểu tiết. Vì là thuật toán tham lam nên sẽ tìm các đặc trưng ngẫu nhiên để chẻ sao cho tách biệt hoàn hảo từng điểm, học tất cả hạt nhiễu trong tập huấn luyện nhỏ đó


# BTVN
![[Buổi 5 - Cây quyết định .excalidraw]]

![[Buổi 5 - Cây quyết định _0.excalidraw]]

![[Buổi 5 - Cây quyết định _1.excalidraw]]