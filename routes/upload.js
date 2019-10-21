var express = require("express");
var path = require("path");
var router = express.Router();
var multer = require("multer");
var imgPath = "";
var storage = multer.diskStorage({
    destination: path.join(path.resolve(__dirname + "/../public/"), "/upload/"),
    filename: function (req, file, callback) {
        var extendName = file.originalname.substr(file.originalname.lastIndexOf("."));
        var nameSpace = [".jpg", ".jepg", ".png", ".webp"];
        nameSpace.indexOf(extendName) == -1
        var newFileName = Date.now() + "-" + req.cookies.account + "-" + file.originalname;
        imgPath = "/upload/" + newFileName;
        callback(null, newFileName);
    }
})
var upload = multer({ storage: storage });

router.post("/uploadImg", upload.single("file"), (req, res, next) => {
    res.send({
        code: 200,
        message: "上传成功",
        imgPath
    })
})

module.exports = router;