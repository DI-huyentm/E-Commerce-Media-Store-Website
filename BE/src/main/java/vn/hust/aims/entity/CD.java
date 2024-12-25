package vn.hust.aims.entity;

import lombok.Data;

import javax.persistence.Entity;
import java.util.Date;

@Entity
@Data
public class CD extends Media {
    private String recordLabel;
    private String trackList;
    private String genres;
    private String artists;
    private Date releaseDate;
}

