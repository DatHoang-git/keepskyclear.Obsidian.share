---
created: 2026-07-30
tags:
  - ontap
category:
  - "[[Class]]"
subject:
  - "[[Class. Xử lý ngôn ngữ tự nhiên - INT3406|XLNNTN]]"
---
---
# Ôn tập
## N-grams
#### Cách tính
Giả định markov:
![[Lecture 2. N-gram LMs (1).pdf#page=8&rect=14,36,718,290|Lecture 2. N-gram LMs (1), p.8]]
![[Lecture 2. N-gram LMs (1).pdf#page=11&rect=43,194,607,263|Lecture 2. N-gram LMs (1), p.11]]
*(cái ô vuông kia là "...")*

Cách tính dựa vào Bigrams
![[Lecture 2. N-gram LMs (1).pdf#page=16&rect=13,62,715,310|Lecture 2. N-gram LMs (1), p.16]]
Khi đó, cần tính xác suất 1 câu chỉ cần áp dụng chain rule 
![[Lecture 2. N-gram LMs (1).pdf#page=5&rect=43,29,679,73|Lecture 2. N-gram LMs (1), p.5]]
Với các xác suất dài kia được xấp xỉ về Bigrams theo giả định markov

#### Laplace Smoothing
Chỉ đơn giản là thêm 1 cho tất cả ô trong bảng tần suất
![[Lecture 2. N-gram LMs (1).pdf#page=54&rect=112,202,538,305|Lecture 2. N-gram LMs (1), p.54]]

>[!objective] Mục tiêu
>Giảm thiểu trường hợp nhân cho 0 (OOV - Out Of Vocabulary)

#### Cách đo hiệu quả của LMs - Perplexity
![[3_Assets/XLNNTN - Buổi 2 .excalidraw.md#^frame=01|100%]]

#### Nội suy (Interpolation), Backoff, Web-Scale LMs
> *Mình lười*


## Embedding
Ngữ nghĩa được biểu diễn dưới dạng các vector

#### TF-IDF
Term frequency (TF) - Tần suất của từ x trong Corpus
Document frequency (DF) - Số lượng document có chứa từ x
Inverse Document Frequency (IDF) - Đảo ngược lại của DF: Ý nghĩa - Đo độ hiếm của từ
![[Ôn tập NLP _4.excalidraw]]

#### Cách để đo sự đồng nghĩa / sát nhau về ngữ nghĩa của từ
Phụ thuộc vào cách ta so sánh các vector trên, vậy làm sao để đo

Sử dụng Cosine Similarity:
![[Lecture 3. Vector Semantics and Embedding (part 1).pdf#page=43&rect=190,286,446,381|Lecture 3. Vector Semantics and Embedding (part 1), p.43]]
Ý nghĩa:
- Cùng chiều: Đồng nghĩa
- Vuông góc: Độc lập về nghĩa ==không liên quan==
- Trái chiều: Trái nghĩa
- Cùng độ lớn: Cường độ/Sắc thái, hoặc tính bao hàm nhiều hơn 

#### PMI (Pointwise Mutual Information)
>[!important] Note
>Đây là công cụ để ==tạo nên không gian vector==

Nhưng khi đếm theo kiểu pairwise, sẽ xuất hiện các tường hợp dính các từ "thì, là mà, ở,..." chỉ mang tính chất cú pháp, ko mang ngữ nghĩa
![[Lecture 3. Vector Semantics and Embedding (part 1).pdf#page=56&rect=173,29,844,152|Lecture 3. Vector Semantics and Embedding (part 1), p.56]]
>[!i] Cái này hay nè
>*Nhìn công thức tuy hơi khó hiểu, nhưng hãy nhớ về bài toán xác suất, để bốc ngẫu nhiên 3 bạn nam và 5 bạn nữ, ta nhân 3/8 * 5/8. Ở đây cũng thế, cái mẫu số này có ý nghĩa là "nếu bình thường BỐC BỪA, xác suất để 2 từ đó đứng cạnh nhau là bao nhiêu"*

> Trả lời câu hỏi: ***Từ x và từ y có hay đi cạnh nhau nếu chúng độc lập (về mặt xác suất thống kê)*** *(sự xuất hiện của từ này ko cho manh mối về sự xh của từ kia)*

Ý nghĩa con số:
- Số lớn: Liên kết chặt chẽ, thường đi với cụm từ chuyên ngành
  LƯU Ý: Phải cẩn thận với lỗi thiên vị từ hiếm (Rare word bias). Số quá lớn có thể là do nhiễu tần suất thấp.
- Số trung binh: Chỉ mang tính chất liên quan
- Số bé: Ko liên quan (ít hơn ngẫu nhiên)
  Đối với PMI: Số âm = Ít hơn ngẫu nhiên (chúng đẩy nhau/hiếm khi đi cùng).
  Đối với PPMI: Các số âm này bị ép thẳng về 0. Nghĩa là "Không có bằng chứng thống kê cho thấy chúng liên quan = Bỏ qua".

### Neural Language Model
Cụ thể:
- Mỗi từ được index, chứa vector one-hot
- Cho vào một mô hình embedding
- Từ đó cho vào neural network, feed forward và training các thứ -> Cuối cùng ra đc xác suất

#### W2V
![[Lecture 4. Vector Semantics and Embedding (part 2).pdf#page=3&rect=125,97,692,399|Lecture 4. Vector Semantics and Embedding (part 2), p.3]]
Là một phương pháp embedding
Triết lý: DỰ ĐOÁN
Phương pháp: Skip-gram với lấy mẫu âm. Cụ thể:
- Train một bộ phân loại nhị phân để dự đoán từ đi cạnh 1 từ là gì
- Đầu vào: context - Che đi 1 từ trong window đang xét, training dựa vào việc dự đoán từ đó
  Gồm các cặp đi với nhau (word, context) *(eg: apricot-jam, apricot-aardvark)*
  Và gắn với mỗi cặp đó một cặp xác suất 
  ![[Lecture 4. Vector Semantics and Embedding (part 2).pdf#page=18&rect=161,46,480,121|Lecture 4. Vector Semantics and Embedding (part 2), p.18]]
  *(dấu - là lấy mẫu âm)*
- Hàm loss: Tối đa hóa cái cặp (w, c_pos), Tối thiểu hóa cặp (w, c_neg)  ![[Ôn tập NLP _5.excalidraw]]
  
# Pre-training
>Ý tưởng: Train làm sao cho cái model có thể xử lý đa dạng các tác vụ, đa dạng đầu vào khác nhau --> Không cố định ở 1 tác vụ
>*(Để mà cố định 1 tác vụ, thì cần [[Ôn tập NLP#Fine-tuning|Fine-tuning]])*

![[Lecture 10. Pre-training.pdf#page=13&rect=15,67,871,457|Lecture 10. Pre-training, p.13]]
Slide này nói một điều quan trọng về ngữ nghĩa: ***Ngữ nghĩa không chỉ được gói gọn trong 1 từ, mà được ==phân bổ== trong những thằng xung quanh***


# Post-training
#### Fine-tuning
# Giải đề mẫu
[[Quick review NLP 2026.pdf]]

Bài 1:
![[Ôn tập NLP _3.excalidraw]]

Bài 2:
![[Ôn tập NLP _2.excalidraw]]

Bài 3:
![[Ôn tập NLP _1.excalidraw]]

Bài 4:
![[Ôn tập NLP _0.excalidraw]]
Bài 5: ![[Ôn tập NLP .excalidraw]]