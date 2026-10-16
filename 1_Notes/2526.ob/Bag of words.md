2025-08-09 16:39

Tags: 

-----------------------

> [!PDF|] [[Basic_ML_colored.pdf#page=87&selection=104,0,110,25|Basic_ML_colored, p.75]]
> > Chúng ta hẳn đã tự đặt ra các câu hỏi: với một văn bản, vector đặc trưng sẽ có dạng như thế nào? Làm sao đưa các từ, các câu, đoạn văn ở dạng text trong các văn bản về một vector mà mỗi phần tử là một số?

##### BoW(Bag of words) trong NLP  

^2bd9e0

Mục tiêu cốt lõi của mô hình Bag-of-Words là **chuyển đổi dữ liệu văn bản phi cấu trúc thành một định dạng số học (vector) mà máy tính có thể hiểu và xử lý được**. *(feature extraction)*

Mô hình này được xử dụng đặc biệt nhiều trong NLP, truy vấn thông tin, đặc biệt là phân loại văn bản

Các bước hoạt động của mô hình ^2ced4a
1. ***Tokenization*** *(chuẩn hóa và tách từ)*: Văn bản chuyển sang chữ thường, bỏ dấu câu và stop words (?fc) *(là, của, và,...)*  -> Tách thành dang sách các từ riêng
2. ***Xây dựng vocabulary:*** Tạo bộ từ điển chứa tất cả các từ duy nhất xuất hiện trong data
3. ***Vectorization:*** Mỗi văn bản/câu được biểu diễn dưới một vector số. *Đó chính là mảng tần suất của các từ trong từ điển*

Tuy vậy, có các nhược điểm:
- Mất thông tin về thứ tự
- Kích thước vector lớn và thưa thớt *(vector có phần tử = 0 - spare vector)*
  > *Do khi tạo từ điển, số lượng từ là rất lớn mà trong một câu/văn bản thì chỉ có một subset nhỏ của vocab -> Sinh ra nhiều spare vector 
  > -> Tốn kém*
- Khả năng xử lý từ đồng nghĩa / từ hiếm / từ không có trong từ điển kém

##### BoW trong computer vision
Giống NLP: **biến một hình ảnh phức tạp thành một vector số đơn giản bằng cách coi nó như một "túi" chứa các "từ vựng hình ảnh" mà không quan tâm đến vị trí của chúng.**

> [!PDF|] [[Basic_ML_colored.pdf#page=89&selection=35,0,40,45|Basic_ML_colored, p.77]]
> > Ví dụ 1: Có hai class ảnh, một class là ảnh các khu rừng, một class là ảnh các sa mạc. Giả sử ta biết rằng một bức ảnh chỉ thuộc một trong hai loại này, việc phân loại một bức ảnh là rừng hay sa mạc một cách trực quan nhất là dựa vào màu sắc. Màu xanh lục nhiều thì là rừng, màu đỏ và vàng nhiều thì là sa mạc. 

> *Ví dụ trên cơ bản là đếm một cái ảnh có bao nhiêu giá trị xanh, đỏ, vàng, so sánh và tra cứu rồi kết luận từ trong từ điển*
> => *Đây là một cách làm rất ngây ngô, đếm các điểm dựa trên tần xuất xuất hiện của bức ảnh đó. Nó giống với điểm yếu của BoW trong NLP*

> [!PDF|] [[Basic_ML_colored.pdf#page=89&selection=93,0,99,21|Basic_ML_colored, p.77]]
> > Ví dụ 2: Trên thực tế, các bài toán xử lý ảnh không đơn giản như Ví dụ 1 trên đây. Mắt người thực ra nhạy với các đường nét, hình dáng hơn là màu sắc. Chúng ta có thể nhận biết được một bức ảnh có cây hay không ngay cả khi bức ảnh đó không có màu. Vì vậy, xem xét giá trị từng điểm ảnh một không mang lại kết quả khả quan vì lượng thông tin về đường nét bị mất quá nhiều.

Thay vì xem từng pixel, ta xét từng vùng của ảnh *(gọi là patch)* chứa các bộ phận có thể mô tả được vật thể trong ảnh.

> Q: *Nhưng khi đối chiếu từ điển, làm sao mình biết được 2 patch là giống nhau?*
> A: *2 Patch KHÔNG thể giống nhau đến từng pixel được, cái đó mình đo bằng $\Delta$ euclide giữa 2 patch. Nếu $\Delta$ đủ nhỏ thì sẽ đc coi là giống*


Ở đây có thể áp dụng [[K-means clustering]] để phân nhóm ^557ec1

![[Bag of words 2025-09-14 17.51.47.excalidraw]]

