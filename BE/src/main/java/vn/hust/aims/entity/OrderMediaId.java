package vn.hust.aims.entity;

import lombok.Data;

import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
@Data
public class OrderMediaId implements Serializable {
    private Long orderId;
    private Long mediaId;
}

