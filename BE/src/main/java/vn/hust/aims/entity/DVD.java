package vn.hust.aims.entity;


import lombok.Data;

import javax.persistence.Entity;
import java.util.Date;

@Entity
@Data
public class DVD extends Media {
    private String discFormat;
    private String director;
    private Integer runtime;
    private String studio;
    private String language;
    private String subtitles;
    private String genre;
    private Date releaseDate;
}

