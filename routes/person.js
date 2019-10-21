var express = require("express");
var router = express.Router();
var pool = require("../module/mysql").pool;
router.get("/getPerson", (req, res) => {
    pool.query({
        sql: "select * from persons"
    }, (err, results) => {
        if (err) {
            throw err;
        }
        res.send({
            code: 200,
            message: "成功",
            persons: results
        })
    })
})


module.exports = router;