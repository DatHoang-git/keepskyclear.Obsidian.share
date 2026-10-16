---
created: 2026-09-07
tags:
  - "#lecture_note"
category:
  - "[[Class]]"
subject:
  - "[[Class. Hệ quản trị cơ sở dữ liệu - INT3202 1]]"
---
---
>[!important] Main Objectives
>Phân biệt DB, DBMS, hệ thống db
> Component của DBMS
> Trace cách SQL queries được chạy qua như thế nào
> Vọc vạch MySQL

/src:
[[L1_DBMS.pdf]]

/BTVN: 
[[DMBS_Lab00_24020060]]

# Khóa này học thêm cái gì? 
Học thêm về kiến trúc DBMS
Queries được xử lý ntn? 
Các khái niệm 
Quản trị, security,...

# Phân biệt các khái niệm
DB: Collection của các data rời rạc
DBMS: Phần mềm quản lý DB (MySQL, PostgreSQL,...)
DB system = DBMS + DB + environment (sofweare+hardware+...)



# Các vấn đề của DBMS
### 1. Xử lý file?
Hai người ghi cùng lúc thì làm ntn?
Rất nhiều phần trùng ...
Truy cập file như nào?
Tích hợp, kết hợp các format khác nhau ntn?...

==> **Làm sao để quản lý?**

>[!tip] Tại sao lại có các loại DBMS khác nhau?
>Vì nó có các set of rules khác nhau, mình chọn DBMS nào vì cái rules đặc thù của nó. Tùy thuộc nhu cầu của mình

# Mục tiêu của DBMS
> **Một cái kiểm soát CHUNG cho data**
- Quản lý truy cập data thông qua một giao diện
- Đảm bảo hiệu quả và độ chính xác
	- hiệu quả: storage org, indexing, optimization,...
	- độ chính 
- QUẢN TRỊ dữ liệu thành MỘT PHẦN của hệ thống

# Có các mức abstraction nào của dữ liệu?
Các mức:
1. Physical
2. Logical *(môn DB học cái này)*
3. View

# Schema and instances
>*Chúng ta nói về relational DB trong môn này*
- Schema: Định nghĩa các MQH, thường ít thay đổi, đặc tả bảng, thuộc tính, kiểu,....
- Instances: TRẠNG THÁI của DB, tại một ĐIỂM THỜI GIAN, có thể thay đổi 

# Ngôn ngữ trên cơ sở dữ liệu
- DDL: Ngôn ngữ định nghĩa dữ liệu (CREATE TABLE, ALTER TABLE, DROP)
- DML: Ngôn ngữ THAO TÁC (SELECT, INSERT,...)
- *TCL:* Quản lý ngôn ngữ điều khiển (COMMIT, ROLLBACK, SAVEPOINT)
- *DCL:* Kiểm soát dữ liệu, phân quyền (GRANT, REVOKE)

**SQL quyết định data như thế nào, DBMS chọn cách để chạy truy vấn sao cho hiệu quả nhất**

# Các mức user và quản trị
- Naive users
- Application programmers
- Sophisticated user
- DB administrators

# DB nằm ở đâu trong ứng dụng? 
Ở trong kiến trúc [[(Thiết kế) Kiến trúc phần mềm#Server - Client|server-client]]
Có 2 kiến trúc 2 tier và 3 tier


# 3 Trách nhiệm của DBMS
>*Topic lớn, chọn 1 trong 3 cái domain này để làm prj*
- Storage management
- Query processing
- Transaction management

# Kiến trúc DMBS
*(xem hình trong sách)*
các mức:
- Top part: user and tools
- Middle part: query processor
- Lower part: storage manager
- Disk storag

DML/DDl/Tools --> Query processor --> Storage Manager --> Disk Storage

### Query processor
- DDL interpreter: Phân tích ra các phần định nghĩa, lưu phần định nghĩa vào catalog
- DML: Dịch thành một cái kế hoạch triển khai, sử dụng thông tin từ các phần liên quan

SQL --> Parse / validate --> Compile --> ...

### Storage manager

Query evalutation Engine --> Storage Manager (Bufer, Files, Indexes,...)


### Transaction manager (Nằm trong phần xử lý chương trình)
> *cái này là cái gì? và để làm cái gì*

Chứa rất nhiều lệnh read and wrt
--> Cần phải đảm bảo: tính nguyên tử / cô lập

### Recovery manager

### Authorization and intergrity
Tập trung vào xử lý quyền
Ai - được làm gì - được làm như thế nào
Đảm bảo TÍNH TOÀN VẸN, bảo vệ DB

### Catalog / Data dictionary