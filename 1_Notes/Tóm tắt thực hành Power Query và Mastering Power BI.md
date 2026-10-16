---
created: 2026-09-27
tags:
  - practice
category:
  - "[[Class]]"
subject:
  - "[[Class. Trí tuệ kinh doanh - INT3225 1|BI]]"
---

# Hai giáo trình thực hành Power BI — bản tra cứu nhanh

**Nguồn:** [[(Thuc Hanh) Pro Data Mashup for Power BI Powering Up with Power Query and the M Language to Find, Load, and Transform Data (Adam Aspin) (z-library.sk, 1lib.sk, z-lib.sk).pdf|A — Pro Data Mashup]] và [[(Thuc Hanh 2) MasteringPowerBI.pdf|B — Mastering Power BI]]. `tr.` = trang PDF. Mỗi dòng: việc cần làm → thao tác ở đâu/theo thứ tự nào. Các ví dụ dùng dịch vụ ngoài cần có dữ liệu mẫu và quyền truy cập.

## Lướt nhanh trước khi thi

- **A:** file/database/cloud → Import/DirectQuery/Live → Power Query → merge/append → parameter.
- **B:** DAX → visual → Service → RLS (chỉ chương 4–7).

## A — Pro Data Mashup for Power BI

Dữ liệu mẫu: tải theo Appendix A của sách, giải nén vào `C:\PowerBIDesktopSamples`.

### Chương 1–2: nạp dữ liệu từ file (tr. PDF 21–60)

- **Tạo báo cáo đầu tiên (tr. 23):** `Get Data > Excel` → mở `BrilliantBritishCars.xlsx` → chọn worksheet cần xem trong Navigator → `Load` → kéo trường lên canvas.
- **Tìm bảng trong Navigator (tr. 30):** dùng `BrilliantBritishCars.xlsx` vừa mở → ở Navigator nhập một phần tên sheet/table vào `Search` → chọn kết quả → xem preview → `Load`/`Transform Data`.
- **Nạp `Countries.csv` (tr. 43):** mở Power BI Desktop → `Home > Get Data > File > Text/CSV` → chọn `Countries.csv` → kiểm tra delimiter, encoding và preview → `Load`.
- **Kiểm tra tùy chọn CSV/text (tr. 48–51):** dùng `CountryList.txt` hoặc `Countries.csv` → `Get Data > Text/CSV` → ở preview chỉnh `File Origin`, `Delimiter`, `Data Type Detection` → kiểm tra cột trước khi nạp.
- **Nạp XML đơn giản (tr. 51):** `Get Data > File > XML` → mở `ColoursTable.xml` → chọn bảng `Colours` trong Navigator → `Load`.
- **Nạp nhiều sheet Excel (tr. 53):** `Home > Excel workbook` → mở `InvoicesAndInvoiceLines.xlsx` → chọn hai sheet `Invoices` và `InvoiceLines` trong Navigator → `Load`.
- **Nạp Access (tr. 56):** `Get Data > Access database` → mở `ClientsDatabase.accdb` → chọn bảng `ClientList` trong Navigator → `Load`.
- **Nạp bảng trong PDF (tr. 58):** `Get Data > File > PDF` → mở `WordSourceWithTables.Pdf` → chọn các bảng Navigator nhận diện → `Load`.
- **Xem quy trình chung khi nạp JSON/file (tr. 59–60):** xác định loại tệp → chọn connector tương ứng → duyệt cấu trúc Navigator → chọn đối tượng → `Load` hoặc `Transform Data` nếu dữ liệu lồng nhau.

### Chương 3–4: database, DirectQuery và Live (tr. 61–125)

Các bài này nối **database/cube trên server**, không mở file cục bộ. Tên nguồn sách dùng: `CarSalesData` (SQL Server), `CarSalesOLAP` (SSAS cube), `CarSalesTabular` (SSAS Tabular); server thực tế phải do bạn tự có.

- **Nạp SQL Server (tr. 65):** mở file Power BI mới → `Get Data > SQL Server database` → nhập server/database → chọn Import, xác thực → chọn bảng trong Navigator → `Load`.
- **Chọn bảng liên quan (tr. 70):** kết nối SQL Server → bật `Select Related Tables` trong Navigator → chọn một bảng gốc → kiểm tra các bảng có quan hệ được chọn thêm → `Load`.
- **Duyệt database trên server (tr. 72):** `Get Data > SQL Server` → nhập server, để trống database → kết nối → mở cây Navigator để tìm database và bảng.
- **Tìm database/bảng (tr. 74):** trong Navigator nhập một phần tên vào `Search` → chọn kết quả đúng → xem preview → nạp.
- **SQL statement làm nguồn (tr. 77):** SQL Server connector → server/database chứa `Data.AllSales` → `Advanced options > SQL statement` nhập `SELECT CountryName, MakeName, ModelName, Cost FROM Data.AllSales ORDER BY CountryName` → xác thực → `Load`.
- **Stored procedure làm nguồn (tr. 79):** SQL Server connector → server/database chứa procedure → `Advanced options > SQL statement` nhập `EXECUTE dbo.pr_DisplayUKClientData` → xác thực → kiểm tra tập kết quả → `Load`.
- **Nạp Oracle (tr. 82):** `Get Data > Database > Oracle database` → nhập server/service → chọn Import và cách xác thực → chọn bảng mẫu trong Navigator → `Load`.
- **Nạp SSAS multidimensional (tr. 89):** `Get Data > SQL Server Analysis Services database` → nhập server SSAS và cube mẫu `CarSalesOLAP` → Import → chọn dimension/measure trong Navigator → nạp.
- **Thêm item từ cube (tr. 93):** mở Power Query của nguồn SSAS → chọn query → dùng công cụ cube `Add Items` → chọn dimension/measure cần bổ sung → áp dụng.
- **Thu gọn cột cube (tr. 95):** chọn query SSAS → chọn cột không cần → `Collapse Columns` để giảm dữ liệu lấy từ nguồn → `Close & Apply`.
- **Nạp SSAS Tabular (tr. 96):** `Get Data > SQL Server Analysis Services database` → nhập server SSAS và model `CarSalesTabular` → chọn `Import` → chọn bảng/model trong Navigator → nạp.
- **SQL Server DirectQuery (tr. 103):** tạo PBIX mới → `Get Data > SQL Server` → nhập server và database mẫu `CarSalesData` → chọn `DirectQuery` → xác thực → chọn bảng → tạo visual.
- **SSAS cube Live connection (tr. 110):** `Get Data > Analysis Services` → nhập server SSAS và `CarSalesOLAP` → `Connect live` → chọn cube → tạo visual từ dimension/measure của cube.
- **SSAS Tabular Live connection (tr. 113):** kết nối Analysis Services với model `CarSalesTabular` → `Connect live` → chọn bảng của model → dùng trường trong Report view.
- **DirectQuery với SQL Server/nguồn khác (tr. 116–117):** mở connector của nguồn được hỗ trợ → chọn DirectQuery thay cho Import → chọn bảng → kiểm tra giới hạn chức năng và thời gian trả visual.
- **Đổi server/database (tr. 119):** trong PBIX hiện có, `Transform Data > Data source settings` → chọn nguồn → `Change Source` → nhập server/database mới có cùng schema → áp dụng và refresh.
- **Đổi thông tin đăng nhập (tr. 122):** `Transform Data > Data source settings` → chọn nguồn Oracle → `Edit Permissions` → sửa credentials → xác nhận → refresh.

