package vn.hust.aims.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
public class RushOrder extends Order {
    private String deliveryInstruction;
    private LocalDateTime deliveryTime;
}

