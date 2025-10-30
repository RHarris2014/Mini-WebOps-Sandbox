package com.webops.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import javax.sql.DataSource;
import java.sql.Connection;
import java.util.Map;
import java.time.Instant;
import java.util.concurrent.atomic.AtomicLong;

@RestController
public class HelloController {
    private final long start = Instant.now().toEpochMilli();
    private final AtomicLong requests = new AtomicLong(0);

    @Autowired
    private DataSource dataSource;

    @GetMapping("/")
    public Map<String, Object> root() {
        requests.incrementAndGet();
        return Map.of("msg", "Hello from Spring Boot behind NGINX");
    }

    @GetMapping("/ready")
    public Map<String, Object> ready() {
        try (Connection c = dataSource.getConnection()) {
            return Map.of("ready", true);
        } catch (Exception e) {
            return Map.of("ready", false, "error", e.getClass().getSimpleName());
        }
    }

    @GetMapping("/hello")
    public String hello() {
        return "Hello from WebOps Sandbox!";
    }


    @GetMapping(value="/metrics", produces="text/plain")
    public String metrics() {
        long uptime = Instant.now().toEpochMilli() - start;
        return "requests_total " + requests.get() + "\n" +
                "uptime_seconds " + uptime + "\n";
    }
}