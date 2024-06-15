<!-- 蓝色简洁登录页面 -->
<template>
	<view class="t-login">
		<!-- 页面装饰图片 -->
		<image class="img-a" src="https://zhoukaiwen.com/img/loginImg/2.png"></image>
		<image class="img-b" src="https://zhoukaiwen.com/img/loginImg/3.png"></image>
		<!-- 标题 -->
		<view class="t-b">{{ title }}</view>
		<view class="t-b2">页面传递UI</view>
		<form class="cl">
			<view class="t-a">
				<image src="https://zhoukaiwen.com/img/loginImg/sj.png"></image>
				<view class="line"></view>
				<input type="text" name="phone" placeholder="请输入手机号" maxlength="11" v-model="phone" />
			</view>
			<view class="t-a">
				<image src="https://zhoukaiwen.com/img/loginImg/yz.png"></image>
				<view class="line"></view>
				<input type="text" name="passwd" placeholder="请输入密码" maxlength="15" v-model="passwd" />
			</view>
			<button @tap="login()">登 录</button>
		</form>
	</view>
</template>
<script>
	export default {
		data() {
			return {
				title: 'Login', 
				phone: '', 
				passwd: '' ,
				imagePaths: [
					'../../static/image/MyName.png',
					"../../static/image/超人牛IP.png",
					'../../static/image/超人熊猫IP.png',
					'../../static/image/超人大象IP.png'
				],
			};
		},
		onShow() {
			const userInput = uni.getStorageSync('userInput');  
			 if (userInput) {  
			   this.phone = userInput;  
			 }  
		},
		
		methods: {
			login() {
				var that = this;
				if (!that.phone || !that.passwd) {
					uni.showToast({ title: '手机号和密码都不能为空', icon: 'none' });
					return;
				}
				
				// 发送登录请求到后端API
				uni.request({
					url: 'http://localhost:3000/info', 
					method: 'GET',
					data: {
						phone: that.phone,
						passwd: that.passwd,
					},
					success: (res) => {
						if (res.statusCode === 200 || res.statusCode === 304) {
							const data = res.data;
							if (data && data.success) {
								// 登录成功
								const username = data.data.name;
								const imagePathsStr = encodeURIComponent(JSON.stringify(that.imagePaths));
								uni.showToast({ title: '登录成功！', icon: 'none' })
								that.phone = ''; // 添加这行来清空手机号输入框
								that.passwd = ''; // 添加这行来清空密码输入框
								uni.navigateTo({
									url: `../pages/index/index?username=${encodeURIComponent(username)}&imagePaths=${imagePathsStr}`,
								})
								uni.setStorage({
									key: 'userInfo', 
									data: {
										phone: that.phone,
										passwd: that.passwd, // 同样，不建议存储明文密码
										username: username, // 新增：存储用户名
									},
									success: function() {
										console.log("存储成功！");
									},
								})
							} else if (data.message) {
								// 后端返回了错误信息，可能是账号密码错误
								uni.showToast({ title: data.message, icon: 'none' });
							} else {
								uni.showToast({ title: '登录失败，未知错误', icon: 'none' });
							}
						} else {
							uni.showToast({ title: '服务器响应数据格式异常', icon: 'none' });
						}
					},
					fail: (err) => {
						uni.showToast({ title: '网络请求失败，请检查网络', icon: 'none' });
						
					}
				});
			}
		}
	};
</script>
<style>
	.img-a {
		position: absolute;
		width: 100%;
		top: -150rpx;
		right: 0;
	}
	.img-b {
		position: absolute;
		width: 50%;
		bottom: 0;
		left: -50rpx;
		/* margin-bottom: -200rpx; */
	}
	.t-login {
		width: 650rpx;
		margin: 0 auto;
		font-size: 28rpx;
		color: #000;
	}

	.t-login button {
		font-size: 28rpx;
		background: #5677fc;
		color: #fff;
		height: 90rpx;
		line-height: 90rpx;
		border-radius: 50rpx;
		box-shadow: 0 5px 7px 0 rgba(86, 119, 252, 0.2);
	}

	.t-login input {
		padding: 0 20rpx 0 120rpx;
		height: 90rpx;
		line-height: 90rpx;
		margin-bottom: 50rpx;
		background: #f8f7fc;
		border: 1px solid #e9e9e9;
		font-size: 28rpx;
		border-radius: 50rpx;
	}

	.t-login .t-a {
		position: relative;
	}

	.t-login .t-a image {
		width: 40rpx;
		height: 40rpx;
		position: absolute;
		left: 40rpx;
		top: 28rpx;
		/* border-right: 2rpx solid #dedede; */
		margin-right: 20rpx;
	}
	.t-login .t-a .line{
		width: 2rpx;
		height: 40rpx;
		background-color: #dedede;
		position: absolute;
		top: 28rpx;
		left: 98rpx;
	}

	.t-login .t-b {
		text-align: left;
		font-size: 46rpx;
		color: #000;
		padding: 300rpx 0 30rpx 0;
		font-weight: bold;
	}
	.t-login .t-b2 {
		text-align: left;
		font-size: 32rpx;
		color: #aaaaaa;
		padding: 0rpx 0 120rpx 0;
	}

	.t-login .t-c {
		position: absolute;
		right: 22rpx;
		top: 22rpx;
		background: #5677fc;
		color: #fff;
		font-size: 24rpx;
		border-radius: 50rpx;
		height: 50rpx;
		line-height: 50rpx;
		padding: 0 25rpx;
	}

	.t-login .t-d {
		text-align: center;
		color: #999;
		margin: 80rpx 0;
	}

	.t-login .t-e {
		text-align: center;
		width: 250rpx;
		margin: 80rpx auto 0;
	}

	.t-login .t-g {
		float: left;
		width: 50%;
	}

	.t-login .t-e image {
		width: 50rpx;
		height: 50rpx;
	}

	.t-login .t-f {
		text-align: center;
		margin: 200rpx 0 0 0;
		color: #666;
	}

	.t-login .t-f text {
		margin-left: 20rpx;
		color: #aaaaaa;
		font-size: 27rpx;
	}

	.t-login .uni-input-placeholder {
		color: #000;
	}

	.cl {
		zoom: 1;
	}

	.cl:after {
		clear: both;
		display: block;
		visibility: hidden;
		height: 0;
		content: '\20';
	}
</style>
