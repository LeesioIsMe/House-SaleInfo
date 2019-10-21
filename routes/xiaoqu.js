var express = require("express");
var router = express.Router();
var pool = require("../module/mysql").pool;

router.get("/getXiaoqu/:id?", function (req, res) {
    var id = req.params.id || "";
    var pageSize = req.query.pageSize - 0;
    var pageNow = req.query.pageNow - 0;
    var orderBy = req.query.orderBy || "" == "" ? "" : " order by " + orderBy + " desc ";
    var limit = "";
    if (pageSize && pageNow) {
        limit = " limit " + (pageNow - 1) * pageSize + "," + pageSize;
    }
    var where = "";
    if (id == "") {
        id = " 1 = 1 "
    } else {
        id = " cm.id = " + id;
    }
    where = " where " + id + orderBy + limit;
    pool.query({
        sql: "select count(id) count from communities"
    }, (err, count) => {
        if (err) {
            throw err;
        }
        pool.query({
            sql: "select cm.id,cm.name,cm.img,cm.viewNum,cm.perPrice,cm.buildTime,c.name cname from communities cm left join cities c on c.id = cm.cityId " + where
        }, (err, results) => {
            if (err) {
                throw err;
                res.send({
                    code: 201,
                    message: "失败"
                })
                return;
            }

            res.send({
                code: 200,
                message: "成功",
                communities: results,
                count: count[0].count
            })
        })
    })
})
router.get("/getCity", function (req, res) {
    pool.query({
        sql: "select id,name from cities"
    }, (err, results) => {
        res.send({
            code: 201,
            message: "成功",
            cities: results
        })
    })
})

router.get("/search", (req, res, next) => {
    var condation = JSON.parse(req.query.condation) || "";
    var keywords = condation.keywords || "";
    var price = condation.price || "";
    var cityId = condation.cityId - 0 || "";
    var orderBy = condation.orderBy || "";
    if (keywords == "") {
        keywords = " 1 = 1 "
    } else {
        keywords = " cm.name like '%" + keywords + "%' ";
    }
    if (price == "") {
        price = " 1 = 1 "
    } else {
        var priceTemp = price;
        price = " (cm.perPrice " + price[0];
        for (var i = 1; i < priceTemp.length; i++) {
            price += " or cm.perPrice " + priceTemp[i];
        }
        price += ")"
    }
    if (cityId == "") {
        cityId = " 1 = 1 "
    } else {
        cityId = " cityId = " + cityId;
    }
    if (orderBy == "") {
        orderBy = ""
    } else {
        orderBy = " order by " + orderBy + " desc ";
    }
    var where = " where " + cityId + " and " + price + " and " + keywords + orderBy;
    pool.query({
        sql: "select cm.id,cm.name,cm.img,cm.viewNum,cm.perPrice,cm.buildTime,c.name cname from communities cm left join cities c on c.id = cm.cityId " + where
    }, (err, results) => {
        if (err) {
            throw err;
        }
        res.send({
            code: 200,
            message: "成功",
            xiaoqu: results
        })
    })
})
module.exports = router;