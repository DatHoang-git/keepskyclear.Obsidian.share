
## 1. Motivations

Sau thời gian dài trải nghiệm nhiều công cụ (e.g. Notion,...) và nghe theo các kols Notion trên utube, mình thấy là đẹp thì đẹp thật đấy, nma: **càng cố tạo cây thư mục nhiều tầng lớp hay trang trí màu mè, friction khi ghi chép càng lớn**. Như mình thì mất khoảng 80% thời gian để nghĩ xem nhét note vào đâu, kéo thả ra sao, thay vì tập trung vào việc tiếp thu và ghi chú kiến thức.

>*nhưng mà obsidian còn phức tạp hơn? khó dùng vl. Đúng là khó hơn, cần một thời gian đầu tìm hiểu, nhưng mình vẫn sài vì nó tối ưu tốt cái workflow của mình, và có thể tùy biến tùy thích. Khi quen rồi thì mình thấy rất happy với nó*

Vì vậy, mình xây obsidian của mình dựa trên 3 nguyên tắc tối giản:

1. **Lưu trữ phẳng (Flat storage):** Không phân cấp thư mục con phức tạp. Mọi note mới mặc định đều nằm ở `1_Notes`, mọi hình ảnh/tài liệu đính kèm kéo thả vào đều tự động rơi vào `3_Assets` (đã cấu hình sẵn trong `app.json`). Cần ghi chép là mở ra viết ngay.
2. **Tổ chức bằng liên kết & Dataview:** Thay vì dùng thư mục để gom file, mình dùng **Frontmatter (Metadata) + Dataview query + Wikilinks**. `[[link like this]]`. Mình thấy cách này hợp lý, vì đây là cách kết nối kiến thức tốt - cross domain giữa các chủ đề / ý tưởng / môn học... 
   *Một khái niệm có thể thuộc nhiều môn học, nhiều context khác nhau*
