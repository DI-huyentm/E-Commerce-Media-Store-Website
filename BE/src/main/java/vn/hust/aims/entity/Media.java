package vn.hust.aims.entity;

import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Data
@Inheritance(strategy = InheritanceType.JOINED)
public class Media {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String category;
    private BigDecimal value;
    private BigDecimal price;
    private Integer quantityInStock;
    private Boolean isRushDeliveryEnabled;
}


