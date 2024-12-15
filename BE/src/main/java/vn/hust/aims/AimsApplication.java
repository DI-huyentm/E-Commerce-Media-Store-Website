package vn.hust.aims;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class AimsApplication {

    public static void main(String[] args) {
        SpringApplication.run(AimsApplication.class, args);
        System.out.println("AIMS Application has started successfully!");
    }

}
