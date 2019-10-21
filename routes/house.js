var express = require("express");
var router = express.Router();
var pool = require("../module/mysql").pool;

router.post("/fabu", (req, res) => {
    var community = req.body.community;
    var operateType = req.body.operateType - 0;   // 租房？新房？二手房
    var city = req.body.city - 0;
    var area = req.body.area - 0;
    var imgPath = req.body.imgPath;
    var roomType = req.body.roomType - 0;
    var hallType = req.body.hallType - 0;
    var toiletType = req.body.toiletType - 0;
    var type = req.body.type;
    var price = req.body.price - 0;
    var special = (req.body.subway || "") + (req.body.newdec || "") + (req.body.schhom || "");
    var userId = JSON.parse(req.cookies.user).id;
    var id = Date.now() + city + community + operateType;
    var time = new Date();
    console.log(id + ",1" + community + ",2" + city + ",3" + area + ",4" + roomType + ",5" + hallType + ",6" + toiletType + ",7" + type + ",8" + price + ",9" + userId + ",10" + time + ",11" + operateType + ",12" + special)
    if (!userId) {
        res.send({ code: 202, message: "未授权" });
        return;
    }
    if (!community || !city.toString() || !area.toString() || !roomType.toString() || !hallType.toString() || !toiletType.toString() || !type || !price.toString() || !operateType.toString()) {
        res.send({
            code: 201,
            message: "请将带有*标记的选项填写完整"
        })
        return;
    }

    pool.query({
        sql: "insert into houses(id,communityId,cityId,img,area,roomType,hallType,toiletType,type,price,special,userId,registerTime,operateType) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        values: [id, community, city, imgPath, area, roomType, hallType, toiletType, type, price, special, userId, time, operateType]
    }, (err, result1) => {
        if (err) {
            throw err;
            return;
        }
        var hourseOperateId = "operate" + id;
        pool.query({
            sql: "insert into house_operate(id,isSale,houseId,salerId,status) values(?,?,?,?,?)",
            values: [hourseOperateId, 0, id, userId, operateType]
        }, (err, result2) => {
            if (err) {
                throw err;
                return;
            }
            res.send({
                code: 200,
                message: "成功"
            })
        })
    })
})

router.get("/getHouses/:operateType", (req, res, next) => {
    var operateType = req.params.operateType - 0;
    var pageSize = req.query.pageSize - 0;
    var pageNow = req.query.pageNow - 0;
    var limit = "";
    if (pageSize && pageNow) {
        limit = " limit " + (pageNow - 1) * pageSize + "," + pageSize;
    }
    var orderBy = req.query.orderBy;
    if (orderBy == "perPrice") {
        orderBy = " order by h.price/h.area desc "
    } else {
        orderBy = " order by h.viewNum desc "
    }
    pool.query({
        sql: "select h.id,h.communityId,h.cityId,h.img,h.area,h.roomType,h.hallType,h.toiletType,h.type,h.price,h.special,h.userId,h.registerTime,h.operateType,c.name cname,cm.name cmname,cm.perPrice from houses h inner join house_operate ho on h.operateType = ho.status and h.id = ho.houseId left join communities cm on h.communityId = cm.id left join cities c on h.cityId = c.id where h.operateType = ? and ho.isSale = 0 " + orderBy + limit,
        values: [operateType]
    }, (err, results) => {
        if (err) { throw err; res.send({ code: 201, message: "失败" }); return; }
        res.send({
            code: 200,
            message: "成功",
            houses: results
        })
    })
})

router.get("/getHouse/:id",(req,res,next)=>{
    var id = req.params.id;
    pool.query({
        sql:"select h.id,h.communityId,h.cityId,h.img,h.area,h.roomType,h.hallType,h.toiletType,h.type,h.price,h.special,h.userId,h.registerTime,h.operateType,c.name cname,cm.name cmname,cm.perPrice,p.phone from houses h inner join house_operate ho on h.operateType = ho.status and h.id = ho.houseId left join communities cm on h.communityId = cm.id left join cities c on h.cityId = c.id left join persons p on h.personId = p.id where h.id = ? and ho.isSale = 0 ",
        values:[id]
    },(err,results)=>{
        if(err){
            throw err;
            return;
        }
        res.send({
            code:200,
            message:"成功",
            house:results[0]
        })
    })
})

module.exports = router;