package vn.hust.aims.entity;
import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "`Order`") // Đặt tên bảng tránh trùng từ khóa SQL
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "delivery_info_id")
    private DeliveryInfo deliveryInfo;

    @OneToOne
    @JoinColumn(name = "payment_transaction_id")
    private PaymentTransaction paymentTransaction;
}
