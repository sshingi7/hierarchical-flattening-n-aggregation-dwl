%dw 2.0
output application/json
---
payload.orders map ((item, index) -> {
    "orderId": item.orderId,
    "customerName": item.customer.name,
    "total": sum(item.items map ($.price * $.quantity))  default 0
})