### Chương 5–6: web, cloud, script và nguồn khác (tr. 126–202)

Các bài cloud dùng tài khoản/URL/instance tương ứng; những bài dùng file script hoặc folder mẫu ghi ngay trong dòng.

- **Nạp bảng từ web (tr. 130):** `Get Data > Web` → dùng trang Microsoft Power Query Ribbon mẫu ghi ở tr. 131 (hoặc URL khác còn hoạt động) → chọn bảng trong Navigator, so Table/Web View → `Load`.
- **Tùy chọn Web nâng cao (tr. 133–134):** trong hộp thoại Web chọn `Advanced` → nhập nhiều phần URL, header hoặc tham số cần thiết → kiểm tra preview → nạp.
- **Salesforce Objects (tr. 135):** `Get Data > Salesforce Objects` → đăng nhập Salesforce → chọn các object trong Navigator → `Load`.
- **Salesforce Reports (tr. 142):** `Get Data > Salesforce Reports` → đăng nhập → chọn report có sẵn → xem preview → `Load`.
- **Dynamics 365 (tr. 143):** `Get Data > Dynamics 365` → nhập địa chỉ môi trường → đăng nhập tài khoản tổ chức → chọn entity → `Load`.
- **Google Analytics (tr. 148):** `Get Data > Google Analytics` → đăng nhập Google → duyệt account/property/view → chọn dimensions và metrics → `Load`.
- **OData (tr. 151):** `Get Data > OData Feed` → URL mẫu `http://services.odata.org/northwind/northwind.svc` → chọn entity set trong Navigator → `Load`.
- **Azure SQL Database (tr. 153):** chuẩn bị database mẫu và firewall Azure → `Get Data > Azure SQL Database`/SQL Server → nhập server/database → xác thực → chọn bảng → nạp.
- **Azure Synapse Analytics (tr. 159):** chuẩn bị workspace/pool và quyền truy cập → `Get Data > Azure Synapse Analytics` → nhập server/database → xác thực → chọn dữ liệu.
- **SQL Server trên Azure VM (tr. 162):** đảm bảo VM/SQL Server cho phép kết nối → dùng connector SQL Server → nhập địa chỉ VM và database → xác thực → chọn bảng.
- **Azure Blob Storage (tr. 164):** đưa thư mục mẫu `MultipleIdenticalFiles` lên Blob container → `Get Data > Azure Blob Storage` → nhập Blob endpoint/account, account key → chọn file trong Navigator → `Load`/`Combine`.
- **Azure Databricks (tr. 168):** `Get Data > Azure Databricks` → nhập server hostname và HTTP path → dùng token/credentials → chọn catalog/schema/table → nạp.
- **Power BI dataset (tr. 173):** đăng nhập Power BI → `Get Data > Power BI datasets` → chọn dataset được chia sẻ → tạo report từ semantic model.
- **Dataflow (tr. 175):** `Get Data > Power BI dataflows` → đăng nhập → chọn workspace/dataflow/entity → `Load`.
- **Nạp kết quả R script (tr. 178):** `Get Data > R script` → dán script mẫu trong `LoadR.txt` (đọc CSV mẫu) → chọn data frame trong Navigator → `Load`.
- **Nạp kết quả Python script (tr. 183):** `Get Data > Python script` → dán script mẫu trong `LoadPython.txt` (đọc cùng CSV mẫu) → chọn DataFrame trong Navigator → `Load`.
- **Dataverse (tr. 187):** `Get Data > Dataverse` → đăng nhập môi trường → chọn bảng → `Load`.
- **ODBC (tr. 189):** cài FileMaker ODBC driver → ODBC Data Source Administrator > System DSN tạo `FilemakerForPowerBI` (host `localhost` nếu FileMaker chạy local) → `Get Data > ODBC` chọn DSN → credentials → bảng trong Navigator → `Load`.
- **Refresh toàn bộ (tr. 198):** `Home > Refresh` → đợi tất cả nguồn cập nhật → kiểm tra trạng thái/lỗi.
- **Refresh một bảng (tr. 199):** trong Fields nhấp phải bảng → `Refresh data` → kiểm tra kết quả.
- **Tạo bảng thủ công (tr. 200):** `Home > Enter Data` → nhập cột và hàng → đặt tên bảng → `Load`.

