# HvGuardDbg 工具说明

## 主要功能
- **虚拟化保护**：基于 **VMX / EPT** 的内存访问控制  
- **调试器防护**：隐藏硬件断点、软件断点、异常过滤等  
- **反反调试**：对抗游戏环境中的 **EAC**、**BattleEye** 检测机制  
- **动态策略控制**：通过 `HvInterface.dll` 导出 API 控制所有行为

默认启用：
   - 隐藏调试断点  
   - 游戏抛异常过滤  
   - EPT 内存访问控制  
   - 调试窗口行为保护 

![游戏测试示意图](84CDA14A62EBEDC63BAC12F9D0CA05C7.png)

![游戏测试示意图](EC02FAD6964DCCBDD04451542041CE8A.jpg)

## 软件界面
![HvGuardDbg 前端界面（Qt Widget）](5C5BEF692B3791B5DDFFB8E50F483DBD.png)

虚拟化参考项目：

HyperDbg：https://github.com/HyperDbg/HyperDbg

hv：https://github.com/jonomango/hv

ps:调试软件不会再次更新 ---滥用检测

