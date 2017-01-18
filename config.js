exports.conf = {
    db: {
        host:'mongo',
        port: '27017',
        name: 'Shadowsocks-Manager',
        user: '',
        pass: ''
    },
    admin: {
        email:'cnstou@gmail.com',
        password:'xxxx'
    },
    mail: {
        address: 'youremailaddress@gmail.com',
        password: 'yourpassword',
        smtp: 'smtp.gmail.com',
        webaddress:'http://0.0.0.0:3884'
    },
    express: {
        http:3884,
        https:443,
        key: '',
        cert: ''
    }
};
