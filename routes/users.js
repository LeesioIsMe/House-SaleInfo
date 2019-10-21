var express = require('express');
var router = express.Router();
var pool = require("../module/mysql").pool;


/* GET users listing. */
router.get('/', function (req, res, next) {
  res.send('respond with a resource');
});

router.post("/register", function (req, res, next) {
  var account = req.body.account;
  var password = req.body.password;
  var trueName = req.body.trueName;
  console.log(trueName)
  var email = req.body.email;
  console.log(account + password + trueName + email)
  var checkAccount = /^[A-z]{1}[A-z0-9]{4,17}/;
  var checkPassword = /^[A-z0-9_]{5,18}/;
  var checkEmail = /[A-z0-9]{1,10}@\w{2,4}.com/;
  var date = new Date();
  var id = Date.now() + "ACOUNT" + account;
  console.log(checkAccount.test("admin"))
  if (!checkAccount.test(account)) {
    res.send({ code: 201, message: "用户名为以字母开头的5到17位字符串" });
    return;
  } else if (!checkPassword.test(password)) {
    res.send({ code: 201, message: "密码错误（请输入5-18位字母、数字、下划线组成的字符串）" });
    return;
  } else if (!checkEmail.test(email)) {
    res.send({ code: 201, message: "邮箱格式错误！" });
    return;
  } else {
    pool.query({
      sql: "select id from users where account = ?",
      values: [account]
    }, (err, results) => {
      if (err) {
        throw err;
        res.send({
          code: 201,
          message: "操作失败"
        })
        return;
      } else if (results.length > 0) {
        res.send({
          code: 201,
          message: "此账号已注册"
        })
        return;
      } else {
        pool.query({
          sql: "insert into users(id,account,password,trueName,email,registerTime) values(?,?,?,?,?,?)",
          values: [id, account, password, trueName, email, date]
        }, (err, result) => {
          if (err) {
            throw err;
            res.send({
              code: 201,
              message: "操作失败"
            })
            return;
          }
          console.log(result);
          res.send({
            code: 200,
            message: "注册成功"
          })
        })
      }
    })
  }
})

router.post("/login", function (req, res, next) {
  var account = req.body.account;
  var password = req.body.password;
  pool.query({
    sql: "select id,account,trueName,password,registerTime from users where account = ?",
    values: [account]
  }, (err, results) => {
    if (err) {
      throw err;
    }
    if (results.length == 0) {
      res.send({
        code: 201,
        message: "账号未注册"
      })
      return;
    } else {
      if (results[0].password != password) {
        res.send({
          code: 201,
          message: "用户名或密码错误"
        })
        return;
      }
      res.send({
        code: 200,
        message: "登录成功",
        user: results[0]
      })
    }
  })

})

module.exports = router;
