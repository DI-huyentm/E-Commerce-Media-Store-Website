package vn.hust.aims.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.hust.aims.entity.MediaImage;

@Repository
public interface MediaImageRepository extends JpaRepository<MediaImage, Long> {
}

