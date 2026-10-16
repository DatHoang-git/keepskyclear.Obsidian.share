---
created: 2026-07-07
tags:
  - "#lecture_note"
  - summarized
category:
  - "[[Class]]"
subject:
  - "[[Class. Xử lý ngôn ngữ tự nhiên - INT3406]]"
---
---
/src:
[[Lecture 1. Introduction (2).pdf]]

![[XLNNTN - Buổi 1 .excalidraw|100%]]

>[!tldr] *Tổng quan về NLP, cụ thể:*
>*1. Nó là cái gì, mục tiêu của nó là gì*
>*2. Nó bao gồm những phần nào, những ứng dụng gì*
>*3. Các vấn đề chính trong NLP*
>*4. Biểu diễn ngôn ngữ tự nhiên như thế nào để cho máy hiểu?*

# Giới thiệu
***Định nghĩa:*** NLP là ngành có sự kết hợp của CS + AI + Linguistic (Ngôn ngữ học)

>[!important] ***Mục tiêu***:
>Cho máy "hiểu" được ngôn ngữ tự nhiên để nó có thể hoàn thành các tác vụ mà mình yêu cầu
>Để làm được điều đó thì cần "Fully UNDERSTAND and REPRESENT the MEANING of the language"

# Các thành phần / ứng dụng của NLP
![[3_Assets/XLNNTN - Buổi 1 .excalidraw.md#^frame=01|100%]]
Bao gồm 2 phần chính: 
##### ***[[NLG - Natural Language Generation]]*** - "Nghe / Đọc"
Sinh ngôn ngữ tự nhiên, quá trình chuyển từ dữ liệu có cấu trúc từ máy tính thành NNTN cho con người đọc hiểu

##### ***[[NLU - Natural Language Understanding]]*** - "Nói / Viết"
Quá trình dịch từ ngôn ngữ con người sang ngôn ngữ máy để ***hiểu ý định (intent) và ngữ cảnh***, các kỹ thuật:
- **Tokenization** - Tách từ: Cắt các chuỗi văn bản thành cụm lẻ
- **POS Tagging** - Gán nhãn *từ loại*: Xác định từ loại dựa trên ngữ cảnh
- **NER** - Named Entity Recognition: Xác định và *phân loại các thực thể (tên người, tổ chức, địa điểm,...)*
- **Parsing** - Phân tích cú pháp: Xác định cấu trúc ngữ pháp
- **Stemming & Lemmatization**: Đưa các biến thể của từ về dạng gốc
  *(2 cái này khác gì nhau? Stemming chặt cụt (was -> wa), Lemmatization chuyển về dạng nguyên thủy (was -> be))*

##### Các ứng dụng thực tế: 
1. ***Sentiment Analysis*** - Phân tích quan điểm: Quét văn bản để *==xác định thái độ==* là tích cực / tiêu cực / trung lập. Từ đó xem KH khen hay chê nhờ đọc review, theo dõi...
2. ***Conversational AI*** - Chatbot
3. ***Dịch máy*** - Machine translation
4. ***Information Retrival & Extraction*** - Tìm kiếm / trích xuất thông tin: Hiểu ý định tìm kiếm của người dùng, trả về nội dung tìm kiếm
5. ***Text Summarization*** - Tóm tắt văn bản
6. ***Classification*** - Phân loại văn bản


