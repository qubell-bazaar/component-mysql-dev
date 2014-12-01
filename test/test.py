import os
import pymysql

from qubell.api.testing import *

@environment({
    "default": {},
    "AmazonEC2_CentOS_63": {
        "policies": [{
            "action": "provisionVms",
            "parameter": "imageId",
            "value": "us-east-1/ami-eb6b0182"
        }, {
            "action": "provisionVms",
            "parameter": "vmIdentity",
            "value": "root"
        }]
    },
    "AmazonEC2_CentOS_53": {
        "policies": [{
            "action": "provisionVms",
            "parameter": "imageId",
            "value": "us-east-1/ami-beda31d7"
        }, {
            "action": "provisionVms",
            "parameter": "vmIdentity",
            "value": "root"
        }]
    },
    "AmazonEC2_Ubuntu_1204": {
        "policies": [{
            "action": "provisionVms",
            "parameter": "imageId",
            "value": "us-east-1/ami-d0f89fb9"
        }, {
            "action": "provisionVms",
            "parameter": "vmIdentity",
            "value": "ubuntu"
        }]
    },
    "AmazonEC2_Ubuntu_1004": {
        "policies": [{
            "action": "provisionVms",
            "parameter": "imageId",
            "value": "us-east-1/ami-0fac7566"
        }, {
            "action": "provisionVms",
            "parameter": "vmIdentity",
            "value": "ubuntu"
        }]
    }
})
class MysqlTestCase(BaseComponentTestCase):
    name = "component-mysql-dev"
    apps = [{
        "name": name,
        "file": os.path.realpath(os.path.join(os.path.dirname(__file__), '../%s.yml' % name))
    }]

    @instance(byApplication=name)
    @values({"db-port": "port", "db-host": "host"})
    def test_port(self, instance, host, port):
        import socket

        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        result = sock.connect_ex((str(host), int(port)))

        assert result == 0

    @instance(byApplication=name)
    @workflow("mysql.db", {"db-name": "test_component", "db-action": "create"})
    @workflow("mysql.user", {
        "app-hosts": '["%"]',
        "db-name": "test_component",
        "db-user": "test",
        "db-user-password": "123",
        "db-user-privileges": '["ALL"]',
	"user-action": "grant"
    })
    @values({"db-port": "port", "db-host": "host"})
    def test_create_database(self, instance, host, port):
        conn = pymysql.connect(host=str(host), port=int(port), user='test', passwd='123', db='test_component')

        cur = conn.cursor()

        cur.execute("SELECT 1")

        cur.fetchall()

        cur.close()
        conn.close()
