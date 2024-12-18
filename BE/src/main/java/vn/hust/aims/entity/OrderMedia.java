// Khóa chính tổng hợp cho bảng trung gian
package vn.hust.aims.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "Order_Media")
public class OrderMedia {
    @EmbeddedId
    private OrderMediaId id = new OrderMediaId();

    @ManyToOne
    @MapsId("orderId")
    @JoinColumn(name = "order_id")
    private Order order;

    @ManyToOne
    @MapsId("mediaId")
    @JoinColumn(name = "media_id")
    private Media media;

    private Integer quantity;
    private Boolean isRushDelivery;
}

