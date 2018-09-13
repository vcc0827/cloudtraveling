var DAO = require('../model/DAO')
var stuDAO = {
    getAllStudent:function(callback){
        DAO.DB('select * from stuInfo',[],function(data){
            console.log('数据获取成功！')
            callback(data)
        })
    },
    registeStudent:function(user,callback){
        DAO.DB('insert into userinfo(userName,userPassword,headPic) values(?,?,?)',
            [user.userName,user.userPassword,user.headpic],
            function(data){
                console.log('插入成功！')
            callback(data)
        })
    }
}
module.exports = stuDAO;