### Chương 7–8: Power Query và cấu trúc bảng (tr. 204–269)

**File làm việc:** `Example1.pbix`, query `BaseData` (trừ bài nạp trước khi biến đổi dùng `CarSales.xlsx`, sheet `BaseData`).

Với thao tác sách chỉ trình bày như công cụ chung (đổi thứ tự/xóa cột, sort), chọn một cột phù hợp trong `BaseData`; sách không ấn định tên cột hoặc file kết quả riêng.

- **Sửa query sau khi nạp (tr. 206):** mở `Example1.pbix` → `Transform Data > BaseData` → đổi `CostPrice` thành `VehicleCost` → `Close & Apply`.
- **Biến đổi trước khi nạp (tr. 209):** PBIX mới → `Get Data > Excel > CarSales.xlsx` → sheet `BaseData` → `Transform Data` → đổi `CostPrice` thành `VehicleCost` → `Close & Apply`.
- **Đổi tên cột (tr. 231):** chọn tiêu đề cột → nhấp đôi/nhấp phải `Rename` → nhập tên mới → Enter.
- **Đổi thứ tự cột (tr. 231):** chọn header → kéo đến vị trí mới hoặc dùng `Move` trên ribbon.
- **Xóa cột (tr. 233):** chọn một/nhiều cột (Ctrl) → `Remove Columns` → kiểm tra Applied Steps.
- **Chỉ giữ cột cần dùng (tr. 234):** Ctrl-chọn các cột cần giữ → `Remove Other Columns`; hoặc `Home > Choose Columns` rồi đánh dấu danh sách cột.
- **Gộp cột (tr. 236):** trong `BaseData`, Ctrl-chọn `Make`, `Model` theo thứ tự → `Transform > Merge Columns` → chọn separator, tên cột ghép → OK.
- **Đi đến cột trong bảng rộng (tr. 239):** `Home > Go to Column` → tìm/chọn tên cột → OK.
- **Giữ đầu/cuối/khoảng hàng (tr. 242–243):** trên `BaseData`, `Home > Keep Rows > Keep Top Rows` nhập 50; bài tiếp chọn `Keep Range of Rows`, First row=11, Number of rows=25 → OK.
- **Bỏ đầu/cuối/hàng luân phiên (tr. 244):** trên `BaseData`, `Home > Remove Rows > Remove Alternate Rows` → First row to remove=10, Number of rows to remove=2, Number of rows to keep=10 → OK.
- **Bỏ hàng trống/trùng (tr. 245–246):** `Remove Rows > Remove Blank Rows`; với bản ghi trùng, chọn các cột làm khóa rồi `Remove Duplicates`.
- **Sắp xếp/đảo chiều/hoàn tác sort (tr. 247–249):** chọn menu cột → Ascending/Descending; muốn đảo toàn bộ dùng `Transform > Reverse Rows`; muốn bỏ sort, xóa bước `Sorted Rows`.
- **Lọc giá trị cụ thể (tr. 251):** mở menu lọc cột → bỏ `Select All` → đánh dấu các giá trị cần giữ → OK.
- **Tìm trong danh sách lọc (tr. 252):** mở menu lọc → gõ từ khóa vào `Search` → chọn giá trị tìm thấy → OK.
- **Lọc text/number/date (tr. 254–257):** trên `BaseData`, menu cột `SalePrice > Number Filters > Less Than` nhập 5000; với cột text/date dùng menu Text/Date Filters tương ứng.
- **Advanced Filter (tr. 259):** trên `BaseData`, menu `SalePrice > Number Filters > Equals` → ghép các điều kiện OR `5000`, `89000`, `178500` → OK.
- **Bỏ bản ghi thiếu giá trị (tr. 261):** mở menu lọc cột bắt buộc (ví dụ `SalePrice`) → bỏ chọn `(null)`/`(blank)` → OK.
- **Group By đơn (tr. 263):** trên `BaseData`, chọn `Make` → `Home/Transform > Group By` → mặc định Count Rows → OK; kết quả một hàng mỗi Make và số xe.
- **Group By phức hợp (tr. 265):** trên `BaseData`, Ctrl-chọn `Make`, `CountryName` → `Group By > Advanced` → `TotalSales = Sum(SalePrice)` và `AverageCost = Average(CostPrice)` → OK.
- **Áp dụng và lưu (tr. 268):** kiểm tra Applied Steps → `Home > Close & Apply` → lưu PBIX.

### Chương 9: merge, append, pivot và profiling (tr. 270–306)

