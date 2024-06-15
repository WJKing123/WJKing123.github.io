<template>
	<view class="warp">
		<uni-card is-full :is-shadow="false">
			<text class="uni-h6">常用</text>
		</uni-card>
		
		<uni-section title="社交媒体" type="line" padding>
			<uni-grid :column="4" :highlight="true" @change="change">
				<uni-grid-item >
					<view class="grid-item-box" style="background-color: #fff;">
						<uni-icons type="qq" size="30"></uni-icons>
						<text class="text">QQ</text>
					</view>
				</uni-grid-item>
				<uni-grid-item >
					<view class="grid-item-box" style="background-color: #fff;">
						<uni-icons type="weixin" size="30"></uni-icons>
						<text class="text">微信</text>
					</view>
				</uni-grid-item>
				<uni-grid-item >
					<view class="grid-item-box" style="background-color: #fff;">
						<uni-icons type="weibo" size="30"></uni-icons>
						<text class="text">微博</text>
					</view>
				</uni-grid-item>
				<uni-grid-item >
					<view class="grid-item-box" style="background-color: #fff;">
						<uni-icons type="pyq" size="30"></uni-icons>
						<text class="text">朋友圈</text>
					</view>
				</uni-grid-item>
			</uni-grid>
		</uni-section>
		
		<uni-section title="常用功能" type="line" padding>
			<uni-grid :column="4" :highlight="true" @change="change">
				<uni-grid-item>
					<view class="grid-item-box" style="background-color: #fff;">
						<uni-icons type="chat-filled" size="30"></uni-icons>
						<text class="text">信息</text>
					</view>
				</uni-grid-item>
				<uni-grid-item>
					<view class="grid-item-box" style="background-color: #fff;">
						<uni-icons type="phone-filled" size="30"></uni-icons>
						<text class="text">电话</text>
					</view>
				</uni-grid-item>
				<uni-grid-item>
					<view class="grid-item-box" style="background-color: #fff;">
						<uni-icons type="scan" size="30"></uni-icons>
						<text class="text">扫一扫</text>
					</view>
				</uni-grid-item>
				<uni-grid-item>
					<view class="grid-item-box" style="background-color: #fff;">
						<uni-icons type="upload-filled" size="30"></uni-icons>
						<text class="text">上传</text>
					</view>
				</uni-grid-item>
				<uni-grid-item>
					<view class="grid-item-box" style="background-color: #fff;">
						<uni-icons type="navigate-filled" size="30"></uni-icons>
						<text class="text">导航</text>
					</view>
				</uni-grid-item>
				<uni-grid-item>
					<view class="grid-item-box" style="background-color: #fff;">
						<uni-icons type="camera-filled" size="30"></uni-icons>
						<text class="text">拍照</text>
					</view>
				</uni-grid-item>
				<uni-grid-item>
					<view class="grid-item-box" style="background-color: #fff;">
						<uni-icons type="email" size="30"></uni-icons>
						<text class="text">邮件</text>
					</view>
				</uni-grid-item>
				<uni-grid-item>
					<view class="grid-item-box" style="background-color: #fff;">
						<uni-icons type="cloud-download-filled" size="30"></uni-icons>
						<text class="text">下载</text>
					</view>
				</uni-grid-item>
			</uni-grid>
		</uni-section>

		<uni-section title="炫酷动物图片" type="line" padding>
			<!-- 因为swiper特性的关系，请指定swiper的高度 ，swiper的高度并不会被内容撑开-->
			<swiper class="swiper" :indicator-dots="true">
				<swiper-item>
					<uni-grid :column="3" :highlight="true" @change="change">
						<uni-grid-item v-for="(item, index) in list" :index="index" :key="index">
							<view class="grid-item-box">
								<image :src="item.url" class="image" mode="aspectFill" />
								<text class="text">{{ item.text }}</text>
							</view>
						</uni-grid-item>
					</uni-grid>
				</swiper-item>
				<swiper-item>
					<uni-grid :column="3" :highlight="true" @change="change">
						<uni-grid-item v-for="(item, index) in list" :index="index" :key="index">
							<view class="grid-item-box">
								<image :src="item.url" class="image" mode="aspectFill" />
								<text class="text">{{ item.text }}</text>
							</view>
						</uni-grid-item>
					</uni-grid>
				</swiper-item>
				<swiper-item>
					<uni-grid :column="3" :highlight="true" @change="change">
						<uni-grid-item v-for="(item, index) in list" :index="index" :key="index">
							<view class="grid-item-box">
								<image :src="item.url" class="image" mode="aspectFill" />
								<text class="text">{{ item.text }}</text>
							</view>
						</uni-grid-item>
					</uni-grid>
				</swiper-item>
			</swiper>
		</uni-section>
		
		<uni-section title="美食储备" type="line" padding>
			<uni-grid :column="3" :show-border="false" :square="false" @change="change">
				<uni-grid-item v-for="(item ,index) in list1" :index="index" :key="index">
					<view class="grid-item-box">
						<image class="image" :src="item.url" mode="aspectFill" />
						<text class="text">{{item.text}}</text>
						<view v-if="item.badge" class="grid-dot">
							<uni-badge :text="item.badge" :type="item.type" />
						</view>
					</view>
				</uni-grid-item>
			</uni-grid>
		</uni-section>
		
		
	</view>
