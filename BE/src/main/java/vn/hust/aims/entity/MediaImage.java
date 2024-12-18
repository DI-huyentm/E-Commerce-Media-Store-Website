package vn.hust.aims.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class MediaImage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String imageUrl;

    @ManyToOne
    @JoinColumn(name = "media_id", nullable = false)
    private Media media;
}
