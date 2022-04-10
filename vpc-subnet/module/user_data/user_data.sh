#!/bin/bash

# Install Apache web server
yum update -y
yum install -y httpd
systemctl enable httpd.service
systemctl start httpd

cd /var/www/html

# Create a index.html to serve
cat >> index.html << EOF
<html>

<head>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js">
    </script>

    <style>
        .keep-center {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: aliceblue;
            padding: 10px 20px 10px 20px;
            border-radius: 0.5em;
        }
    </style>

</head>

<body>
    <div class="keep-center">
        <div id="time">
            <h1>Current local date and time: {{ timestamp }}</h1>
        </div>
    </div>
    
    <script type="text/javascript">
        // source: https://stackoverflow.com/q/57289004/11868112
        var vue_det = new Vue({
            el: '#time',
            data: {
                timestamp: ''
            },
            created() {
                this.getNow();
            },
            methods: {
                getNow: function () {
                    const today = new Date();
                    const date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
                    const time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
                    const dateTime = date + ' ' + time;
                    this.timestamp = dateTime;
                }
            },
            mounted: function () {
                setInterval(function () {
                this.getNow()
                }.bind(this), 1000)
            }
        });
    </script>
</body>

</html>
EOF

