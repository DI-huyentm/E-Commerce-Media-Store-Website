package vn.hust.aims.service.implement;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import lombok.AllArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import vn.hust.aims.entity.media.Changelog;
import vn.hust.aims.entity.media.Media;
import vn.hust.aims.entity.media.factory.MediaFactoryBuilder;
import vn.hust.aims.entity.media.factory.MediaFactoryInterface;
import vn.hust.aims.enumeration.MediaType;
import vn.hust.aims.exception.GetImageException;
import vn.hust.aims.exception.MediaNotFoundException;
import vn.hust.aims.exception.PriceChangeLimitExceededException;
import vn.hust.aims.exception.QuantityNotEnoughException;
import vn.hust.aims.exception.UpdateDeleteLimitExceededException;
import vn.hust.aims.repository.media.ChangelogRepository;
import vn.hust.aims.repository.media.MediaRepository;
import vn.hust.aims.service.MediaService;
import vn.hust.aims.service.dto.input.media.GetAllMediaInput;
import vn.hust.aims.service.dto.input.media.GetMediaInput;
import vn.hust.aims.service.dto.output.media.GetAllMediaOutput;
import vn.hust.aims.service.dto.output.media.GetMediaOutput;
import vn.hust.aims.utils.JsonMapper;

@Service
@AllArgsConstructor
public class MediaServiceImpl implements MediaService {
  private final MediaRepository mediaRepository;
  private final ChangelogRepository changelogRepository;
  private final ResourceLoader resourceLoader;

  public GetMediaOutput getMedia(GetMediaInput getMediaInput) {
    Media media = mediaRepository.findById(getMediaInput.getId()).orElseThrow(
        MediaNotFoundException::new);

    return GetMediaOutput.builder().media(media).build();
  }

  public GetAllMediaOutput getAllMedia(GetAllMediaInput getAllMediaInput) {

    Map<String, Object> filterMap = getAllMediaInput.getFilterMap();
    int size = getAllMediaInput.getSize();
    int page = getAllMediaInput.getPage();
    String type = getAllMediaInput.getType();

    Media media = MediaFactoryBuilder.get(MediaType.from(type))
        .build(JsonMapper.writeValueAsString(filterMap));
//
//    System.out.println(media);

    PageRequest pageRequest = PageRequest.of(page, size);

    Page<Media> mediaPage;

    if (media.getTitle() == null) {
      mediaPage = mediaRepository.findAll(Example.of(media), pageRequest);
    } else {
      mediaPage = mediaRepository.findAllByTitleContaining(media.getTitle(), pageRequest);
    }

    return GetAllMediaOutput.builder().mediaPage(mediaPage).build();
  }

  public byte[] getMediaImage(String imageName) {
    try {
      Resource resource = resourceLoader.getResource("classpath:images/" + imageName);
      System.out.println(resource.getURI());
      try (InputStream inputStream = resource.getInputStream()) {
        return inputStream.readAllBytes();
      }
    } catch (IOException e) {
      throw new GetImageException();
    }
  }

  // data-coupling
  // Chỉ dùng đủ dữ liệu để tìm media - mediaId
  public Media getMediaById(Long mediaId) {
    return mediaRepository.findById(mediaId)
        .orElseThrow(MediaNotFoundException::new);
  }

  // data-coupling
  // Chỉ dùng đủ dữ liệu để tìm cart media - chỉ truyền vào media và số quantity cần có
  public void validateQuantityInStock(Media media, Integer requestedQuantity) {
    if (media.getQuantityInStock() < requestedQuantity) {
      throw new QuantityNotEnoughException();
    }
  }

  public void updateQuantityInStock(Media media, Integer newQuantity) {
    media.setQuantityInStock(newQuantity);
    mediaRepository.save(media);
  }
}
