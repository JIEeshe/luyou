module("luci.controller.myrouter.status", package.seeall)

function index()
    entry({"admin", "myrouter"}, firstchild(), "MyRouter", 60).dependent=false
    entry({"admin", "myrouter", "status"}, call("action_status"), "Status", 1)
end

function action_status()
    local sys = require "luci.sys"
    local json = require "luci.jsonc"
    
    local status = {
        cpu = sys.exec("top -n1 | grep 'CPU:' | awk '{print $2}'"),
        memory = sys.exec("free | grep Mem | awk '{print int($3/$2 * 100)}'"),
        uptime = sys.uptime(),
        wan_ip = sys.exec("curl -s ip.sb"),
        download = sys.exec("ifconfig eth0 | grep bytes | awk '{print $2}'"),
        upload = sys.exec("ifconfig eth0 | grep bytes | awk '{print $6}'")
    }
    
    luci.http.prepare_content("application/json")
    luci.http.write(json.stringify(status))
end 