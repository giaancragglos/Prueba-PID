db.productos.aggregate([
  {
      $group: {
          _id: "$categorias",
          total_productos: { $sum: 1 }
      }
  }
]);

/* OUTPUT:
{
  _id: ObjectId('63b9f0a8d1b23c4d1f456701'),
  total_productos: 9
}
{
  _id: ObjectId('63b9f0a8d1b23c4d1f456703'),
  total_productos: 7
}
{
  _id: ObjectId('63b9f0a8d1b23c4d1f456702'),
  total_productos: 9
}
{
  _id: ObjectId('63b9f0a8d1b23c4d1f456704'),
  total_productos: 7
}

*/

db.productos.aggregate([
  {
      $group: {
          _id: "$categorias",
          producto_mas_caro: { $max: "$precio" }
      }
  }
]);

/* OUTPUT:
{
  _id: ObjectId('63b9f0a8d1b23c4d1f456702'),
  producto_mas_caro: 90
}
{
  _id: ObjectId('63b9f0a8d1b23c4d1f456704'),
  producto_mas_caro: 600
}
{
  _id: ObjectId('63b9f0a8d1b23c4d1f456701'),
  producto_mas_caro: 1500
}
{
  _id: ObjectId('63b9f0a8d1b23c4d1f456703'),
  producto_mas_caro: 700
}
*/