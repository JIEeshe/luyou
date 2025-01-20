function updateStatus() {
    fetch('/cgi-bin/status')
        .then(response => response.json())
        .then(data => {
            document.getElementById('cpu-usage').textContent = data.cpu + '%';
            document.getElementById('memory-usage').textContent = data.memory + '%';
            document.getElementById('uptime').textContent = data.uptime;
            document.getElementById('wan-ip').textContent = data.wan_ip;
            document.getElementById('download-speed').textContent = data.download + ' MB/s';
            document.getElementById('upload-speed').textContent = data.upload + ' MB/s';
        })
        .catch(error => console.error('Error:', error));
}

// 每5秒更新一次状态
setInterval(updateStatus, 5000);
updateStatus(); // 初始更新 