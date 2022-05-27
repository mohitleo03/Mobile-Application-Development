// one order for one product or single order for multiple produycts if a user buy more than a type of product at one time??
order={   
    "order_id":"same as document id of database (recomended) or you can generate if you need it",
    "product_id":"same as document id of product object in database",
    "quantity":"qty of products purchased",
    "user_emailid":"user email id",
    "price":"price paid",
    "order_status":"Pending/Cancelled/Delivered",//on the time of order the order will be in Pending state
    "delivery_address":"some address",
    "delivery_zone":"NORTH/SOUTH/EAST/WEST/CENTRAL",
    "delivered_by":"id of delivery boy"
}
Zones={
    "NORTH":["Himachal Pradesh", "Punjab", "Uttarakhand" , "Uttar Pradesh", "Haryana"],
    "SOUTH":["Andhra Pradesh", "Karnataka", "Kerala", "Tamil Nadu"],
    "EAST":["Bihar", "Orissa", "Jharkhand", "West Bengal"],
    "WEST":["Rajasthan" , "Gujarat", "Goa" ,"Maharashtra"],
    "CENTRAL":["Madhya Pradesh", "Chhattisgarh"],
    "NORTH-EAST":[ "Assam", "Sikkim", "Nagaland", "Meghalaya", "Manipur", "Mizoram", "Tripura", "Arunachal Pradesh" ]
}