Để thực hiện hóa điều này, xem phần [[Super User's Manual#2. Mô hình Schema|thiết kế schema ở dưới]]
---

## 2. Mô hình Schema 
> Phần này tận dụng tính năng Properties trong Obsidian

![[Super User's Manual .excalidraw|1000]]

* **Category (`7_Categories`) – Thuộc tính bắt buộc:**
  * **Mỗi note đều bắt buộc phải có một `category` nhất định.**
  * Đây là phân loại chức năng cấp cao nhất của vault: `Class`, `Lab`, `Skill`, `Reference` (tài liệu tham khảo), `Life`, `Review` (đánh giá tuần/tháng), `Thoughts` (suy nghĩ cá nhân), `Agents` (AI/công cụ).
  * Mỗi file Category chứa sẵn bảng Dataview có query động để tự động tổng hợp toàn bộ các note thuộc nhóm đó.
>*Đây là các khía cạnh mình muốn ghi chép, riêng phần Agents là do Agents viết và chứa ở đây. Mình thấy trend ngta sài obsidian + claude cũng hay, nhưng muốn nó ở trong một cái sandbox tách biệt, tránh AI slop*

* **Subject (`11_Subjects`) – Gom cụm theo môn học / chuyên đề:**
  * Dùng khi muốn gom các note có chung một ngữ cảnh kiến thức (ví dụ: `Class. Mạng máy tính`, `NLP - Natural Language Processing`).
  * Subject không nhất thiết bị bó cứng vào một category nào, nhiệm vụ chính của nó là làm "trạm trung chuyển" (MOC - Map of Content) cho một khối kiến thức.

* **Project (`9_Projects`) – Dự án / Mục tiêu hành động:**
  * Cấp bao quát cao nhất phục vụ cho một đầu việc cụ thể (ví dụ: bài tập lớn môn học, đề tài NCKH, cuộc thi, dự án cá nhân).
  * **Một Project có thể chứa nhiều Subject và nhiều Note độc lập.**

* **Note (`1_Notes`) - atomic notes:**
  * Tất cả các bài học hàng ngày, tóm tắt paper, ý tưởng rời rạc đều nằm tại đây.
  * Chỉ cần khai báo `category`, `subject` hoặc `project` trong Frontmatter, note sẽ tự động hiển thị trong bảng truy vấn của trang tổng tương ứng.

---

## 3. Usecase Thực Tế

### Use 1: Bắt đầu một Môn học mới / Chủ đề mới
*Giả sử kỳ này bạn bắt đầu học môn "Mạng máy tính - INT2213":*

1. **Tạo Note tổng môn học:**
   * Tạo file tại thư mục `11_Subjects/` với định dạng tên: `Class. Mạng máy tính - INT2213.md`.
   * Nhấn `Ctrl + T`, chọn template `subject _ NewClass.md`.
   * Điền thông tin: Mã LHP, số tín chỉ, giảng viên... Note này đã có sẵn khung Syllabus, nơi đính kèm Slide, mục Ôn thi GK/CK, file Canvas mindmap (`[[this.canvas]]`) và một bảng Dataview chờ sẵn.
2. **Ghi chép từng buổi học (Lecture notes):**
   * Trong giờ học, nhấn tạo note mới (file tự động nằm trong `1_Notes/`). *(nhấn Ctrl + N cho khỏe, điền ttin vào là xong, cứ thế mà viết)*
   * Nhấn `Ctrl + T`, chọn template `lecture_note.md`.
   * Điền Frontmatter:
     ```yaml
     ---
     created: "2026-10-16"
     tags:
       - "#lecture_note"
     category:
       - "[[Class]]"
     subject:
       - "[[Class. Mạng máy tính - INT2213]]"
     ---
     ```
   * **Kết quả:** Bài học này sẽ lập tức tự động xuất hiện trong bảng mục lục của môn học ở `11_Subjects` mà bạn không cần phải copy link hay kéo thả file thủ công.

>[!tip]
>1. ***Phần điền cái trường ttin kia phải ở dạng wikilinks `[[]]`, khi mà điền quen rồi nó sẽ tự rcm cho mình***
>2. Mục đích của việc tạo template đó chính ra ấn định sẵn các trường thông tin nào cho các loại note như nào. **TEMPLATE RẤT QUAN TRỌNG**

### Use 2: Khởi tạo một Dự án mới (Project / Nghiên cứu / Đồ án)

1. **Tạo Note dự án:**
   * Tạo file mới trong thư mục `9_Projects/Tên dự án.md` (ví dụ: `ConnectX - Bài giữa kì môn AI.md` hoặc `NCKH2026 - Viện AI.md`).
   * Nhấn `Ctrl + T`, chọn template `project.md`.
   * Khai báo ngày bắt đầu (`day_start`), trạng thái (`status: "[[In progress]]"`), và `category` (thường là `[[Lab]]` hoặc `[[Skill]]`).
2. **Liên kết các công việc và tài liệu:**
   * Khi viết bất kỳ ghi chú, giải thuật hay biên bản họp nào trong `1_Notes/`, chỉ cần thêm vào Frontmatter trường:
     ```yaml
     project:
       - "[[Tên dự án]]"
     ```
   * Bảng Dataview trong trang dự án sẽ tự động lọc và hiển thị tất cả các tài liệu, bài học từ `1_Notes` và `11_Subjects` liên quan đến dự án đó.

---

### Ca 3: Đọc, Tra cứu & Comment Tài liệu tham khảo / Paper

1. **Đọc và Comment trực tiếp trên tài liệu (PDF / Hình ảnh):**
   * Kéo file PDF vào bài viết (file sẽ tự động được lưu an toàn trong `3_Assets/`).
   * Bôi đen đoạn nội dung hoặc trang tài liệu cần ghi chú, nhấn tổ hợp phím `Ctrl + Alt + H` (plugin **Hi-note**) để mở cửa sổ bình luận trực tiếp. Bạn có thể ghi chú suy nghĩ, phản biện ngay cạnh văn bản gốc mà không làm sửa đổi file PDF.
1. **Tích hợp Zotero (Dành cho ai làm nghiên cứu chuyên sâu):**
   * Hệ thống đã tích hợp sẵn workflow đồng bộ 1-click từ Zotero sang Obsidian thông qua **Zotero Desktop Connector** và **Citation** (`Ctrl + Shift + Z` để trích xuất metadata và highlight bài báo theo template `zotero_master`).
  ***phần zotero hơi niche nên ai quan tâm thì ib mình chỉ cho nha <3***

ok

## 4. Bảng Phím Tắt (Hotkeys) theo Ca Sử Dụng

Dưới đây là các phím tắt đã được cấu hình tối ưu sẵn trong vault, chia theo đúng 3 ngữ cảnh sử dụng:

### Nhóm 1: Thao tác & Soạn thảo hàng ngày
| Phím tắt | Chức năng | Mô tả chi tiết |
| :--- | :--- | :--- |
| `Ctrl + T` | **Insert Template** | Chèn nhanh các mẫu ghi chú (lecture note, project, subject...) |
| `Ctrl + .` | **Toggle Source Mode** | Chuyển đổi nhanh giữa chế độ Live Preview và Source Mode (mã nguồn) |
| `Ctrl + Shift + D` | **Daily Note** | Mở hoặc tạo trang nhật ký ghi chép cho ngày hôm nay |
| `Ctrl + Shift + C` | **Insert Codeblock** | Chèn nhanh khối mã nguồn (code block) |
| `Ctrl + Shift + M` | **Insert Mathblock** | Chèn công thức toán dạng khối (`$$ ... $$`) |
| `Ctrl + M` | **Toggle Inline Math** | Bật/tắt công thức toán nội dòng (`$ ... $`) |
| `Ctrl + Shift + E` | **Excalidraw Embed** | Tự động tạo và nhúng ngay một bản vẽ Excalidraw vào note hiện tại |
| `Ctrl + Alt + E` | **Toggle Excalidraw View**| Chuyển đổi qua lại giữa giao diện bảng vẽ và mã nguồn Markdown |
| `Alt + H` | **Toggle Highlight** | Đánh dấu / tô sáng đoạn văn bản đang chọn |
| `Alt + D` | **Unhighlight** | Xóa đánh dấu tô sáng |
| `Ctrl + Alt + R` | **Highlight Red** | Tô sáng màu đỏ đoạn văn bản quan trọng |

### Nhóm 2: Điều hướng, Tìm kiếm & Quản lý Chủ đề
| Phím tắt | Chức năng | Mô tả chi tiết |
| :--- | :--- | :--- |
| `Ctrl + O` | **Quick Switcher** | Mở ô tìm kiếm để nhảy ngay đến bất kỳ file nào trong vault |
| `Ctrl + Shift + F` | **Omnisearch** | Tìm kiếm thông minh toàn văn (tìm cả nội dung trong PDF và hình ảnh) |
| `Ctrl + Shift + G` | **Open Local Graph** | Mở đồ thị liên kết cục bộ xung quanh note đang mở |
| `Ctrl + G` | **Open Graph View** | Mở đồ thị tổng quan toàn bộ mạng lưới kiến thức của vault |
| `Ctrl + Shift + O` | **Dynamic Outline** | Bật/tắt thanh mục lục (Outline) ở cạnh phải màn hình |
| `Ctrl + Alt + S` | **Toggle Stacked Tabs**| Bật/tắt chế độ duyệt tab xếp tầng (Stacked Tabs) |

### Nhóm 3: Đọc, Comment & Xử lý Tài liệu tham khảo
| Phím tắt | Chức năng | Mô tả chi tiết |
| :--- | :--- | :--- |
| `Ctrl + Alt + H` | **Hi-note Comment** | Mở bảng bình luận để ghi chú trực tiếp lên file PDF / văn bản |
| `Ctrl + Alt + C` | **Insert Citation** | Chèn trích dẫn Markdown chuẩn từ thư viện tài liệu tham khảo |
| `Ctrl + Shift + Z` | **Zotero Extraction** | Trích xuất toàn bộ metadata, ghi chú từ Zotero qua `zotero_master` |

---

## 5. Tips

1. **Đừng sợ note bị lộn xộn:** Việc gom hết note vào `1_Notes` có thể khiến bạn cảm thấy hơi nhiều file, nhưng Obsidian sinh ra để tìm kiếm bằng từ khóa (`Ctrl + O`, `Ctrl + Shift + F`) và liên kết bằng thẻ, chứ không phải để bấm từng thư mục bằng chuột.
2. **Hãy nhất quán với Category:** Khi tạo bất kỳ note nào, hãy dành 2 giây để điền `category: "[[...]]"`. Đây là chìa khóa duy nhất giúp hệ thống của bạn luôn ngăn nắp và truy vấn được mọi lúc.
3. **Khởi đầu đơn giản:** Chỉ cần thuộc 3 phím: `Ctrl + O` (tìm note), `Ctrl + T` (chèn template) và `Ctrl + Shift + E` (vẽ mindmap). Những tính năng nâng cao khác bạn sẽ quen dần trong quá trình học tập

---

## 6. Chia Sẻ Vault & Công Cụ Tự Động Hoá `obsidian-migrate`

### 1. Motivation: Chia sẻ mà riêng tư
Một trong những điểm yếu lớn nhất của Obsidian là tính năng làm việc nhóm/chia sẻ. Toàn bộ ghi chú của mình từ bài học trên lớp (`Class`), nghiên cứu (`Lab`), tài chính - cuộc sống (`Life`), nhật ký suy nghĩ (`Thoughts`) đều nằm chung trong một vault cá nhân.

Nếu copy cả vault để share:
- ❌ Phải lọc cái gì để public cái gì riêng tư
- ❌ Nếu ngồi lọc thủ công từng file thì bất khả thi vì hàng trăm bài giảng liên kết chằng chịt với slide PDF, ảnh paste, sơ đồ Canvas và bản vẽ Excalidraw. Chỉ cần thiếu 1 ảnh là sơ đồ bị vỡ.

### 2. App mình vibe code `obsidian-migrate`
Để giải quyết triệt để, mình đã tự code một công cụ CLI Python chuyên dụng mang tên **`obsidian-migrate`** (mã nguồn mở tại GitHub: [DatHoang-git/obsidian-migrate](https://github.com/DatHoang-git/obsidian-migrate) hoặc local tại `/mnt/lamviec/obsidian-migrate`).

#### Cơ chế hoạt động:
- **Nhận diện Class Seeds mở rộng:** Tự động quét và gom toàn bộ các note môn học (`category: "[[Class]]"`) và TẤT CẢ các bài học có liên kết trỏ tới môn học đó (`subject: - "[[Class...]]"`).
- **Mở rộng 1-hop dependencies:** Tự động truy vết và kéo theo toàn bộ các tài liệu được liên kết trực tiếp (slide PDF, ghi chú liên quan, tài liệu tham khảo).
- **Phân tích sâu Canvas & Excalidraw:** Quét xuyên qua cấu trúc JSON của file `.canvas` và mã nguồn Markdown của `.excalidraw.md` để lôi ra mọi hình ảnh dán dở (`Pasted Image...`), đảm bảo khi sang vault mới thì mọi bản vẽ đều hiển thị hoàn hảo.
- **Giữ nguyên cấu hình Obsidian:** Tự động copy và đồng bộ toàn bộ `.obsidian/` (plugins, theme, hotkeys, workspace) để người nhận mở ra là dùng được ngay.

### 3. Cách chạy công cụ để cập nhật Vault chia sẻ
Mỗi khi mình học xong một kỳ hoặc cập nhật thêm bài giảng mới vào vault cá nhân, mình chỉ cần chạy một dòng lệnh duy nhất trong terminal:

```bash
python3 /mnt/lamviec/obsidian-migrate/obsidian-migrate \
    /mnt/lamviec/keepskyclear.Obsidian \
    /mnt/lamviec/keepskyclear.Obsidian.share \
    --force --include-obsidian --verbose
```

Toàn bộ bài học, tài liệu môn học và cấu hình sẽ được tự động lọc, làm sạch và đồng bộ sang `keepskyclear.Obsidian.share` mà không đụng chạm hay rò rỉ bất kỳ thông tin cá nhân nào!