- **Merge để bổ sung trường (tr. 271):** `SalesData.xlsx` → nạp hai sheet `Sales`, `Clients` → chọn query `Sales > Merge Queries` với `Clients` trên `ClientName`, `Inner` → expand `ClientName`, `ClientSize`, `ClientSince`, bỏ prefix → OK.
- **Tổng hợp khi merge (tr. 276):** `InvoicesAndInvoiceLines.xlsx` → nạp `Invoices`, `InvoiceLines` → chọn `Invoices > Merge Queries` trên `InvoiceID`, `Inner` → ở cột nested `InvoiceLines` chọn `Aggregate > Sum of SalePrice` → OK.
- **Đổi kiểu join (tr. 280–281):** trên hai query `Invoices`/`InvoiceLines` vừa nạp, mở lại bước `Merged Queries` → lần lượt đổi `Join Kind` thành Inner, Left/Right/Full Outer và Left/Right Anti → kiểm tra số hàng/khóa không khớp.
- **Join nhiều khóa (tr. 282):** `StarSchema.xlsx` → nạp sheet `Sales`, `Geography` → chọn `Sales > Merge Queries` với `Geography`, `Inner` → Ctrl-chọn `Country`, `Region` cùng thứ tự hai bên → expand `GeographySK`.
- **Fuzzy merge (tr. 283–285):** trên hai query text cần ghép của ví dụ merge trước → chọn khóa text → bật `Use fuzzy matching` → đặt similarity threshold và maximum matches → kiểm tra kết quả; dùng `Merge as New` để giữ query gốc.
- **Xem hàng ghép (tr. 287):** làm lại merge → ở cột nested Table bấm vào ô từng hàng để xem bản ghi khớp → so khóa/số hàng trước khi expand, tránh nhân bản ngoài ý muốn.
- **Append hai bảng (tr. 289):** trong `MultipleIdenticalFiles`, nạp `Colours_01.txt`, `Colours_02.txt` → chọn query `Colours_01 > Home > Append Queries > Two tables` → thêm `Colours_02` → OK, kiểm tra số hàng.
- **Append từ nhiều query (tr. 292):** nạp ba workbook trong `MultipleIdenticalExcel` (đều có sheet `BaseData`) → chọn `BaseData > Append Queries > Three or more tables` → thêm `BaseData (2)` và `BaseData (3)` → OK.
- **Unpivot (tr. 294):** `PivotedDataSet.xlsx` → nạp sheet `PivotedCosts`, `Use First Row as Headers` → chọn mọi cột hãng xe, **trừ cột đầu** → `Transform > Unpivot Columns` → đổi tên `Attribute`, `Value`.
- **Pivot (tr. 297):** trên query `PivotedCosts` vừa unpivot → chọn `Attribute > Transform > Pivot Column` → Values column=`Value` → chọn phép tổng hợp → OK.
- **Transpose (tr. 299):** `DataToTranspose.xlsx` → chọn `Sheet1` → `Transform > Transpose` → đổi tên `Column1`, `Column2` theo dữ liệu sau chuyển.
- **Column Quality (tr. 300):** mở `Example1.pbix > Transform Data > BaseData` → `View > Column quality` → xem Valid/Error/Empty.
- **Column Distribution (tr. 300):** trên `Example1.pbix > BaseData`, `View > Column distribution` → xem distinct/unique và giá trị lệch.
- **Column Profile và toàn bộ dataset (tr. 301–303):** trên `Example1.pbix > BaseData`, chọn cột cần kiểm tra → `View > Column profile` → đổi `top 1000 rows` thành `entire data set`.
- **Sửa anomaly (tr. 304):** nhấp vào vùng quality/distribution có lỗi → chọn thao tác lọc, thay thế hoặc loại lỗi → kiểm tra lại profile.

### Chương 10–11: làm sạch và biến đổi cột (tr. 307–359)

**File mặc định:** `Example1.pbix > Transform Data > BaseData`; các bài dùng file khác ghi ngay trong dòng.

- **Nâng hàng đầu thành header (tr. 308):** `Home/Transform > Use First Row as Headers` → kiểm tra tên/kiểu cột.
- **Đặt/nhận diện kiểu dữ liệu (tr. 309–315):** trong `BaseData` chọn `CostPrice`, `SalePrice` → `Transform > Data Type` đặt số; thử `Detect Data Type` trên bảng và `Using Locale` khi parse ngày/số theo vùng.
- **Replace Values (tr. 316):** mở `Sample1.pbix` → chọn cột `Model` → `Transform > Replace Values` → nhập cách viết sai và đúng của tên mẫu xe → OK, xem giá trị thay đổi.
- **Chuẩn hóa chữ (tr. 319):** `Example1.pbix > BaseData` → chọn `Make > Transform > Format > UPPERCASE` → kiểm tra toàn cột viết hoa.
- **Thêm prefix/suffix (tr. 321):** `Example1.pbix > BaseData` → chọn cột text cần sửa → `Transform > Format > Add Prefix` hoặc `Add Suffix` → nhập chuỗi → OK.
- **Trim/Clean (tr. 321–322):** `Example1.pbix > BaseData` → chọn cột text có khoảng trắng/ký tự ẩn → `Transform > Format > Trim`, sau đó `Clean`.
- **Làm tròn và tính trên số (tr. 323–327):** `Example1.pbix > BaseData` → chọn cột số `SalePrice` → `Transform > Rounding > Round Up`; sau đó `Standard > Multiply` nhập `1.1` để thành 110%.
- **Tách ngày/giờ/khoảng thời gian (tr. 328–332):** `Example1.pbix > BaseData` → chọn `InvoiceDate` → `Transform > Date > Year/Month`, `Time > Hour` hoặc `Duration > Hour` theo kiểu cột → kiểm tra cột đầu ra.
- **Fill Down dữ liệu thiếu (tr. 336):** `CarMakeAndModelMatrix.xlsx > Sheet1` → `Transform Data` → chọn cột `Make` → `Transform > Fill > Down` → tên hãng lặp vào các ô rỗng bên dưới.
- **Trích một phần text (tr. 340–343):** `Example1.pbix > BaseData` → chọn `InvoiceNumber > Transform > Extract > Text Before Delimiter` → delimiter `-` → OK; thử After/Between Delimiters trên cùng cột.
- **Duplicate Column (tr. 344):** `Example1.pbix > BaseData` → chọn cột cần giữ bản gốc → `Add Column > Duplicate Column` → đổi tên bản sao trước khi biến đổi.
- **Split theo delimiter/số ký tự/chuyển chữ-số (tr. 345–351):** `DataToParse.xlsx` → promote hàng đầu làm header → chọn `ClientList > Split Column > By Delimiter` → `Semicolon`, `Each occurrence` → OK; thử Number of Characters/Character Transition trên bản sao query.
- **Merge Columns (tr. 351):** `Example1.pbix > BaseData` → Ctrl-chọn `Make`, `Model` → `Add Column > Merge Columns` → chọn separator; giữ hai cột gốc và thêm cột `Merged`.
- **Column from Examples (tr. 353):** `Example1.pbix > BaseData` → `Add Column > Column From Examples` → ở hàng đầu nhập mẫu `Red - Camargue` từ `Color` và `Model` → chấp nhận cột ghép được suy ra.
- **Conditional Column (tr. 355):** `Example1.pbix > BaseData` → `Add Column > Conditional Column` đặt `BuyerType`: `Make = Rolls Royce`→`Posh`, `Make = Bentley`→`Classy`, Else→`Bling`.
- **Index Column (tr. 358):** `Example1.pbix > BaseData` → `Add Column > Index Column` bắt đầu 0 (hoặc 1/custom) → đổi tên `Index` nếu dùng làm khóa.

