# TKXDPM.VP.20241.05

## 1. Công nghệ và hướng dẫn cài đặt/chạy

### 1.1 Database: MySQL

1. Tải xuống và cài đặt MySQL.
2. Thiết lập **username** và **password**.

### 1.2 Backend: Java Spring Boot

1. Sử dụng **IDE IntelliJ** để mở dự án backend.
2. Chọn **Open Folder** -> Mở thư mục `BE`.
3. Nhấn **Build** để build dự án.
4. Mở tệp `application-dev.yml` và sửa các giá trị biến theo thông tin MySQL trên máy cá nhân.
5. Tìm file `vn/hust/aims/AimsApplication.java` và nhấn **Run**.

   **Thành công khi Terminal hiển thị:**

   ```shell
   ...
   2024-12-15 14:25:30.806  WARN 74154 --- [           main] JpaBaseConfiguration$JpaWebConfiguration : spring.jpa.open-in-view is enabled by default. Therefore, database queries may be performed during view rendering. Explicitly configure spring.jpa.open-in-view to disable this warning
   2024-12-15 14:25:30.941  WARN 74154 --- [           main] ion$DefaultTemplateResolverConfiguration : Cannot find template location: classpath:/templates/ (please add some templates or check your Thymeleaf configuration)
   2024-12-15 14:25:31.028  INFO 74154 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
   2024-12-15 14:25:31.034  INFO 74154 --- [           main] vn.hust.aims.AimsApplication             : Started AimsApplication in 24.95 seconds (JVM running for 25.157)
   AIMS Application has started successfully!
   ```

### 1.3 Frontend: JavaScript

**Prerequisite:**

- Cài đặt [Node.js và npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm).

**Hướng dẫn:**

1. Mở terminal, chuyển đến thư mục `FE`:
   ```shell
   cd FE
   npm install
   npm run dev
   ```
2. Truy cập http://localhost:3000 để xem kết quả.

## 2. Danh sách Usecase

| STT | Nhóm         | Usecase                              | Actor                          |
| --- | ------------ | ------------------------------------ | ------------------------------ |
| 1   | Product      | Xem sản phẩm                         | Customer                       |
| 2   |              | Tìm kiếm sản phẩm                    | Customer                       |
| 3   |              | Sắp xếp sản phẩm                     | Customer                       |
| 4   |              | Hoàn tiền                            | Customer + Hệ thống thanh toán |
| 5   | Cart         | Thêm/sửa/xóa sản phẩm trong giỏ hàng | Customer                       |
| 6   |              | Xem giỏ hàng                         | Customer                       |
| 7   |              | Xem đơn hàng                         | Customer                       |
| 8   |              | Huỷ đơn hàng                         | Customer                       |
| 9   | Order        | Đặt hàng                             | Customer                       |
| 10  |              | Đặt hàng nhanh                       | Customer                       |
| 11  |              | Thanh toán                           | Customer + Hệ thống thanh toán |
| 12  | Invoice      | Xem lịch sử mua hàng                 | Customer                       |
| 13  | Notification | Thông báo                            | Hệ thống gửi mail              |

## 3. Danh sách thành viên và nhiệm vụ

| STT | Thành viên         | MSSV     | Nhóm nhiệm vụ  | Nghiệp vụ | Ghi chú     |
| --- | ------------------ | -------- | -------------- | --------- | ----------- |
| 1   | Trần Văn Đức Chính | 20215263 | Nhóm 1, Nhóm 3 | Backend   |             |
| 2   | Tạ Tùng Dương      | 20215267 | Nhóm 2         | Backend   |             |
| 3   | Trần Minh Huyền    | 20215275 | Nhóm 4         | Backend   | Nhóm trưởng |
| 4   | Phạm Minh Đạt      | 20210169 | Nhóm 1, Nhóm 3 | Frontend  |             |
| 5   | Nguyễn Thu Trang   | 20205225 | Nhóm 2, Nhóm 4 | Frontend  |             |

- Tất cả các thành viên cùng tham gia viết báo cáo và phân tích thiết kế.

### Nhóm nhiệm vụ:

**Nhóm 1 - Quản lý sản phẩm:** Tập trung vào việc hiển thị và tương tác với danh sách sản phẩm.

- Xem sản phẩm (View Products)
- Sắp xếp sản phẩm (Sort Products)
- Tìm kiếm sản phẩm (Search Products)

**Nhóm 2 - Quản lý giỏ hàng và đặt hàng:** Xử lý logic giỏ hàng và quy trình đặt hàng.

- Thêm/sửa/xóa sản phẩm trong giỏ hàng (CRUD Product in Cart)
- Xem giỏ hàng (View Cart)
- Đặt hàng (Place Order)
- Đặt hàng nhanh (Place Rush Order)

**Nhóm 3 - Quản lý đơn hàng:** Tập trung vào các thao tác sau khi đặt hàng.

- Xem đơn hàng (View Order)
- Hủy đơn hàng (Cancel Order)
- Xem lịch sử mua hàng (View Invoice)
- Hoàn tiền (Refund)

**Nhóm 4 - Xử lý thanh toán:** Tập trung vào tích hợp và xử lý với các subsystem.

- Thanh toán (Pay Order)
- Thông báo (Notification)
