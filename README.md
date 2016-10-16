# Systems-Analysis
1.ER图
![image](https://github.com/Koreyoshii/Systems-Analysis/blob/master/ER图.jpg)
*
EID 设备编号
ETID 设备类型编号
EName 设备名称
ETName 设备类型名称
MTtype 保养类型
MTID 保养项目编号
MTitem 保养内容
MTRID 保养记录编号
MTPerson 保养人员
result 保养情况（处理结果）
maID 材料编号
maName 材料名称
quantity 耗材数量

2.查询设备保养结果
select maintain_record.EID,maintain_item.MTitem,
maintain_record.person,maintain_record.result,maintain_record.DATE,
equip_type.ETName,material.maName,material.quantity
from maintain_record,equip_type,maintain_item,material,equip
where maintain_record.EID=001
and material.MTRID=maintain_record.MTRID
and maintain_record.MTID=maintain_item.MTID
and equip.EID=maintain_record.EID
and equip.ETID=equip_type.ETID
![image](https://github.com/Koreyoshii/Systems-Analysis/blob/master/查询语句.jpg)

3.原型截图
![image](https://github.com/Koreyoshii/Systems-Analysis/blob/master/原型1.jpg)
![image](https://github.com/Koreyoshii/Systems-Analysis/blob/master/原型2.jpg)
