 var mysql = require('mysql');
var connection = mysql.createConnection({
    host: 'localhost', //host地址，尽可能写ip地址，写localhost在手机调试的时候连不上
    port:3306, //端口号
    user: 'root', //连接数据库时的账号
    password: '123456',//连接数据库时的密码
    database: 'login' //需要连接的数据库
});
module.exports = connection;
