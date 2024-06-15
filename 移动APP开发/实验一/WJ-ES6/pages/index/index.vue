<template>
	<view class="content">
		<image class="logo" src="/static/logo.png"></image>
		<view class="text-area">
			<text class="title">{{title}}</text>
		</view>
	</view>
</template>

<script>
	import WJ from "../../js/WJ-ES6.js"
	let AllStudents = new Set()
	WJ.Student.forEach(function(value,key){
		value.forEach(function(value2,key2){
			if(key=="202108060918"){
				console.log("姓名:王俊，课程:"+key2+"，分数:"+value2)
			}
			else{
				console.log("姓名:刘鑫，课程:"+key2+"，分数:"+value2)
			}
			AllStudents.add(key2)
		})
	})
	AllStudents.forEach(function(value){
		console.log(value)
	})
	var SStudents = [...WJ.Student.keys()]
	var Students1 = new Set([...WJ.Student.get(SStudents[0]).keys()])
	var Students2 = new Set([...WJ.Student.get(SStudents[1]).keys()])
	var CommonCourses = new Set([...Students1].filter(item => Students2.has(item)))
	console.log("公共的课程:")
	CommonCourses.forEach(function(value){
		console.log(value)
	})
	var MustCourse1 = new Set([...Students1].filter(item => !CommonCourses.has(item)))
	console.log("王俊同学的选修课:")
	MustCourse1.forEach(function(value){
		console.log(value)
	})
	var MustCourse2 = new Set([...Students2].filter(item => !CommonCourses.has(item)))
	console.log("刘鑫同学的选修课:")
	MustCourse2.forEach(function(value){
		console.log(value)
	})
	
	let WJ_High_Scores =new Set()
	let QWB_High_Scores = new Set()
	WJ.Student.forEach(function(value,key){
		value.forEach(function(value2,key2){
			if (key=="202108060918")	{
				if(value2>=90){
					WJ_High_Scores.add(key2)
				}
			}
			else{
				if(value2>=90){
					QWB_High_Scores.add(key2)
				}
			}
		})
	})
	console.log("王俊同学满绩点的课程:")
	WJ_High_Scores.forEach(function(value){
		console.log(value)
	})
	console.log("刘鑫同学满绩点的课程:")
	QWB_High_Scores.forEach(function(value){
		console.log(value)
	})
	var time = 0;
	let numberroftime = 3
	var pp = setInterval(function(){
		if(time>numberroftime){
			window.clearInterval(pp)
		}
		time+=1
		console.log(time)
	},1000)

	export default {
		data() {
			return {
				title: 'Hello'
			}
		},
		onLoad() {

		},
		methods: {

		}
	}
</script>

<style>
	.content {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}

	.logo {
		height: 200rpx;
		width: 200rpx;
		margin-top: 200rpx;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 50rpx;
	}

	.text-area {
		display: flex;
		justify-content: center;
	}

	.title {
		font-size: 36rpx;
		color: #8f8f94;
	}
</style>
udents1].filter(value => value>=90))
	console.log("王俊同学满绩点的课程:")