### Chương 12: cấu trúc phức tạp, script và folding (tr. 360–398)

- **Combine Files trong folder (tr. 361):** PBIX mới → `Get Data > Folder` chọn `MultipleIdenticalFiles` → `Combine & Transform Data` → chọn file mẫu → OK; kiểm tra dữ liệu hợp nhất.
- **Lọc file trước khi Combine (tr. 364):** `Get Data > Folder` chọn `MultipleNonIdentical` → `Transform Data` → lọc `Extension = .xlsx` → bấm icon expand ở cột `Content` → chọn sheet/table `BaseData`, bật `Skip files with errors` → OK.
- **Hiển thị thuộc tính file (tr. 368):** trên query folder `MultipleNonIdentical`, expand `Attributes` → chọn metadata file cần xem; lọc `Name`, `Extension`, Date modified theo nhu cầu.
- **Chuyển XML trong một cột thành bảng (tr. 371):** `XMLInColumn.xlsx > Sales` → chọn `AvailableColors > Add Column > Parse > XML` → expand cột XML/table → lấy các màu ra cột riêng.
- **Chuyển JSON trong một cột thành bảng (tr. 374):** `JSONInColumn.xlsx > Sales` → chọn `AvailableColors > Add Column > Parse > JSON` → expand cột JSON, bỏ `Use original column name as prefix` → lấy các màu.
- **JSON lồng nhau (tr. 376):** `Get Data > JSON` mở `CarSalesJSON_Complex.json` → kiểm tra query tự tạo các cột theo cấp như `Sales.VehicleModel` → expand record/list còn lồng, giữ trường Vehicle/Finance/Customer cần dùng.
- **XML lồng nhau (tr. 378):** `Get Data > XML` mở file XML phức tạp trong sample → ở Navigator chọn node `Sales` → expand `Vehicle` và các table/record lồng → giữ trường cần.
- **Python transform (tr. 383):** `Example1.pbix > BaseData > Transform > Run Python Script` → trên `dataset["Make"]` thay regex `^Rolls.*` bằng `Roller!` vào cột `TestOutput` → chọn output DataFrame và expand.
- **R script giải nén CSV (tr. 386):** `Example1.pbix > Power Query > New Source > Blank Query > Advanced Editor` → dùng `R.Execute` đọc `Countries.csv` từ `Countries.zip` (mẫu `RCode.txt`) → expand cột `Value`.
- **Chuyển cột thành List (tr. 388):** `BrilliantBritishCars.xlsx` → nạp sheet cần dùng → chọn cột cần tách → `Drill Down`/`Convert to List` → đặt tên query List.
- **Kiểm tra query folding (tr. 389–392):** kết nối SQL Server → thêm bước lọc/chọn cột → nhấp phải Applied Step → `View Native Query`; thêm bước không fold rồi kiểm tra tùy chọn này biến mất.
- **Recent Sources (tr. 393):** `Home > Recent Sources` → chọn nguồn đã dùng → xác nhận kết nối → nạp vào báo cáo mới.
- **Pin nguồn hay dùng (tr. 396):** mở `Recent Sources` → ghim nguồn cần giữ → kiểm tra nguồn có mặt trong danh sách được ghim.
- **Sao chép dữ liệu từ Power Query (tr. 397):** chọn table/cột/ô → `Copy` từ menu ngữ cảnh → dán vào ứng dụng đích.

### Chương 13: quản lý query và parameter qua giao diện (tr. 399–444)

**File làm việc:** phần Applied Steps/query dùng `CarSalesDataForQueries.xlsx`; phần parameter dùng `CarSalesOverview.xlsx`, sheet `CarSalesOverview`.

