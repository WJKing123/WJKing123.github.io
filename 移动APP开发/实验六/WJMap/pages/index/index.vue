<template>
	<view class="content">
		<view class="page-section page-section-gap">
			<br>
			{{info}}
			<map 
			    scale="18"
				style="width: 100%; height: 300px;" 
				:latitude="latitude" 
				:longitude="longitude" 
				:markers="covers">
			</map>
		</view>
		<view class="t-login">
			<button @click="refresh">刷新</button>
			<form class="cl">
				<view class="t-a">
					<image src="../../static/latitude.png"></image>
					<view class="line"></view>
					<input type="text" name="latitude1" placeholder="请输入纬度" v-model="latitudeInput" />
				</view>
				<view class="t-a">
					<image src="../../static/longitude.png"></image>
					<view class="line"></view>
					<input type="text" name="longitude1" placeholder="请输入经度" v-model="longitudeInput" />
				</view>
				<button @click="updateMapByInput">定位</button>
			</form>
		</view>
		<view>
			<u-toast ref="uToast"/>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				info: "当前位置：长沙理工大学（金盆岭校区）",
				id: 0,
				title: "map",
				latitude: 28.155963,
				longitude: 112.977322,
				address:"长沙理工大学（金盆岭校区）",
				IconPath: '../../static/location.png',
				covers: [
				{address:"长沙理工大学（云塘校区）",latitude: 28.067750,longitude: 113.008943,iconPath: '../../static/locationlocationlocationlocationlocation.png'},
				{address:"湖南致公专修大学",latitude: 26.911197,longitude: 112.65368,iconPath: '../../static/locationlocationlocationlocation.png'},
				{address:"湖南理工学院（南院）",latitude: 29.36626,longitude: 113.125491,iconPath: '../../static/locationlocationlocation.png'},
				{address:" 湖南工业职业技术学院",latitude: 28.163137,longitude: 112.999961,iconPath: '../../static/locationlocation.png'},
				{address:"长沙医学院",latitude: 26.896345,longitude: 112.603148,iconPath: '../../static/location.png'}
				],
				longitudeInput: '',
				latitudeInput: '',
			};
		},
		onLoad() {
			uni.getLocation({
				type:'gcj02',
				success:(res)=>{
					this.$refs.uToast.show({
						title:res.longitude+''+res.latitude,
						type:'success'
					})
				 this.id = (this.id + 1) % this.covers.length;
				 this.iconPath = this.covers[this.id].iconPath;
				 this.latitude = this.covers[this.id].latitude;
				 this.longitude = this.covers[this.id].longitude;
				 this.info = `当前位置：${this.covers[this.id].address}`;
				}
			});
		},
		methods: {
			refresh() {
				uni.getLocation({
					type:'gcj02',
					success:(res)=>{
						this.$refs.uToast.show({
							title:res.longitude+''+res.latitude,
							type:'success'
						})
					 this.id = (this.id + 1) % this.covers.length;
					 this.iconPath = this.covers[this.id].iconPath;
					 this.latitude = this.covers[this.id].latitude;
					 this.longitude = this.covers[this.id].longitude;
					 this.info = `当前位置：${this.covers[this.id].address}`;
					}
				});
			},
			getLocation() {
				uni.getLocation({
					type: 'gcj02',
					success: (res) => {
						this.$refs.uToast.show({
							title: `${res.longitude},${res.latitude}`,
							type: 'success'
						});
						this.latitude = res.latitude;
						this.longitude = res.longitude;
						this.covers[0].latitude = this.latitude;
						this.covers[0].longitude = this.longitude;
						this.covers[0].iconPath = this.IconPath;
						this.info = `当前位置：纬度${this.latitude}, 经度${this.longitude}`;
					}
				});
			},
			updateMapByInput() {
				if (this.longitudeInput && this.latitudeInput) {
					const newLat = parseFloat(this.latitudeInput);
					const newLon = parseFloat(this.longitudeInput);
					if (!isNaN(newLat) && !isNaN(newLon)) {
						this.latitude = newLat;
						this.longitude = newLon;
						this.covers[0].latitude = this.latitude;
						this.covers[0].longitude = this.longitude;
						this.info = `当前位置：纬度${this.latitude}, 经度${this.longitude}`;
						this.$refs.uToast.show({
							title: '已跳转至指定坐标',
							type: 'success'
						});
					} else {
						this.$refs.uToast.show({
							title: '输入的经纬度格式不正确',
							type: 'error'
						});
					}
				} else {
					this.$refs.uToast.show({
						title: '请输入经纬度',
						type: 'warning'
					});
				}
			},
		},
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
	}
	.t-login {
		width: 725rpx;
		margin: 0 auto;
		font-size: 28rpx;
		margin: 10px 4px 4px 4px;
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
		margin-top: 30rpx; 
		margin-bottom: 30rpx;
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
