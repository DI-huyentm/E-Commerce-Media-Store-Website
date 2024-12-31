package vn.hust.aims.service;

import org.springframework.web.multipart.MultipartFile;
import vn.hust.aims.entity.media.Media;
import vn.hust.aims.service.dto.input.media.GetAllMediaInput;
import vn.hust.aims.service.dto.input.media.GetMediaInput;
import vn.hust.aims.service.dto.output.media.GetAllMediaOutput;
import vn.hust.aims.service.dto.output.media.GetMediaOutput;

public interface MediaService {
    GetMediaOutput getMedia(GetMediaInput getMediaInput);
    GetAllMediaOutput getAllMedia(GetAllMediaInput getAllMediaInput);
    Media getMediaById(Long mediaId);
    void validateQuantityInStock(Media media, Integer requestedQuantity);
    void updateQuantityInStock(Media media, Integer newQuantity);

}