- **Sửa/đổi tên bước (tr. 401–402):** chọn query → ở `Applied Steps` nhấp biểu tượng bánh răng để sửa tham số bước; nhấp phải bước → `Rename` → nhập tên có nghĩa.
- **Xóa bước hay chuỗi bước (tr. 403):** nhấp dấu X/menu bước trong `Applied Steps` → `Delete` hoặc `Delete Until End` → xác nhận và kiểm tra bước phụ thuộc.
- **Đổi worksheet/source đã chọn (tr. 404–406):** trong query `Clients` của `CarSalesDataForQueries.xlsx`, sửa bước `Navigation` bằng biểu tượng bánh răng → chọn worksheet đúng → kiểm tra các bước sau.
- **Thêm/đổi thứ tự bước (tr. 407):** thêm biến đổi mới vào query → chọn bước trong Applied Steps → `Move Up/Down` khi khả dụng → kiểm tra phụ thuộc; thứ tự đề nghị: nạp → lọc/bỏ cột → đặt kiểu → join → tính toán.
- **Xóa hàng lỗi (tr. 409):** chọn một/nhiều cột có error → `Home > Remove Rows > Remove Errors` → kiểm tra lại profile và số hàng.
- **Sắp xếp query/group (tr. 410–414):** nhấp phải query → `Move To Group > New Group` → đặt tên; dùng `Rename`, `Move To Group`, kéo query hoặc nhóm để tổ chức danh sách.
- **Duplicate vs Reference (tr. 414–416):** nhấp phải query → `Duplicate` để sao chép chuỗi bước hoặc `Reference` để tạo query phụ thuộc; đổi tên → tắt load cho query trung gian nếu cần.
- **Ghi chú query (tr. 417):** nhấp phải query → `Properties` → điền Description → kiểm tra chú thích khi hover.
- **Tách một cột thành query (tr. 418):** chọn cột từ query gốc → `Add as New Query` → đổi tên và xử lý distinct/kiểu tùy nhu cầu.
- **Tắt load/refresh (tr. 420–421):** nhấp phải query trung gian → bỏ `Enable Load`; với nguồn không cần cập nhật, bỏ `Include in Report Refresh` → `Close & Apply`.
- **Parameter đơn (tr. 423):** `CarSalesOverview.xlsx > CarSalesOverview` → `Manage Parameters > New` → `DealerParameter`, Description=`Filter dealer types`, Type=`True/False`, Current Value=`True` → OK.
- **Parameter danh sách giá trị (tr. 425):** cùng query `CarSalesOverview` → `New Parameter` tên `CountriesParameter`, Type=`Text`, `List of Values` nhập `France`, `Germany`, `Spain` → Default và Current=`France` → OK.
- **Parameter từ query/List (tr. 428):** query `CarSalesOverview` → nhấp phải `Model > Add as New Query` → List mới chọn `Remove Duplicates`, đổi tên `ModelList`, tắt `Enable Load` → `New Parameter` tên `ModelsParameter`, `Suggested Values: Query` chọn `ModelList`, Current=`DB9`.
- **Đổi parameter (tr. 431–432):** `Manage Parameters` hoặc chọn parameter ở Queries pane → sửa type, allowed/current values → OK.
- **Dùng parameter để lọc (tr. 432):** query `CarSalesOverview` → lọc cột `CountryName` → đổi ô giá trị thành `Parameter > CountriesParameter` → áp dụng; lọc `Model` bằng `ModelsParameter` tương tự.
- **Thay Current Value và refresh (tr. 434):** `Manage Parameters > Edit Parameters` → đổi Current Value → `Close & Apply`/Refresh → kiểm tra dữ liệu thay đổi.
- **Parameter cho Replace Values (tr. 435):** query `CarSalesOverview` → cột `CountryName > Replace Values` → Search dùng `CountriesParameter`, Replace With=`Luxembourg` → OK; bật `Always Allow Parameters` nếu hộp thoại yêu cầu.
- **Template có parameter (tr. 443):** chuẩn bị PBIX với query và parameter → `File > Export > Power BI template` → mở `.pbit` → điền parameter/credentials → lưu thành `.pbix` mới.

## B — Mastering Power BI

Bắt đầu từ chương 4. File trong sách là `Chap3_CreatingRelationships.pbix`, `Chapter4_DAX.pbix`, `Chapter5_Reports.pbix`, `Chapter7_RLS.pbix` (tên viết đôi chỗ hơi khác giữa văn bản và file đính kèm). Mở bản của chương trước rồi **Save As** bản của chương đang làm.

### Chương 4: DAX (tr. 130–176)

**Chương 4:** Exercise 1–21 như sách. **Chương 5:** Exercise 1–14 như sách. Các ví dụ không được đánh số giữ tên mục gốc.

**File làm việc chương 4:** `Chap3_CreatingRelationships.pbix` → **Save As** `Chap4_DAX.pbix`; riêng Exercise 8 thêm `BooleanValues.xls`.

- **Exercise 1 — UnitPrice (tr. 134):** trong `Chap4_DAX.pbix`, `Orders > New Column` → `UnitPrice = Orders[Sales] / Orders[Quantity]` → Table visual gồm Order ID, Product ID, Sales, Quantity, UnitPrice để so kết quả.
- **Exercise 2 — City-State (tr. 136):** `Customers > New Column` → `CityState = CONCATENATE(Customers[City], CONCATENATE("-", Customers[State]))` → Table visual kiểm tra dạng `City-State`.
- **Exercise 3 — Measure Sales (tr. 138):** chọn `Orders > New Measure` → `SalesMeasure = SUM(Orders[Quantity]) * SUM(Orders[UnitPrice])` → kéo measure vào visual để xem tổng theo filter context.
- **Exercise 4 — Running Total quick measure (tr. 142):** `Orders > … > New quick measure > Running total` → Base value=`Orders[Sales]`, Field=`Year` → tạo measure `Sales running Total in Year`.
- **Exercise 5 — Profit % (tr. 144):** `Orders > New Measure` → `% of Profit = DIVIDE(SUM(Orders[Profit]), SUM(Orders[Sales]), 0)` → định dạng Percentage → thêm vào visual.
- **Exercise 6 — SUMX TotalSales (tr. 147):** `Orders > New Measure` → `TotalSalesX = SUMX(Orders, Orders[Quantity] * Orders[UnitPrice])` → so với measure `SUM` dưới các filter khác nhau.
- **Exercise 7 — Đếm Orders (tr. 148):** `Orders > New Measure` → `CountofOrders = COUNT(Orders[Order ID])` → kiểm tra trên Card.
- **Exercise 8 — COUNT và COUNTA (tr. 149–151):** `Home > Excel` nạp `BooleanValues.xls` thành `Digits` → `New Column` đặt `BooleanValues`: Values=1/2 trả TRUE, =7 trả FALSE, còn lại BLANK → tạo `CountBoolean = COUNT(Digits[BooleanValues])` và `CountBooleanA = COUNTA(Digits[BooleanValues])` → so hai số đếm.
- **Exercise 9 — ISERROR (tr. 154):** `Orders > New Measure` → nhập theo sách `DivideByZero = IF(ISERROR(Orders[SalesMeasure]/Orders[CountofOrders]), 0, [SalesMeasure])` → kiểm tra nhánh lỗi trả 0.
- **Exercise 10 — USERNAME (tr. 154):** `New Measure` → `CurrentUser = USERNAME()` → đặt vào Card để xem user hiện tại.
- **LOOKUPVALUE cho Location (tr. 155–157):** chọn `Sales Person > New Column` → dùng `LOOKUPVALUE(SalesPerson_Location[Location], SalesPerson_Location[SalesPersonID], 'Sales Person'[SalesPersonID])` → kiểm tra vị trí được tra theo ID.
- **Exercise 11 — IF lồng nhau cho Time Zone (tr. 158):** trên `Sales Person`, `New Column` → ánh xạ Location (Ohio/Florida→EST, Illinois→CST, …) bằng `IF` lồng nhau → kiểm tra từng vùng.
- **Exercise 12 — AND phân loại đơn (tr. 160):** `Orders > New Column` → `GoodBadOrders = IF(AND(Orders[SalesMeasure] > 1000, Orders[% of Profit] > 0.1), "Good Order", "Bad Orders")` → Table visual với Order ID, SalesMeasure, Profit % và nhãn.
- **Exercise 13 — SWITCH tên tháng (tr. 161):** `Orders > New Column` → `OrderMonth = SWITCH(MONTH(Orders[Order Date]), 1,"Jan", 2,"Feb", …, 12,"Dec", "Invalid month number")` → kiểm tra trong Data view.

