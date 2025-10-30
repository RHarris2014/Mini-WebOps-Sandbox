# Mini-WebOps-Sandbox

A self-contained WebOps demo stack simulating real-world multi-service orchestration using **NGINX**, **Spring Boot**, and **PostgreSQL** — built for DevOps and Web Administration interviews.

---

## Overview

This sandbox demonstrates how a reverse-proxy load balancer (NGINX) can distribute traffic across multiple Spring Boot app instances, each exposing Actuator health endpoints, backed by a PostgreSQL database.

**Key features:**
- Containerized Java services via Docker Compose  
- Reverse proxy routing with load balancing  
- Spring Boot Actuator `/health` endpoints  
- Log rotation and teardown automation  
- Realistic microstack for interview demos  

---

## Architecture

```plaintext
            ┌───────────────────────┐
            │      NGINX Proxy      │
            │  (Reverse Proxy + LB) │
            └──────────┬────────────┘
                       │
         ┌─────────────┴─────────────┐
         │                           │
┌──────────────────┐       ┌──────────────────┐
│ Spring Boot App1 │       │ Spring Boot App2 │
│  (Actuator + DB) │       │  (Actuator + DB) │
└──────────────────┘       └──────────────────┘
         │                           │
         └─────────────┬─────────────┘
                       │
             ┌──────────────────┐
             │   PostgreSQL DB  │
             │ (appdb, appuser) │
             └──────────────────┘
