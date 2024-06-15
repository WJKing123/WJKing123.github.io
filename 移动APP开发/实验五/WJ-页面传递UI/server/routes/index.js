var express = require('express');
var router = express.Router();

var connection = require('../db/sql.js')
router.get('/info', (req, res) => {
    const { phone, passwd } = req.query;

    // 查询数据库验证用户
    const sql = `SELECT * FROM userinfo WHERE phone=? AND passwd=?`; // 假设users表中存储了用户信息
    connection.query(sql, [phone, passwd], (error, results, fields) => {
        if (error) {
            console.error(error);
            res.status(500).send('Database error.');
            return;
        }

        if (results.length > 0) {
            // 登录成功
			console.log("OK");
			const userName = results[0].name;
            res.json({ success: true, message: '登录成功' ,data: { name: userName}});
        } else {
            // 登录失败
			console.log("NO");
            res.json({ success: false, message: '手机号或密码错误' });
        }
    });
});
module.exports = router;
