<template>
	<view>
		<uni-card title="移动网络开发应用" sub-title="布局UI" extra="王俊-WJ" thumbnail="https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/unicloudlogo.png">
			<text>选择正确答案</text>
		</uni-card>
		
		<uni-section title="题目内容:操作系统" type="line" title-color="red" title-font-size="40rpx">
			<uni-card>
				<uni-title type="h2" title="在进程管理中，下列哪一项不是进程的基本状态？" color="#027fff"></uni-title>
				<br>
				<uni-data-checkbox mode="list" icon="right" v-model="value1" :localdata="range1" @change="change"></uni-data-checkbox>
				<view>
					<uni-collapse>
						<uni-collapse-item title="解析">
							<text>{{content1}}</text>
						</uni-collapse-item>
					</uni-collapse>
				</view>
			</uni-card>
		</uni-section>
		
		<uni-section title="题目内容:计算机组成原理" type="line" title-color="red" title-font-size="40rpx" >
			<uni-card>
				<uni-title type="h2" title="在冯·诺依曼结构的计算机中，指令和数据均以二进制形式存放在同一存储器中。执行程序时，若需要从内存中取一条指令并执行，以下说法正确的是：(多选)" color="#027fff"></uni-title>
				<uni-data-checkbox mode="list" icon="right" multiple v-model="value2" :localdata="range2" @change="change"></uni-data-checkbox>
				<view>
					<uni-collapse>
						<uni-collapse-item title="解析">
							<text class="text">{{content2}}</text>
						</uni-collapse-item>
					</uni-collapse>
				</view>
			</uni-card>
		</uni-section>

		<uni-section title="题目内容:人工智能" type="line" title-color="red" title-font-size="40rpx">
			<uni-card>
				<uni-title type="h2" title="在机器学习中，以下哪种技术常用于处理缺失值和异常值？" color="#027fff"></uni-title>
				<uni-data-checkbox mode="list" icon="right" v-model="value3" :localdata="range3" @change="change"></uni-data-checkbox>
			    <view>
			    	<uni-collapse>
			    		<uni-collapse-item title="解析">
			    			<text class="text">{{content3}}</text>
			    		</uni-collapse-item>
			    	</uni-collapse>
			    </view>
			</uni-card>
		</uni-section>
		
		<uni-section title="题目内容:网络安全技术" type="line" title-color="red" title-font-size="40rpx">
			<uni-card>
				<uni-title type="h2" title="以下哪种安全协议主要用于保护Web浏览器与服务器之间的通信安全？" color="#027fff"></uni-title>
				<uni-data-checkbox mode="list" icon="right" v-model="value4" :localdata="range4" @change="change"></uni-data-checkbox>
			    <view>
			    	<uni-collapse>
			    		<uni-collapse-item title="解析">
			    			<text class="text">{{content4}}</text>
			    		</uni-collapse-item>
			    	</uni-collapse>
			    </view>
			</uni-card>
		</uni-section>
	</view>
	
</template>

