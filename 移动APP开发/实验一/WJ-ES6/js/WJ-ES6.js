var Students = new Map()
var Course1 = new Map()
Course1.set("高数",99)
Course1.set("操作系统",89)
Course1.set("计算机组成原理",88)
Course1.set("线性代数",90)
Course1.set("C++",69)
var Course2 = new Map()
Course2.set("高数",89)
Course2.set("计算机网络原理",88)
Course2.set("操作系统",90)
Course2.set("线性代数",100)
Course2.set("English",76)
Students.set("202108060918",Course1)
Students.set("202108060915",Course2)

export default{
	myname:"WangJun",
	Student:Students
}