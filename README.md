# Switch-Internal-and-External-Network
内外网切换

> 请自行修改 29 行和 42 行的`addr`参数 和 `gateway`参数

### 参数说明：

 - name：网络连接名称，一般为`以太网`, 可在适配器信息查询到

 - source：获取IP的途径。动态获取，则为`dhcp`，手动设置，则为`static`

 - addr：要设置的IP地址

 - mask：子网掩码

 - gateway：网关地址