Lệnh CALCULATETABLE:
Lệnh CALCULATE:

- **Exercise 14 — FILTER + CALCULATE (tr. 162):** `Orders > New Measure` → `Sales for 2018 = CALCULATE(SUM(Orders[Sales]), FILTER(Orders, YEAR(Orders[Order Date]) = 2018))` → đặt vào visual.
- **Exercise 15 — CALCULATETABLE + SUMX (tr. 164):** tạo measure `Sales for All Years = SUMX(CALCULATETABLE(Orders), Orders[Sales])`; biến thể `CALCULATETABLE(Orders, Orders[Quantity] > 1)` → so tổng theo điều kiện.
- **Exercise 16 — ALL bỏ filter (tr. 165):** `New Measure` → `TotalSales All = CALCULATE(SUM(Orders[Sales]), ALL())` → đặt cạnh Sales theo năm/vùng để thấy tổng toàn bộ không đổi.
- **Exercise 17 — RELATED (tr. 167):** trên `Sales Person` thêm cột `Units` ánh xạ ID→100, 200, … → bảo đảm quan hệ `SalesTarget`–`Sales Person` → tạo measure `SUMX(SalesTarget, SalesTarget[Sales] / RELATED('Sales Person'[Units]))` và kiểm tra kết quả.
- **Exercise 18 — VALUES đếm khách duy nhất (tr. 170):** `Orders > New Measure` → `CountOfUniqueCustomers = COUNTROWS(VALUES(Orders[Customer ID]))` → dùng Card/visual theo vùng.
- **Exercise 19 — CALENDAR (tr. 171):** `Home > New Table` → `DateDim = CALENDAR(MIN(Orders[Order Date]), MAX(Orders[Order Date]))` → kiểm tra ngày liên tục và tạo quan hệ ngày khi dùng.
- **Exercise 20 — DATEDIFF (tr. 172):** `Orders > New Column` → `DaysToShip = DATEDIFF(Orders[Order Date], Orders[Ship Date], DAY)` → kiểm tra số ngày giao.
- **Exercise 21 — VAR + RETURN (tr. 173):** `Orders > New Measure` → `VAR FilterSales2018 = FILTER(Orders, YEAR(Orders[Order Date]) = 2018) RETURN CALCULATE(SUM(Orders[Sales]), FilterSales2018)` → so với Exercise 14 ở trên.

### Chương 5: report và các visual (tr. 177–221)

**File làm việc:** model `Chap4_DAX.pbix` → lưu `Chapter5_Reports.pbix`; mọi Exercise dưới đây chỉnh trên các **report page** của file này.

