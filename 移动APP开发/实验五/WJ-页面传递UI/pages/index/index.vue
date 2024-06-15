<template>  
  <view class="bordered-container">  
    <image   
      class="avatar"   
      :src="currentAvatar"  
      mode="aspectFit"  
      @tap="changeAvatar"  
    ></image>  
    <view class="text-container">  
      <text class="username">{{receivedName}}</text>  
    </view>  
  </view>  
  <view class="input-container">
      <input class="user-input" maxlength="11" placeholder="请输入内容" v-model="userInput" />
      <button class="submit-btn" @tap="submitContent">提交</button>
    </view>
  <view class="container">
  		<uni-section title="选择图片" type="line">
  			<view class="example-body">
  				<uni-file-picker limit="3" title="最多选择3张图片"></uni-file-picker>
  			</view>
  		</uni-section>
  		<uni-section title="选择视频" type="line">  
  		    <uni-file-picker  
			  limit="9"
  		      file-mediatype="video"
			  title="最多选择9个视频"
  		      @select="handleSelect"  
  		    ></uni-file-picker>  
  		    <video  
  		      :src="videoSrc"  
  		      controls  
  		    ></video>  
  		  </uni-section>  
  		<uni-section title="选择文件" type="line">
  			<view class="example-body">
  				<uni-file-picker limit="5" file-mediatype="all" title="最多选择5个文件"></uni-file-picker>
  			</view>
  		</uni-section>
  	</view>
</template>  

<script>
export default {
  data() {
    return {
      receivedName: '',
      imagePaths: [],
	  videoSrc: '',
      currentAvatarIndex: 0, 
	  imageStyles: {
	  					width: 64,
	  					height: 64,
	  					border: {
	  						radius: '50%'
	  					}
	  				},
	  				listStyles: {
	  					// 是否显示边框
	  					border: true,
	  					// 是否显示分隔线
	  					dividline: true,
	  					// 线条样式
	  					borderStyle: {
	  						width: 1,
	  						color: 'blue',
	  						style: 'dashed',
	  						radius: 2
	  					}
	  				}
    };
  },
  onLoad(options) {
    this.receivedName = decodeURIComponent(options.username);
    try {
      this.imagePaths = JSON.parse(decodeURIComponent(options.imagePaths));
      if (this.imagePaths.length > 0) {
        this.currentAvatar = this.imagePaths[0];
      }
    } catch (error) {
      console.error('解析图片路径失败', error);
    }
	
  },
  computed: {
    currentAvatar() {
      return this.imagePaths.length > 0 ? this.imagePaths[this.currentAvatarIndex] : '';
    },
  },
  methods: {
	   handleSelect(e) {  
	        if (e.detail.files && e.detail.files.length > 0) {  
	          const file = e.detail.files[0];  
	          this.videoSrc = file.url || file.path;  
	        }  
	      } ,
    changeAvatar() {
      if (this.imagePaths.length > 1) { // 至少有两个图片才切换
        this.currentAvatarIndex = (this.currentAvatarIndex + 1) % this.imagePaths.length;
      }
    },
    // 可选：直接设置特定图片为头像
    setCurrentAvatar(imgPath) {
      this.currentAvatar = imgPath;
    },
	submitContent() {
	  uni.setStorageSync('userInput', this.userInput);
	  uni.navigateBack();
	},
  },
};
</script>
<style lang="scss">
	.example-body {
		padding: 10px;
		padding-top: 0;
	}

	.custom-image-box {
		/* #ifndef APP-NVUE */
		display: flex;
		/* #endif */
		flex-direction: row;
		justify-content: space-between;
		align-items: center;
	}

	.text {
		font-size: 14px;
		color: #333;
	}
	.bordered-container {  
	  /* 添加边框样式和背景色 */  
	  border: 4rpx solid #ccc;  
	  border-radius: 10rpx;  
	  padding: 15rpx;  
	  background-color: #F6F6F6;  
	  display: flex;  
	  flex-direction: column; /* 改为垂直堆叠 */  
	  align-items: center; /* 如果需要整个容器垂直居中，否则可以移除 */  
	  justify-content: flex-start; /* 从顶部开始布局 */  
	  width: 100%;  
	}  

	.avatar-container {
	  /* 保持原有样式，但不再需要垂直居中设置，因为这将由.bordered-container控制 */
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	  width: 100%;
	  height: auto;
	  
	}

	/* 如果需要调整头像大小或样式 */
	.avatar {
	  width: 200rpx;
	  height: 110rpx;
	  border-radius: 50%;
	}

	/* 文本容器样式，确保与头像对齐并提供间距 */
	.text-container {
	  margin-top: 20rpx; /* 调整此值以改变姓名与头像之间的间距 */
	  background-color: #F6F6F6;
	  padding: 15rpx;
	}

	/* 文本样式 */
	.username {
	  font-size: 30rpx;
	  color: #333;
	  font-weight: bold;
	  text-align: center;
	}
	.input-container {
	  display: flex;
	  align-items: center;
	  margin: 15px 10px;
	}
	
	.user-input {
	  flex: 1;
	  height: 40px;
	  padding: 0 10px;
	  border: 1px solid #ddd;
	  border-radius: 5px;
	  margin-right: 10px; /* 添加右边距以便和按钮之间有空间 */
	}
	
	.submit-btn {
	  height: 40px;
	  background-color: #5677fc;
	  color: #fff;
	  border-radius: 5px;
	  text-align: center;
	  line-height: 40px;
	  padding: 0 20px; /* 调整按钮内部的左右padding以适应美观 */
	}
</style>
