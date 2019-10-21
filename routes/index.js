var express = require('express');
var router = express.Router();
var pool = require("../module/mysql").pool;

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('index', { title: 'Express' });
});

router.post("/search", (req, res, next) => {
  // var keywords = req.body.keywords;
  // var operateType = req.body.operateType;
  var condation = JSON.parse(req.body.condation);
  console.log(condation)
  var keywords = condation.keywords;
  var operateType = condation.operateType;
  var communityId = condation.communityId;
  var cityId = condation.cityId;
  var area = condation.area;
  var price = condation.price;
  var roomType = condation.roomType;
  var special = condation.special;
  var type = condation.type;
  var orderBy = condation.orderby;
  if (keywords == "") {
    keywords = " 1 = 1 "
  } else {
    keywords = " ( cm.name like '%" + keywords + "%' or c.name like '%" + keywords + "%' )"
  }
  if(operateType == "" && operateType != 0){
    operateType = " 1 = 1 "
  }else{
    operateType = " h.operateType = " + operateType;
  }
  console.log("--------------" + operateType)
  if (communityId == "") {
    communityId = " 1 = 1 "
  } else {
    communityId = " h.communityId = " + communityId;
  }
  // console.log(communityId)
  if (cityId == "") {
    cityId = " 1 = 1 "
  } else {
    cityId = " h.cityId = " + cityId;
  }
  // console.log(cityId)
  if (area.length == 0) {
    area = " 1 = 1 "
  } else {
    var areaTemp = area;
    area = " ( ( h.area " + areaTemp[0] + " ) ";
    for (var i = 1; i < areaTemp.length; i++) {
      area += " or ( h.area " + areaTemp[i] + " ) "
    }
    area += " ) "
  }
  // console.log(area)
  if (price.length == 0) {
    price = " 1 = 1 "
  } else {
    var priceTemp = price;
    price = " ( ( h.price " + priceTemp[0] + " ) ";
    for (var i = 1; i < priceTemp.length; i++) {
      price += " or (h.price " + priceTemp[i] + " ) "
    }
    price += " ) "
  }
  // console.log(price)
  if (roomType.length == 0) {
    roomType = " 1 = 1 "
  } else {
    var roomTypeTemp = roomType
    roomType = " ( ( h.roomType " + roomTypeTemp[0] + " ) ";
    for (var i = 1; i < roomTypeTemp.length; i++) {
      roomType += " or ( h.roomType " + roomTypeTemp[i] + " ) "
    }
    roomType += " ) "
  }
  // console.log(roomType)
  if (special.length == 0) {
    special = " 1 = 1 "
  } else {
    var specialTemp = special;
    special = " ( ( h.special like '%" + specialTemp[0] + "%' ) ";
    for (var i = 1; i < specialTemp.length; i++) {
      special += " or ( h.special like '%" + specialTemp[i] + "%' ) "
    }
    special += " ) "
  }
  // console.log(special)
  if (type.length == 0) {
    type = " 1 = 1 "
  } else {
    type = " h.type in (" + type + ")"
  }

  if (orderBy == "") {
    orderBy = " ";
  } else {
    orderBy = (orderBy == "perPrice" ? " order by h.price/h.area " : " order by h." + orderBy) + " desc ";
  }
  // console.log(type)
  var where = " where " + operateType + " and " + keywords + " and " + communityId + " and " + cityId + " and " + area + " and " + price + " and " + roomType + " and " + special + " and " + type + orderBy;
  console.log(where)
  pool.query({
    sql: "select h.id,h.communityId,h.cityId,h.img,h.area,h.roomType,h.hallType,h.toiletType,h.type,h.price,h.special,h.userId,h.registerTime,h.operateType,c.name cname,cm.name cmname,cm.perPrice from houses h inner join house_operate ho on h.operateType = ho.status and h.id = ho.houseId left join communities cm on h.communityId = cm.id left join cities c on h.cityId = c.id " + where,
    values: [operateType]
  }, (err, results) => {
    if (err) {
      throw err;
      res.send({
        code: 201,
        message: "错误",
      })
      return;
    }
    res.send({
      code: 200,
      message: "成功",
      houses: results
    })
  })
})


module.exports = router;