- **Report đầu tiên (tr. 179):** mở model đã chuẩn bị → Report view → chọn visual → kéo trường vào field wells → đổi kích thước, tiêu đề và định dạng → lưu báo cáo.
- **Exercise 1 — Card KPIs (tr. 185):** Report view → Card với `Orders[Order ID]` (Count) → copy/paste thành card `Orders[Customer ID]` (Distinct count) và `Orders[Sales]` (Sum) → title `# of Orders`, `# of Customers`, `Total Sales`.
- **Exercise 2 — Stacked bar (tr. 189–190):** trên Page 1, chèn logo/image → Stacked bar với `Orders[Order Date]` cấp Year vào Axis, `Orders[Sales]` vào Values, `Customers[Region]` vào Legend → chỉnh màu/nhãn.
- **Filters/Slicers (tr. 192):** trên stacked bar thử `Customers[Region]` ở Visual filter (Basic/Advanced) → bảng `Order ID`, `Sales` lọc Top 5 Sales bằng Top N → kéo `Orders[Year]`, `Orders[Month]` vào `Filters on all pages`.
- **Exercise 3 — Line chart (tr. 196):** trên Page 2, Line chart: `Orders[Order Date]` cấp Year vào Axis, `Orders[Sales]` vào Values, `Category[Category]` vào Legend → kiểm tra Sales theo năm/danh mục.
- **Theme (tr. 198):** `View > Themes` → chọn theme có sẵn hoặc `Customize current theme` → kiểm tra màu/font toàn báo cáo.
- **Template PBIX (tr. 201):** từ báo cáo mẫu `File > Export > Power BI template` → lưu `.pbit` → mở template → cấp đường dẫn/credentials để tạo PBIX mới.
- **Exercise 4 — Line + Stacked Column (tr. 202):** trang mới → Line and Stacked Column: `Orders[Year]` vào Shared axis, `Orders[Sales]` vào Column values, `Orders[Profit]` vào Line values, `Customers[Segment]` vào Column series → định dạng hai trục.
- **Exercise 5 — Ribbon (tr. 204):** trang mới → Ribbon: `Orders[Month]` vào Axis, `Orders[Sales]` vào Values, `Category[Category]` vào Legend → lọc Year; `Format > Ribbons > Spacing = 3`.
- **Exercise 6 — Waterfall (tr. 206):** trang mới → Waterfall: `Orders[Month]` vào Category, `Orders[Profit]` vào Values, `Category[Category]` vào Breakdown → lọc Year/Category để xem đóng góp Profit.
- **Exercise 7 — Scatter (tr. 207):** trang mới → Scatter: `Orders[Profit]` vào X, `Orders[Quantity]` vào Y, `Customers[Customer Name]` vào Details/Legend, `Orders[Order ID]` Count vào Size → lọc Top 10 Customers theo Profit.
- **Exercise 8 — Donut (tr. 210):** trang mới → Donut: `Orders[Profit]` vào Values, `Customers[Segment]` vào Legend → bật tỷ lệ % và chỉnh title/label.
- **Exercise 9 — Treemap (tr. 211):** trang mới → Treemap: `Category[Sub-Category]` vào Group, `Orders[Sales]` vào Values, `Customers[Segment]` vào Details → kiểm tra diện tích theo Sales.
- **Exercise 10 — Treemap cross-filter (tr. 212):** copy Treemap của Exercise 9 sang trang mới cùng Line, Column và Donut chart → chọn từng ô `Sub-Category` → xem các chart kia cross-filter/highlight và ngược lại.
- **Exercise 11 — Map (tr. 213):** trang mới → Map: `Customers[State]` vào Location, `Customers[Region]` vào Legend, `Orders[CountofCustomers]` vào Size → kiểm tra vòng tròn theo số khách.
- **Exercise 12 — Filled Map (tr. 215):** trang mới → Filled Map: `Customers[State]` vào Location, `Customers[Region]` vào Legend, `Orders[CountofCustomers]` vào Tooltips → xem bang tô theo Region.
- **Exercise 13 — Q&A (tr. 216):** thêm trang → Q&A visual → gõ câu hỏi tự nhiên về top 5 customer theo Sales → thêm tên loại chart/table trong câu để đổi kiểu kết quả.
- **Exercise 14 — Drillthrough (tr. 218):** tạo page `Summary` với Stacked bar `Customers[Customer Name]` + `Orders[Sales]` → tạo page `Drill Thru` với Table mọi trường `Customers` → đưa `Customers[Customer Name]` vào Drill-through → từ Summary nhấp phải một khách để mở chi tiết.

### Chương 6: Power BI Service (tr. 222–240)

**Nguồn:** `Orders.xls` trong thư mục dữ liệu mẫu; tạo bản `Orders_Table.xls`/`.xlsx` sau khi chuyển range thành Excel Table. Phần Publish dùng `Chapter5_Reports.pbix`.

- **Nạp Excel lên Service (tr. 226):** Service `My Workspace > Get data > Files > Local File` thử Import `Orders.xls` (sách gặp lỗi vì range chưa là Table) → mở file trong Excel, chọn range gồm header, `Insert > Table`/Ctrl+T và bật `My table has headers` → Save As `Orders_Table` → Import lại, kiểm tra dataset `Orders_Table`.
- **Tạo report trong Service (tr. 230):** menu `…` cạnh dataset `Orders_Table > Create report` → Stacked bar với `Order Year` và `Sales` → Save tên `Sales by Year`.
- **Pin visual thành dashboard (tr. 232):** rê lên chart → `Pin visual` → tạo dashboard mới/đặt tên → `Go to dashboard` → kiểm tra tile.
- **Thêm line chart vào dashboard (tr. 234):** `Orders_Table > Create report` → Line chart `Order Year`/`Sales` → Save tên `Trend of Sales by Year` → `Pin visual` vào dashboard vừa tạo → xem 2 tiles.
- **Publish từ Desktop (tr. 237):** mở `Chapter5_Reports.pbix` → đăng nhập → `Home > Publish > My Workspace` → mở Service kiểm tra report và dataset.

### Chương 7: Row-level security (tr. 241–253)

**File làm việc:** copy visual từ `Chapter5_Reports.pbix` sang PBIX mới → lưu `Chapter7_RLS.pbix`.

- **Chuẩn bị visual thử RLS (tr. 242):** trong `Chapter7_RLS.pbix`, dán/tạo lại Stacked bar, Map, Filled Map từ `Chapter5_Reports.pbix` → giữ `Customers[Region]` trong model để lọc.
- **Tạo các role vùng (tr. 244):** `Modeling > Manage roles > Create` → đặt `Sales Person East` → chọn `Customers` và filter `[Region] = "East"` → lặp cho West/Central/South với vùng tương ứng → Save.
- **Test role ở Desktop (tr. 246):** `Modeling > View as` → chọn từng role → kiểm tra visual chỉ hiện khách/vùng được phép → thoát View as.
- **Gán thành viên trên Service (tr. 248):** Publish PBIX → Service mở menu dataset `… > Security` → chọn role → thêm tài khoản người dùng được phép → Save.
- **Test role trên Service (tr. 251):** trong trang Security chọn menu `…` cạnh role → `Test as role` → mở report và xác nhận dữ liệu chỉ còn của vùng đó.

**Ưu tiên ôn:** sách A chương 9, 12–13; sách B chương 4 và 7.
