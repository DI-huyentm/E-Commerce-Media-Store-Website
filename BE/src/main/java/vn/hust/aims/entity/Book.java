package vn.hust.aims.entity;


import lombok.Data;

import javax.persistence.Entity;
import java.util.Date;

@Entity
@Data
public class Book extends Media {
    private String author;
    private String publisher;
    private String coverType;
    private Date publicationDate;
    private Integer pages;
    private String language;
}