</template>

<script>
	export default {
		components: {},
		data() {
			return {
				dynamicList: [],
				list: [{
						url: '/static/image/炫酷的老虎.png',
						text: '老虎',
						
					},
					{
						url: '/static/image/狮子头像.png',
						text: '雄狮',
						
					},
					{
						url: '/static/image/熊bear.png',
						text: '熊',
						
					},
					{
						url: '/static/image/赛博朋克狼.png',
						text: '狼',
						
					},
					{
						url: '/static/image/炫酷狐狸头像.png',
						text: '狐狸'
					},
					{
						url: '/static/image/多彩的猫.png',
						text: '猫'
					},
					{
						url: '/static/image/超人大象IP.png',
						text: '大象'
					},
					{
						url: '/static/image/超人牛IP.png',
						text: '牛'
					},
					{
						url: '/static/image/超人熊猫IP.png',
						text: '熊猫'
					}
				],
				list1 :[
					{
						url: '/static/image/橘子水果.png',
						text: '橘子',
						badge: '99',
						type: "success"
					},
					{
						url: '/static/image/西瓜水果.png',
						text: '西瓜',
						badge: '45',
						type: "primary"
					},
					{
						url: '/static/image/火腿肠.png',
						text: '火腿肠',
						badge: '27',
						type: "warning"
					},
					{
						url: '/static/image/牛奶.png',
						text: '牛奶',
						badge: '38',
						type: "info"
					},
					{
						url: '/static/image/巧克力.png',
						text: '巧克力',
						badge: '44',
						type: "primary"
					},
					{
						url: '/static/image/牛肉汉堡美食.png',
						text: '牛肉汉堡',
						badge: '2',
						type: "error"
					},
					{
						url: '/static/image/烤鸡烤肉美食.png',
						text: '烤鸡',
						badge: '0',
						type: "error"
					},
					{
						url: '/static/image/面条.png',
						text: '面条',
						badge: '95',
						type: "success"
					},
					{
						url: '/static/image/肉.png',
						text: '鸭腿',
						badge: '25',
						type :"warning"
					}
				],
			}
		},
		methods: {
			
		}
	}
</script>


<style lang="scss">
	.image {
		width: 80px;
		height: 80px;
	}

	.text {
		font-size: 14px;
		margin-top: 5px;
	}

	.example-body {
		/* #ifndef APP-NVUE */
		// display: block;
		/* #endif */
	}

	.grid-dynamic-box {
		margin-bottom: 15px;
	}

	.grid-item-box {
		flex: 1;
		// position: relative;
		/* #ifndef APP-NVUE */
		display: flex;
		/* #endif */
		flex-direction: column;
		align-items: center;
		justify-content: center;
		padding: 15px 0;
	}

	.grid-item-box-row {
		flex: 1;
		// position: relative;
		/* #ifndef APP-NVUE */
		display: flex;
		/* #endif */
		flex-direction: row;
		align-items: center;
		justify-content: center;
		padding: 15px 0;
	}

	.grid-dot {
		position: absolute;
		top: 10px;
		right: 15px;
		font-size: 0.7em;
	}

	.swiper {
		height: 420px;
	}

	/* #ifdef H5 */
	@media screen and (min-width: 768px) and (max-width: 1425px) {
		.swiper {
			height: 630px;
		}
	}

	@media screen and (min-width: 1425px) {
		.swiper {
			height: 830px;
		}
	}

	/* #endif */
</style>

