# Turbohook

This project is a POC to implement a solution to webhook escalably and flexibly.

## Project Structure

```
 API - (Publish) -> RabbitMQ - (Consumer) -> Dispasher - (POST /callback) -> Client
  |
Sidkiq
```

- **API**: Service that inform the structure, using async job for publisher a item to queue.
- **Sidkiq**: Async jobs
- **RabbitMQ**: Manager queues
- **Dispasher**: Service that consumer queue and send webhook request to client.

## Context

We are in a delivery management system. And we will implement outbound notifications for delivery and when the order is delivered.
Our customer will register the delivery follow-up on their website.

## Flow

1. Register the order
2. Notify that the order is out for delivery
3. Notify that the order has been delivered

## Getting settings

_WIP_

