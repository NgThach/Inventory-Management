# 📦 Inventory Management Project (Oracle Database)

## 🧑‍💼 Giới thiệu

Dự án này mô phỏng vai trò của một **Database Administrator (DBA)** trong việc triển khai, bảo mật, sao lưu và giám sát một hệ thống cơ sở dữ liệu phục vụ **Inventory Management System**. Dữ liệu được lấy từ một tập tin thực tế `inventory.csv` và được nạp vào Oracle Database bằng công cụ SQL*Loader.

---

## 🛠️ Công nghệ & Công cụ sử dụng

- **Oracle Database 19c**
- **SQL*Loader** để import dữ liệu
- **RMAN** để sao lưu/phục hồi
- **SQL/PLSQL** cho script giám sát
- **DBMS_SCHEDULER** để tự động hóa
- **Shell Script** (backup)
- **GitHub** để quản lý mã nguồn và tài liệu

---

## 🗂️ Cấu trúc thư mục
inventory-dba-project/
│
├── README.md # Tài liệu hướng dẫn tổng quan
├── sql/
│ ├── create_tables.sql # Tạo bảng từ inventory.csv
│ ├── queries/
│ │ ├── business_queries.sql # Truy vấn phục vụ báo cáo
│ │ └── performance_queries.sql # Truy vấn cho tối ưu
│
├── dba_tasks/
│ ├── user_setup.sql # Tạo user + phân quyền
│ ├── tablespace_setup.sql # Tạo tablespace riêng
│ ├── backup/
│ │ ├── rman_backup.sh # Script sao lưu RMAN
│ │ └── rman_config.sql # Cấu hình FRA, retention
│ ├── monitoring/
│ │ ├── alert_log_check.sql # Giám sát alert log
│ │ └── tablespace_monitor.sql # Giám sát dung lượng tablespace
│ └── security/
│ ├── password_policy.sql # Chính sách mật khẩu
│ └── audit_config.sql # Cấu hình audit
│
├── control_files/
│ └── inventory.ctl # File điều khiển SQL*Loader
├── data/
│ └── inventory.csv # Dữ liệu gốc (raw)
└── docs/
└── architecture_diagram.png # Lược đồ hệ thống


---

## 🔐 Các chức năng DBA thực hiện

| Tính năng                 | Mô tả                                                                 |
|--------------------------|----------------------------------------------------------------------|
| Quản lý Tablespace       | Tạo `INVENTORY_TS`, kiểm soát dung lượng                              |
| Quản lý User             | Tạo user `APP`, phân quyền, quản lý QUOTA                            |
| Import Dữ liệu           | Sử dụng SQL*Loader để load file `.csv` vào Oracle Database            |
| Backup & Recovery        | Cấu hình RMAN, tạo full/incremental backup, khôi phục khi lỗi         |
| Audit & Bảo mật          | Thiết lập policy mật khẩu, audit thao tác DROP, DELETE                |
| Giám sát Hệ thống        | Script kiểm tra alert log, usage tablespace, job cảnh báo tự động     |
| Tối ưu truy vấn          | Index, thống kê, theo dõi truy vấn chậm                               |

---

## 📈 Truy vấn nghiệp vụ mẫu

- Top 5 sản phẩm doanh thu cao nhất
- Số lượng tồn kho theo khu vực
- Khách hàng lớn theo hạn mức tín dụng

Chi tiết xem tại file [`queries/business_queries.sql`](sql/queries/business_queries.sql)

---

## 💾 Backup & Phục hồi

- **Full Backup** hàng tuần
- **Incremental Backup** hàng ngày
- Tự động hóa qua `rman_backup.sh`
- Hướng dẫn khôi phục chi tiết có trong `dba_tasks/backup/`

---

## 👮 Bảo mật & Audit

- Gán profile giới hạn mật khẩu yếu
- Audit hoạt động nhạy cảm (DROP, DELETE)
- Chặn PUBLIC access đến các đối tượng hệ thống

---

## 🚨 Giám sát & Tự động hóa

- Script cảnh báo khi tablespace > 80%
- Kiểm tra alert log định kỳ
- Dùng `DBMS_SCHEDULER` để chạy job tự động

---

## 🧠 Giá trị dự án

- Mô phỏng sát thực tế công việc của DBA
- Triển khai đầy đủ từ setup, vận hành, bảo mật, backup
- Thể hiện kỹ năng toàn diện với Oracle
- Có thể trình bày trong CV, portfolio GitHub chuyên nghiệp

---

## 📌 Hướng dẫn chạy nhanh (Quick Start)

```bash
-- 1. Tạo tablespace và user
sqlplus / as sysdba @dba_tasks/tablespace_setup.sql
sqlplus / as sysdba @dba_tasks/user_setup.sql

-- 2. Import dữ liệu
sqlldr app/app@localhost:1521/pdb control=control_files/inventory.ctl log=inventory.log

-- 3. Chạy giám sát
sqlplus / as sysdba @dba_tasks/monitoring/tablespace_monitor.sql

-- 4. Thực hiện backup
sh dba_tasks/backup/rman_backup.sh