<script>
	export default {
		data() {
			return {
				value1: -1,
				value2: -1,
				value3: -1,
				value4: -1,
				range1: [
					{"value": 0,"text": "A. 新建态"	},
					{"value": 1,"text": "B. 执行态"},
					{"value": 2,"text": "C. 就绪态"},
					{"value": 3,"text": "D. 静止态"},
					{"value": 4,"text": "E. 终止态"}],
					
				range2: [
					{"value": 0,"text": "A. 指令必须先加载到CPU的寄存器中才能被执行"	},
					{"value": 1,"text": "B. 指令可以直接在内存中被执行"},
					{"value": 2,"text": "C. 指令和数据在内存中的寻址方式完全相同"},
					{"value": 3,"text": "D. 指令和数据均以同样的方式从内存传输到CPU"}],
					
				range3: [
					{"value": 0,"text": "A. 主成分分析"	},
					{"value": 1,"text": "B. 线性回归"},
					{"value": 2,"text": "C. K近邻算法"},
					{"value": 3,"text": "D. 奇异值分解"},
					{"value": 4,"text": "E. 插补"}],
				range4: [
					{"value": 0,"text": "A. Secure Shell (SSH)"},
					{"value": 1,"text": "B. File Transfer Protocol over SSL/TLS (FTPS)"},
					{"value": 2,"text": "C. Internet Protocol Security (IPsec)"},
					{"value": 3,"text": "D. Transport Layer Security (TLS)"}],
				content1: '在进程管理中，进程的基本状态通常包括以下几种：\n\n1. 新建态\n2. 执行态\n3. 就绪态\n4. 等待态\n5. 终止态\n\n因此正确答案为D. 静止态',
			    content2:'A. 指令必须先加载到CPU的寄存器中才能被执行：正确。在冯·诺依曼结构的计算机中，CPU执行指令前通常需要先将指令从内存加载到指令寄存器或指令缓冲器中。\n\nB. 指令可以直接在内存中被执行：错误。内存主要用于存储指令和数据，但实际的指令执行过程发生在CPU内部的各个功能部件（如算术逻辑单元、寄存器等）。因此，指令不能直接在内存中被执行，而需要被加载到CPU中。\n\nC. 指令和数据在内存中的寻址方式完全相同：错误。虽然指令和数据都存储在内存中，并且都使用内存地址进行访问，但在许多计算机体系结构中，对指令和数据的寻址方式可能会有所不同。例如，某些处理器可能有专门的指令Cache和数据Cache，它们的访问机制和替换策略可能不同；或者在分段、分页等内存管理机制下，指令和数据的虚拟地址到物理地址的转换规则也可能有所差异。\n\nD. 指令和数据均以同样的方式从内存传输到CPU：正确。在冯·诺依曼结构的计算机中，无论是指令还是数据，从内存传输到CPU的过程中通常都会经过相同的路径，即通过地址总线指定内存地址，通过数据总线进行数据传输。在这个过程中，CPU可能会利用总线仲裁机制、Cache等手段来优化数据的读取效率，但就基本的数据传输方式而言，指令和数据并无本质区别。\n\n综上所述，正确的选项是 A 和 D。',
				content3:"A. 主成分分析（PCA）：PCA是一种降维技术，主要用于提取数据的主要特征并压缩数据，虽然在处理过程中可能间接涉及对缺失值的敏感性，但它本身并不直接用于处理缺失值或异常值。\n\nB. 线性回归：线性回归是一种预测模型，虽然它可以作为基于模型的插补方法之一来预测缺失值，但“线性回归”本身并不特指缺失值处理技术，而是更广泛地应用于预测问题。\n\nC. K近邻算法（KNN）：KNN同样可以作为一种基于模型的插补方法来估计缺失值，但其主要用途是分类和回归任务，而非直接针对缺失值处理。\n\nD. 奇异值分解（SVD）：SVD是一种矩阵分解技术，主要用于数据降维、特征提取、推荐系统等领域，它本身并不直接用于处理缺失值或异常值，尽管在某些情况下，如在推荐系统中，可以结合SVD处理部分已知的评分数据来推断缺失的评分。\n\nE. 插补插补是专门用来处理缺失值的常见技术，包括使用统计量（如均值、中位数、众数）填充、基于模型（如线性回归、K近邻算法）的插补、以及更复杂的插补方法如多重插补等。这些方法旨在用合理的估计值替换数据集中缺失的值，使得数据集变得完整，便于后续的分析和建模。\n\n因此，正确答案是 E. 插补。",
				content4:"A. Secure Shell (SSH)：SSH是一种网络协议，主要用于加密远程登录会话和命令行交互，以及安全地传输文件。虽然SSH确实提供了强大的安全保护，但它主要应用于服务器管理和远程访问场景，如通过命令行连接到服务器进行管理操作、文件传输等。SSH并不直接用于保护Web浏览器与服务器之间的HTTP(S)通信，即用户通过浏览器访问网页时所发生的交互。\n\nB. File Transfer Protocol over SSL/TLS (FTPS)：FTPS是在FTP（File Transfer Protocol）协议基础上，通过SSL/TLS提供加密和身份验证的安全增强版。FTPS主要用于确保文件传输过程中的安全，特别是对于通过FTP协议上传、下载文件的情况。尽管与Web相关的文件传输可能使用FTPS，但它并不是直接应用于Web浏览器与服务器之间常规HTTP(S)网页请求和响应的通信安全。\n\nC. Internet Protocol Security (IPsec)：IPsec是一种在网络层（IP层）提供安全服务的协议簇，它能够为网络通信提供加密、认证和完整性保护。IPsec主要应用于网络设备之间（如路由器、防火墙等）或主机之间的端到端通信安全，常用于构建VPN（Virtual Private Network）或保护企业内部网络通信。尽管IPsec可以为整个网络流量（包括Web流量）提供安全保障，但它并非专门为Web浏览器与服务器之间的HTTP(S)通信设计的安全协议。\n\nD. Transport Layer Security (TLS)：TLS是目前用于保护Web浏览器与服务器之间通信安全的主流协议。它是SSL（Secure Sockets Layer）协议的继任者，专为在网络应用层之下、传输层之上提供安全服务而设计。当Web浏览器访问HTTPS（HTTP Secure）网站时，浏览器与服务器之间建立的加密连接就是基于TLS协议。TLS通过证书验证服务器身份、提供数据加密（保证数据的私密性）、以及实现消息完整性校验和重放攻击防护，确保Web通信的机密性、完整性和认证性。\n\n综上所述，正确答案是：D. Transport Layer Security (TLS)",
			}
		},
		onLoad() {

		},
		methods: {
			change(e){
				console.log('e:',e);
			}
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
	.text {
			font-size: 14px;
			color: #666;
			line-height: 20px;
		}
	.uni-body{
		font-size: 32rpx;
		color:#333;
		padding: 20rpx 10rpx;
	}
	.title {
		font-size: 36rpx;
		color: #8f8f94;
	}
	
</style>
