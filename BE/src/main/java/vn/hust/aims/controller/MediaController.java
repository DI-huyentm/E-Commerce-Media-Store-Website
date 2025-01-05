package vn.hust.aims.controller;

import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.hust.aims.controller.dto.response.media.*;
import vn.hust.aims.entity.media.Media;
import vn.hust.aims.response.AimsCommonResponse;
import vn.hust.aims.service.dto.input.media.GetAllMediaInput;
import vn.hust.aims.service.dto.input.media.GetMediaInput;
import vn.hust.aims.service.dto.output.media.*;
import vn.hust.aims.service.MediaService;
import vn.hust.aims.enumeration.MediaType;
import vn.hust.aims.utils.ResponseUtil;

import java.util.Map;

@Controller
@AllArgsConstructor
@RequestMapping("/api/v1/media")
public class MediaController {
    private final MediaService mediaService;

    @GetMapping("")
    public ResponseEntity<AimsCommonResponse<Object>> getAllMedia(@RequestParam(defaultValue = "0") int page,
                                                                  @RequestParam(defaultValue = "20") int size,
                                                                  @RequestParam(defaultValue = "media") String type,
                                                                  @RequestParam Map<String, Object> params) {
        params.remove("page");
        params.remove("size");
        params.remove("type");

        GetAllMediaOutput getAllMediaOutput = mediaService.getAllMedia(GetAllMediaInput.builder()
                .page(page)
                .size(size)
                .type(type)
                .filterMap(params)
                .build());

        return ResponseUtil.toSuccessCommonResponse(GetAllMediaResponse.from(getAllMediaOutput));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Media> getMedia(@PathVariable Long id) {
        GetMediaOutput getMediaOutput = mediaService.getMedia(GetMediaInput.builder().id(id).build());
        Media media = GetMediaResponse.from(getMediaOutput).getMedia();
        return new ResponseEntity<>(media, HttpStatus.OK);
    }

    @PostMapping("/image")
    public ResponseEntity<Object> testImage(@RequestParam(value = "file", required = false) MultipartFile file, @RequestParam Map<String, Object> body) {
        System.out.println(file);

        return ResponseEntity.ok(body);
    }

    @GetMapping("/images/{image}")
    public ResponseEntity<byte[]> getMediaImage(@PathVariable String image) {
        byte[] imageBytes = mediaService.getMediaImage(image);

        return ResponseEntity.ok().contentType(org.springframework.http.MediaType.IMAGE_JPEG).body(imageBytes);
    }
}
