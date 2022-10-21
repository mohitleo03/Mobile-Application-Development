// one order for one product or single order for multiple produycts if a user buy more than a type of product at one time??
order = {
  order_id:"same as document id of database",
  products: [
    {
      product_id: "same as document id of product object in database",
      quantity: "qty of products purchased",
    },
    {
      product_id: "same as document id of product object in database",
      quantity: "qty of products purchased",
    },
    {
      product_id: "same as document id of product object in database",
      quantity: "qty of products purchased",
    }
  ],
  user_emailid: "user email id",
  price: "price paid",
  order_status: "PENDING/CANCELLED/DELIVERED", //on the time of order the order will be in Pending state
  delivery_address: "some address", //take iput from user
  delivery_zone: "NORTH/SOUTH/EAST/WEST/CENTRAL", //process the address and find out his/her zone
  delivered_by: "id of delivery boy",//get the data from firebase firestore database to get the info/id of the delivery boy of that zone, better if you get the data of delivery boy in starting of order process it will save time of calling the data
  date:"store date"
};
Zones = {
  NORTH: [
    "Himachal Pradesh",
    "Punjab",
    "Uttarakhand",
    "Uttar Pradesh",
    "Haryana",
  ],
  SOUTH: ["Andhra Pradesh", "Karnataka", "Kerala", "Tamil Nadu"],
  EAST: ["Bihar", "Orissa", "Jharkhand", "West Bengal"],
  WEST: ["Rajasthan", "Gujarat", "Goa", "Maharashtra"],
  CENTRAL: ["Madhya Pradesh", "Chhattisgarh"],
  "NORTH-EAST": [
    "Assam",
    "Sikkim",
    "Nagaland",
    "Meghalaya",
    "Manipur",
    "Mizoram",
    "Tripura",
    "Arunachal Pradesh",
  ],
};
