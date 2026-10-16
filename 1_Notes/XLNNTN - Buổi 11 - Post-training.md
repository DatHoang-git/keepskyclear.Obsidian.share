---
created: 2026-07-30
tags:
  - "#lecture_note"
category:
  - "[[Class]]"
subject:
  - "[[Class. Xử lý ngôn ngữ tự nhiên - INT3406|XLNNTN]]"
---
---
/src:
[[Lecture 11. Prompting, Fine-Tuning, RLHF.pdf]]

Dạo gần đây, với sự phát triển của AI, data càng ngày càng nhiều -> Xuất hiện sự chuyển dịch từ mô hình ngôn ngữ lớn (LLM) sang một "World Model"

>[!note] World Model
>**hệ thống mô phỏng nội tại** (internal simulator) giúp một AI agent dự đoán những gì sẽ xảy ra tiếp theo trong môi trường, dựa trên trạng thái hiện tại và hành động mà agent đó sắp thực hiện

==> Không chỉ dừng lại ở ngôn ngữ, mà còn xử lý các tác vụ / lưu các không gian ẩn khác nhau để xử lý các tác vụ khác nhau

> Vậy, làm sao để biến từ LLM --> World Model? 
> 1. Zero-shot and Few-shot (FS) In-Context Learning
> 2. Instuction finetuning
> 3. Optimizing for Human preferences (DPO/RLHF)

# In-Context Learning
>LLà khả năng LLM chỉ quan sát một vài ví dụ đầu vào - đầu ra (hoặc chỉ thị) được cung cấp trực tiếp trong chuỗi ngữ cảnh (context window) tại thời điểm suy luận (inference), mà **hoàn toàn không cần tính toán hàm mất mát hay cập nhật trọng số (zero gradient updates)**.
### Few-shot learing
Cho một vài ví dụ vào LMs, cho nó ra kq

### Zero-shot learning
Xuất hiện lần đầu ở GPT-2: Khả năng làm nhiều tác vụ khi **không có ví dụ**, không có sample cho trc, **==không có update gradient==** khi học các tác vụ mới

>Tại sao lại sinh ra khái niệm này? Là người ta ==tìm ra / ĐƯỢC PHÁT HIỆN==?
>Đây như là một ==thuộc tính== tỉ lệ với scale của model, không phải là một tính năng được thiết kế sẵn
>![[Lecture 11. Prompting, Fine-Tuning, RLHF.pdf#page=24&rect=238,9,911,466|Lecture 11. Prompting, Fine-Tuning, RLHF, p.24]]

Nhưng khi đối mặt với các tác vụ phức tạp *(giải toán, lập luận đa bước)* thì LLM gặp khó khăn. Để giải quyết việc này, có các pp sau:

##### Chain-of-thought prompting
Thay vì đưa ra câu trả lời cụt ngủn (sample cho input - output), ta cho thêm vào input (or samples) ==quá trình suy luận== vào model để cải thiện khả năng hiểu. PP này làm tăng kq rõ rệt

***Lưu ý:*** Ban đầu COT prompting được thực hiện bởi CON NGƯỜI, cho trực tiếp qtrinh suy luận vào model. Nhưng tại sao ko cho ==model tự suy luận== qua các bước? --> Bước đầu của

##### Zero-shot Chain-of-thought prompting
>Ý tưởng về COT như trên, nhưng quá trình sinh ra suy luận được LMs TỰ THỰC HIỆN, rồi feed lần lượt vào các bước
>![[Pasted image 20260730113237.png|900]]

Tuy nhiên, vẫn có những điểm hạn chế về 
1. Giới hạn những gì có thể fit vào context
2. Những pp phức tạp hơn cần các bước gradients

# Instruction Finetuning
Các LMs chỉ có gen ra ngôn ngữ, nhưng cái đó chưa đúng với ==ý định của người dùng==

Để kéo output về gần hơn ý định người dùng, ta sử dụng các instruction vào khi train, ==các cặp (instruction, output)== để gen ra được kq sát nhất với ý định người dùng

Thay vì chỉ train trên ngôn ngữ, thì nó train thêm cùng với nhiều, rất nhiều tác vụ khác nhau

Khi đó, ta đánh giá bằng thang đo MMLU *(Massive Multitask Language Understanding)*:
>![[Lecture 11. Prompting, Fine-Tuning, RLHF.pdf#page=43&rect=469,21,884,444|Lecture 11. Prompting, Fine-Tuning, RLHF, p.43]]

> [!tldr] Mục tiêu
> ***Tóm lại:*** Làm sao để LMs gen kq ==đúng ý định của người dùng==

Hạn chế: 
- Rất đắt đỏ để thu thập các golden labels cho các task khác nhau 
==> Vì vậy mấy cái ngành niche, data ko đủ, ko ai giám sát instruction ==> LMs performs badly
- Cho dù đã có instruction, vẫn ko đúng ý con người
- LMs coi các lỗi ở các token là như nhau, nhưng thực tế có những chỗ lỗi nặng hơn các phần còn lại

# Tối ưu hóa cho "human preferences"
Giả sử đang train LMs cho một tác vụ nào đó, làm sao con người có thể giám sát *(con người như một hàm loss luôn)*

### RLHF - Reinforcement Learning from Human Feedback
![[Lecture 11. Prompting, Fine-Tuning, RLHF.pdf#page=58&rect=158,69,816,458|Lecture 11. Prompting, Fine-Tuning, RLHF, p.58]]
Bước đầu: Instruction tuning
Bước 2 + 3: Tối đa hóa cái reward

Có mấy vấn đề: 
- Human is expensive! ==> Ko cho con người vào nữa, mà MÔ HÌNH HÓA cái "thiên hướng (preferences)" của họ, COI NÓ NHƯ LÀ MỘT TASK RIÊNG
- Human thì nhiễu và ko đc căn chỉnh đúng ==> Thay vì rating cụ thể, chuyển thành SO SÁNH 2 CÁI THÔI

![[XLNNTN - Buổi 11 - Post-training .excalidraw]]

Do RL khá phức tạp, online sampling thì chậm, hiệu suất ảnh hưởng bởi siêu tham số
### DPO - Direct Preference Optimization
Là một cách để đơn giản hóa [[XLNNTN - Buổi 11 - Post-training#RLHF - Reinforcement Learning from Human Feedback|RLHF]] thông qua giải quyết bài toán binary classification. **Loại bỏ hoàn toàn bước huấn luyện Mô hình Phần thưởng (Reward Model) riêng biệt và vòng lặp Reinforcement Learning (như PPO).**

Thay vào đó, DPO định hình lại bài toán bằng cách **tái tham số hóa (reparameterize) hàm phần thưởng ngầm định**. Nó trực tiếp tối ưu hóa chính sách của mô hình ngôn ngữ (Language Model Policy) thông qua một hàm mất mát phân loại (binary cross-entropy loss) vô cùng đơn giản, chạy trực tiếp trên tập dữ liệu đánh giá cặp (pairwise preferences) dạng off-line.

Đơn giản, hiệu quả hơn, giống RLHF nhưng ko sài online data

==Hầu hết các LLMs hiện nay dùng DPO==  (opensrc)
Còn lại closesrc có lẽ sài RL/PPO vì có thể mạnh về computation


