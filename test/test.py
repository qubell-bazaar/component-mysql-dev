import os
import pymysql

from test_runner import BaseComponentTestCase
from qubell.api.private.testing import BaseTestCase, instance, workflow, values


class MysqlTestCase(BaseComponentTestCase):
    name = "mysql-component"
    apps = [{
        "name": name,
        "file": os.path.join(os.path.dirname(__file__), '../component-mysql-dev.yml')
    }]

    @instance(byApplication=name)
    @values({"db-port": "port", "db-host": "host"})
    def test_port(self, instance, host, port):
        import socket

        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        result = sock.connect_ex((host, port))

        assert result == 0

    @instance(byApplication=name)
    @workflow("management.create-db", {"db-name": "test_component"})
    @workflow("management.change-grants", {
        "app-hosts": '["%"]',
        "db-name": "test_component",
        "db-user": "test",
        "db-password": "123",
        "privileges": '["ALL"]'
    })
    @values({"db-port": "port", "db-host": "host"})
    def test_create_database(self, instance, host, port):
        conn = pymysql.connect(host=host, port=port, user='test', passwd='123', db='test_component')

        cur = conn.cursor()

        cur.execute("SELECT 1")

        cur.fetchall()

        cur.close()
        conn.close()
